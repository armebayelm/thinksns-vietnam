<?php
class MessageAction extends Action
{
	/* 私信 */
	// 私信列表
	public function index($type = 'inbox') {
		$dao = model('Message');

		$list = $dao->getMessageListByUid($this->mid, array(1, 2));
		$this->assign($list);

		// 设置私信为已读
		model('Message')->setMessageIsRead(null, $this->mid);

		$this->setTitle($type = L('my_private_message'));
		$this->display('list');
	}

	// 私信详情
	public function detail()
	{
		$message = model('Message')->isMember($_GET['id'], $this->mid, true);
		if (empty($message))
			$this->error(L('message_notexist'));

		$message['member'] = model('Message')->getMessageMembers($_GET['id'], 'member_uid');
		$message['to']     = $message['member'];
		unset($message['to'][array_search($this->mid, $message['to'])]);

		$this->assign('message', $message);

		$this->assign('type', intval($_GET['type']));
		$this->setTitle(L('message'));
		$this->display();
	}

	public function loadMessage()
	{
		$message = model('Message')->getMessageByListId($_POST['list_id'], $this->mid, $_POST['since_id'], $_POST['max_id']);
		$this->assign('message', $message);
		$this->assign('type', intval($_POST['type']));
		$message['data'] = $message['data'] ? $this->fetch() : null;
		echo json_encode($message);
	}

	public function post() {
		$touid = intval($_GET['touid']);
		$this->assign('touid',$touid);
		$this->display();
	}

	public function doPost() {
		if (!lockSubmit(10)) {
			echo -1;
			exit;
		}
		if (empty($_POST['to']) || empty($_POST['content'])) {
			echo 0;
			exit;
		}
		$to_num = explode(',', $_POST['to']);
		if( sizeof($to_num)>10 ){
			echo '-2';
			exit;
		}
		$res = model('Message')->postMessage($_POST, $this->mid);
		if ($res) {
			echo 1;
		}else {
			echo 0;
		}

		// NO unlockSubmit(); !!!
	}

	public function doReply() {
		if ( !$_POST['id'] || empty($_POST['reply_content']) ) {
			echo 0;
			exit;
		}

		$res = model('Message')->replyMessage( intval($_POST['id']), t($_POST['reply_content']), $this->mid );
		if ($res) {
			echo 1;
		}else {
			echo 0;
		}
	}

	public function doSetIsRead() {
		$res = model('Message')->setMessageIsRead($_POST['ids'], $this->mid);
		if ($res) echo 1;
		else	  echo 0;
	}

	public function doSetIsUnread() {
		/*$res = model('Message')->setMessageIsUnread(t($_POST['ids']));
		if ($res) echo 1;
		else	  echo 0;*/
	}

	public function doDelete() {
		$res = model('Message')->deleteMessageByListId($this->mid, t($_POST['ids']));
		if ($res) echo 1;
		else	  echo 0;
	}

	public function doDeleteSession()
	{
		$res = model('Message')->deleteSessionById($this->mid, t($_POST['ids']));
		if ($res) echo 1;
		else	  echo 0;
	}

	/* 通知 */
	public function notify()
	{
		$list = X('Notify')->get('receive=' . $this->mid, 10);
		// 解析表情
		foreach($list['data'] as $k => $v) {
			$list['data'][$k]['title'] = preg_replace_callback("/\[(.+?)\]/is",replaceEmot,$v['title']);
			$list['data'][$k]['body']  = preg_replace_callback("/\[(.+?)\]/is",replaceEmot,$v['body']);
			$list['data'][$k]['other'] = preg_replace_callback("/\[(.+?)\]/is",replaceEmot,$v['other']);
		}
		$this->assign('userCount', X('Notify')->getCount($this->mid));
		$this->assign($list);
		$this->setTitle(L('notifications'));
		$this->display();
	}

	//应用消息（漫游的邀请）
	public function appmessage() {
		$db_prefix	= C('DB_PREFIX');
		$sql		= "SELECT COUNT(appid) AS count,`appid`,`typename` FROM {$db_prefix}myop_myinvite WHERE `touid`={$this->mid} GROUP BY `appid`";
		$res		= M('')->query($sql);
		$my_count	= array();
		foreach ($res as $v) {
			$my_count[$v['appid']]	= $v;
		}

		//$map['touid']	= $this->mid;
		$res	= M('myop_myinvite')->where($map)->order('appid DESC')->findPage('10');
		unset($map);
		// 将应用消息置为已读
		$appids = getSubByKey($res['data'], 'id');
		$map['touid'] = $this->mid;
		M('myop_myinvite')->where($map)->setField('is_read', '1');
		//修正邀请链接错误问题
		foreach($res['data'] as $k=>$v){
			$myml = '';
			$myml = $v['myml'];
			$myml = str_ireplace(MYOP_URL, '', $myml);
			$myml = str_ireplace('userapp.php', MYOP_URL.'/userapp.php', $myml);
			$myml = preg_replace('/(invite[^\"]*)/', '#', $myml);
			$res['data'][$k]['myml']	=	$myml;
		}
    	$this->assign($res);
    	$this->setTitle(L('app_message'));
		$this->display('appmessage');
	}

	public function deleteMyInvite() {
		$_POST['hash']	= t($_POST['hash']);
		$map['touid']	= $this->mid;
		$map['hash']	= $_POST['hash'];
		if ( M('myop_myinvite')->where($map)->find() && M('myop_myinvite')->where($map)->delete() ) {
			echo 1;
		}else {
			echo 0;
		}
	}

	//删除通知
	function delnotify(){
		$intNotifyId = intval( $_POST['notify_id'] );
		if(M('notify')->where('notify_id='.$intNotifyId.' AND receive='.$this->mid)->delete()){
			echo 1;
		}
	}
}