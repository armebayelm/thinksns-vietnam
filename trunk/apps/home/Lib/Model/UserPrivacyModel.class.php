<?php
	//判断用户是否是黑名单关系
	function isInBlackList($uid,$mid){
		$uid = intval($uid);
		$mid = intval($mid);
		$result = M('user_blacklist')->where("uid=$mid AND fid=$uid")->find();
		return	$result;
	}