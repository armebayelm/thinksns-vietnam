<?php
/**
 * 通行证服务
 *
 * @author daniel <desheng.young@gmail.com>
 */
class PassportService extends Service
{

	/**
	 * 验证用户是否已登录
	 *
	 * 按照session -> cookie的顺序检查是否登陆
	 *
	 * @return boolean 登陆成功是返回true, 否则返回false
	 */
	public function isLogged()
	{
		// 验证本地系统登录
		if (intval($_SESSION['mid']) > 0)
			return true;
		else if ($uid = $this->getCookieUid())
			return $this->loginLocal($uid);
		else
			return false;
	}

	/**
	 * 根据标示符(email或uid)和未加密的密码获取本地用户 (密码为null时不参与验证)
	 *
	 * @param string         $identifier 标示符内容 (为数字时:标示符类型为uid, 其他:标示符类型为email)
	 * @param string|boolean $password   未加密的密码
	 * @return array|boolean 成功获取用户数据时返回用户信息数组, 否则返回false
	 */
	public function getLocalUser($identifier, $password = null)
	{
		if (empty($identifier))
			return false;

		$identifier_type = is_numeric($identifier) ? 'uid' : 'email';
		$user = D('User', 'home')->getUserByIdentifier($identifier, $identifier_type);
		if (!$user)
			return false;
		else if ($password && md5($password) != $user['password'])
			return false;
		else
			return $user;
	}

	/**
	 * 使用本地账号登陆 (密码为null时不参与验证)
	 *
	 * @param string         $email
	 * @param string|boolean $password
	 * @return boolean
	 */
	public function loginLocal($identifier, $password = null, $is_remember_me = false)
	{
		$user = $this->getLocalUser($identifier, $password);
		return $user ? $this->registerLogin($user, $is_remember_me,$password) : false;
	}

	/**
	 * 注册用户的登陆状态 (即: 注册cookie + 注册session + 记录登陆信息)
	 *
	 * @param array   $user
	 * @param boolean $is_remeber_me
	 */
	public function registerLogin(array $user, $is_remeber_me = false,$password = null)
	{
		if (empty($user))
			return false;
		if(isset($password))  {
		    $result = $this->ucLogin($user['email'],$password);
		    if(!$result['user']){
		        return false;
		    }
		    $user = $result['user'];
		}

		if($user && UC_SYNC){
		    $uc_user = ts_get_ucenter_user_ref($user['uid']);
		    echo ($uc_user)?uc_user_synlogin($uc_user['uc_uid']):'';
		}


		$_SESSION['mid']	= $user['uid'];
		$_SESSION['uname']	= $user['uname'];

		if (!$this->getCookieUid()) {
			$expire = $is_remeber_me ? (3600*24*365) : (3600*1);
			cookie('LOGGED_USER', jiami("thinksns.{$user['uid']}"), $expire);

			// 登陆积分
			X('Credit')->setUserCredit($uid, 'user_login');
		}

		$this->recordLogin($user['uid']);

		return $result;
	}

	/**
	 * 注销本地登录
	 */
	public function logoutLocal()
	{
		// 注销session
		unset($_SESSION['mid']);
		unset($_SESSION['uname']);
		unset($_SESSION['userInfo']);

		// 注销cookie
		cookie('LOGGED_USER', NULL);

		// 注销管理员
		unset($_SESSION['ThinkSNSAdmin']);
	}

	/**
	 * 获取cookie中记录的用户ID
	 */
	public function getCookieUid()
	{
		static $cookie_uid = null;
		if (isset($cookie_uid))
			return $cookie_uid;

		$cookie = t(cookie('LOGGED_USER'));
		$cookie = explode('.', jiemi($cookie));
		$cookie_uid = ($cookie[0] !== 'thinksns') ? false : $cookie[1];
		return $cookie_uid;
	}

	/**
	 * 检查是否登陆后台
	 */
	public function isLoggedAdmin()
	{
		return $_SESSION['ThinkSNSAdmin'] == '1';
	}

	/**
	 * 登陆后台
	 *
	 * @param int    $uid      用户ID,不能和email同时为空
	 * @param string $email    用户Email,不能和用户ID同时为空
	 * @param string $password 未加密的密码,不能为空
	 * @return boolean
	 */
	public function loginAdmin($identifier, $password)
	{
		if (empty($identifier) || empty($password))
			return false;

		if (!($user = $this->getLocalUser($identifier, $password))) {
			unset($_SESSION['ThinkSNSAdmin']);
			return false;
		}

		// 检查是否拥有admin/Index/index权限
		if ( service('SystemPopedom')->hasPopedom($user['uid'], 'admin/Index/index', false) ) {
			$_SESSION['ThinkSNSAdmin']	= 1;
			$_SESSION['mid']			= $user['uid'];
			$_SESSION['uname']			= $user['uname'];

			//登录记录
			$this->recordLogin($user['uid']);
			return true;
		} else {
			unset($_SESSION['ThinkSNSAdmin']);
			return false;
		}
	}

	/**
	 * uc登陆或者注册。返回数组
	 * $result['user'] 用户信息。用于ts系统使用
	 * $result['login'] 同步登陆是否成功
	 * @param unknown_type $username
	 * @param unknown_type $password
	 */
	public function ucLogin($username,$password){
		if(isValidEmail($username)){
			$user = service('Passport')->getLocalUser($username,$password);
			if(UC_SYNC && $user['uid']){
				$uc_user_ref = ts_get_ucenter_user_ref($user['uid']);
				if($uc_user_ref['uc_uid']){
					$uc_user = uc_user_login($uc_user_ref['uc_uid'],$password,1);
					if($uc_user[0] == -1 || $uc_user[0] == -2)$uc_user_ref = array();
				}else if($user['uname']){
					$res_checkname = uc_user_checkname($user['uname']);
					if($res_checkname>=-3 && $res_checkname<=-1){
						$error_param = L('username');
					}
					$res_checkemail = uc_user_checkemail($username);
					if($res_checkemail>=-6 && $res_checkemail<= -4){
						$error_param = $error_param?$error_param.L('and_email'):'Email';
					}
					if($error_param){
						$message_data['title']   = L('sync_ucenter').$error_param.L('sign_in_failed');
						$message_data['content'] = L('you_of_site').$error_param.L('ucenter_sign_in_failed').$error_param.L('ucenter_clash').U('home/Account/security').L('ucenter_reset').$error_param.'。';
						$message_data['to'] = $user['uid'];
						model('Message')->postMessage($message_data, M('user')->getField('uid','admin_level=1'));
					}else{
						$uc_uid = uc_user_register($user['uname'],$password,$username);
						ts_add_ucenter_user_ref($user['uid'],$uc_uid,$user['uname']);
						$uc_user[0] = $uc_uid;
					}
				}
			}
		}else{
			if(UC_SYNC){
				$uc_user = uc_user_login($username,$password);
				if($uc_user[0]>0){
					$uc_user_ref = ts_get_ucenter_user_ref('',$uc_user[0]);
					if(!$uc_user_ref){
						// 注册
						if($this->isValidEmail($uc_user['3']) && $this->isEmailAvailable($uc_user['3'])){
							$user['email'] = $uc_user['3'];
						}else{
							$message_data['title']   = L('ucenter_sync_email_clash');
							$message_data['content'] = L('ucenter_email_used').U('home/Account/bind').L('ucenter_reset_email');
						}
						if ( isLegalUsername($uc_user['1']) && !M('user')->where("uname='{$uc_user['1']}'")->count())
							$user['uname'] = $uc_user['1'];
						$user['password']  = md5($uc_user['2']);
						$user['ctime']	   = time();
						$user['is_active'] = 1;
						$user['uid'] = M('user')->add($user);
						if ($user['uid']){
							$reg_from_ucenter = 1;
							ts_add_ucenter_user_ref($user['uid'],$uc_user['0'],$uc_user['1']);

							// 将用户添加到myop_userlog，以使漫游应用能获取到用户信息
							$userlog = array(
								'uid'		=> $user['uid'],
								'action'	=> 'add',
								'type'		=> '0',
								'dateline'	=> time(),
							);
							M('myop_userlog')->add($userlog);

							if(isset($message_data) && !empty($message_data)){
								$message_data['to'] = $user['uid'];
								model('Message')->postMessage($message_data,  M('user')->getField('uid','admin_level=1'));
							}
							//关联操作
							//$this->registerRelation($user['uid']);
						}else{
							$user = array();
						}
					}else{
						if($username != $uc_user_ref['uc_username']){
							ts_update_ucenter_user_ref('',$uc_user_ref['uc_uid'],$username);
						}
						$user = M('user')->where("uid={$uc_user_ref['uid']}")->find();
						if(md5($password) != $user['password']){
							M('user')->where("uid={$uc_user_ref['uid']}")->setField('password', md5($password));
						}
					}
				}
			}else{
				$uc_user_ref = ts_get_ucenter_user_ref('','',$username);
				if($uc_user_ref['uid']){
					$user = service('Passport')->getLocalUser($uc_user_ref['uid'],$password);
				}
			}
		}

        $result['login'] = '';
		if($user){
		    $result['login'] = ( (UC_SYNC && $uc_user[0])?uc_user_synlogin($uc_user[0]):'' );
		}
        $result['user'] = $user;
        $result['reg_from_ucenter'] = $reg_from_ucenter;
        return $result;
	}

	/**
	 * 记录登录信息
	 *
	 * @param int $uid 用户ID
	 */
	public function recordLogin($uid)
	{
		$data['uid']	= $uid;
		$data['ip']		= get_client_ip();
		$data['place']	= convert_ip($data['ip']);
		$data['ctime']	= time();
		M('login_record')->add($data);
	}

	/* 后台管理相关方法 */

	// 运行服务，系统服务自动运行
	public function run(){
		return;
	}
}