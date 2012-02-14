# Sequel Pro dump
# Version 2210
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.48)
# Database: thinksns
# Generation Time: 2010-12-13 14:54:18 +0800
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ts_ad
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_ad`;

CREATE TABLE `ts_ad` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `place` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:中部 1:头部 2:左侧 3:右侧 4:底部',
  `content` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_closable` tinyint(1) NOT NULL DEFAULT '0',
  `ctime` int(11) DEFAULT NULL,
  `mtime` int(11) DEFAULT NULL,
  `display_order` smallint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_app
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_app`;

CREATE TABLE `ts_app` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `app_alias` varchar(255) NOT NULL,
  `description` text,
  `version` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:关闭 1:默认 2:可选',
  `category` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `last_update_date` varchar(255) DEFAULT NULL,
  `host_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：本地应用 1：远程应用',
  `app_entry` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `large_icon_url` varchar(255) DEFAULT NULL,
  `admin_entry` varchar(255) DEFAULT NULL,
  `statistics_entry` varchar(255) DEFAULT NULL,
  `homepage_url` varchar(255) DEFAULT NULL,
  `sidebar_title` varchar(255) DEFAULT NULL,
  `sidebar_entry` varchar(255) DEFAULT NULL,
  `sidebar_icon_url` varchar(255) DEFAULT NULL,
  `sidebar_support_submenu` tinyint(1) NOT NULL DEFAULT '0',
  `sidebar_is_submenu_active` tinyint(1) NOT NULL DEFAULT '0',
  `author_name` varchar(255) DEFAULT NULL,
  `author_email` varchar(255) DEFAULT NULL,
  `author_homepage_url` varchar(255) DEFAULT NULL,
  `contributor_name` text,
  `display_order` smallint(5) NOT NULL DEFAULT '0',
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# Dump of table ts_area
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_area`;

CREATE TABLE `ts_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`area_id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `ts_area` (`area_id`,`title`,`pid`)
VALUES
    (1,'Việt Nam',0),
    (2,'Hà Nội',1),
    (3,'Đà Nẵng',1),
    (4,'Hồ Chí Minh',1);

# Dump of table ts_attach
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_attach`;

CREATE TABLE `ts_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attach_type` varchar(50) NOT NULL DEFAULT 'attach',
  `userId` int(11) unsigned DEFAULT NULL,
  `uploadTime` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `private` tinyint(1) DEFAULT '0',
  `isDel` tinyint(1) DEFAULT '0',
  `savepath` varchar(255) DEFAULT NULL,
  `savename` varchar(255) DEFAULT NULL,
  `savedomain` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_category
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_category`;

CREATE TABLE `ts_category` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cleft` int(11) NOT NULL,
  `cright` int(11) NOT NULL,
  `corder` int(5) NOT NULL DEFAULT '0',
  `namespace` varchar(255) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_comment
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_comment`;

CREATE TABLE `ts_comment` (
  `id` int(11) NOT NULL auto_increment,
  `type` char(15) default NULL,
  `appid` int(11) default NULL,
  `appuid` int(11) default NULL,
  `name` varchar(30) default NULL,
  `uid` int(11) default NULL,
  `comment` text,
  `cTime` int(12) default NULL,
  `toId` int(11) NOT NULL default '0',
  `status` int(1) default '0',
  `quietly` tinyint(1) NOT NULL default '0',
  `to_uid` int(11) NOT NULL default '0',
  `data` text,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`),
  KEY `appid` (`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


# Dump of table ts_document
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_document`;

CREATE TABLE `ts_document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `author_id` int(11) DEFAULT NULL,
  `last_editor_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_on_footer` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在页脚显示',
  `ctime` int(11) DEFAULT NULL,
  `mtime` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`document_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `ts_document` DISABLE KEYS */;
INSERT INTO `ts_document` (`title`,`content`,`author_id`,`last_editor_id`,`is_active`,`is_on_footer`,`ctime`,`mtime`,`display_order`)
VALUES
	('官方社区','http://t.thinksns.com',4,4,1,1,1292213500,1292213500,1),
	('关于我们','&nbsp;&nbsp;&nbsp; ThinkSNS是国内最具潜力的互联网产品服务公司，为客户提供社会化网络产品、技术和服务在内的一系列解决方案和平台化网络建设。<br>&nbsp;&nbsp;&nbsp; ThinkSNS从一开始是就秉承优秀的软件开源思想，注重知识分享和团队协作，以一种开放、共赢、互利和友好的态度面向所有需要ThinkSNS，支持ThinkSNS，喜爱ThinkSNS的个人和社会团体。<br>&nbsp;&nbsp;&nbsp; ThinkSNS不单单是一个人性化的产品，同时也是整个公司灵魂化的象征，我们积聚创新，不断成长和完备，汲取更多先进性的技术革新，创造更具价值的优势产品，为更多ThinkSNS的应用爱好者提供动力支持和技术源泉。',4,4,1,1,1292213562,1292215236,2);

/*!40000 ALTER TABLE `ts_document` ENABLE KEYS */;


# Dump of table ts_expression
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_expression`;

CREATE TABLE `ts_expression` (
  `expression_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'miniblog',
  `emotion` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`expression_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `ts_expression` DISABLE KEYS */;
INSERT INTO `ts_expression` (`expression_id`,`title`,`type`,`emotion`,`filename`)
VALUES
	(1,'拥抱','miniblog','[拥抱]','hug.gif'),
	(2,'示爱','miniblog','[示爱]','kiss.gif'),
	(3,'呲牙','miniblog','[呲牙]','lol.gif'),
	(4,'可爱','miniblog','[可爱]','loveliness.gif'),
	(5,'折磨','miniblog','[折磨]','mad.gif'),
	(6,'难过','miniblog','[难过]','sad.gif'),
	(7,'流汗','miniblog','[流汗]','sweat.gif'),
	(8,'憨笑','miniblog','[憨笑]','biggrin.gif'),
	(9,'大哭','miniblog','[大哭]','cry.gif'),
	(10,'惊恐','miniblog','[惊恐]','funk.gif'),
	(11,'握手','miniblog','[握手]','handshake.gif'),
	(12,'发怒','miniblog','[发怒]','huffy.gif'),
	(13,'惊讶','miniblog','[惊讶]','shocked.gif'),
	(14,'害羞','miniblog','[害羞]','shy.gif'),
	(15,'微笑','miniblog','[微笑]','smile.gif'),
	(16,'偷笑','miniblog','[偷笑]','titter.gif'),
	(17,'调皮','miniblog','[调皮]','tongue.gif'),
	(18,'胜利','miniblog','[胜利]','victory.gif');

/*!40000 ALTER TABLE `ts_expression` ENABLE KEYS */;


# Dump of table ts_feed
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_feed`;

CREATE TABLE `ts_feed` (
  `feed_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `data` text NOT NULL,
  `ctime` int(11) NOT NULL,
  `type` varchar(120) NOT NULL,
  PRIMARY KEY (`feed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_friend
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_friend`;

CREATE TABLE `ts_friend` (
  `friend_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `friend_uid` int(11) NOT NULL,
  `friend_uname` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `message` varchar(255) DEFAULT NULL,
  `ctime` int(11) NOT NULL,
  PRIMARY KEY (`friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_friend_group
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_friend_group`;

CREATE TABLE `ts_friend_group` (
  `friend_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`friend_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_friend_group_link
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_friend_group_link`;

CREATE TABLE `ts_friend_group_link` (
  `uid` int(11) NOT NULL,
  `friend_uid` int(11) NOT NULL,
  `friend_uname` varchar(255) NOT NULL,
  `friend_group_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_invitecode
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_invitecode`;

CREATE TABLE `ts_invitecode` (
  `invite_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `code` varchar(120) NOT NULL,
  `is_used` tinyint(1) NOT NULL,
  `type` char(40) NOT NULL,
  `is_received` tinyint(1) NOT NULL,
  PRIMARY KEY (`invite_code_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_login
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_login`;

CREATE TABLE `ts_login` (
  `login_id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `type_uid` varchar(255) NOT NULL default '',
  `type` char(80) NOT NULL,
  `oauth_token` varchar(150) default NULL,
  `oauth_token_secret` varchar(150) default NULL,
  `is_sync` tinyint(1) NOT NULL,
  PRIMARY KEY  (`login_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_login_record
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_login_record`;

CREATE TABLE `ts_login_record` (
  `login_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`login_record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_message
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_message`;

CREATE TABLE `ts_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `source_message_id` int(255) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_lastest` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_by` int(11) NOT NULL DEFAULT '0',
  `ctime` int(11) NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_myop_friendlog
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_myop_friendlog`;

CREATE TABLE `ts_myop_friendlog` (
  `uid` int(11) NOT NULL,
  `fuid` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `dateline` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_myop_myapp
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_myop_myapp`;

CREATE TABLE `ts_myop_myapp` (
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `narrow` tinyint(1) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `version` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displaymethod` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `flag` (`flag`,`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_myop_myinvite
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_myop_myinvite`;

CREATE TABLE `ts_myop_myinvite` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) NOT NULL DEFAULT '',
  `appid` mediumint(8) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `fromuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `myml` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `hash` int(10) unsigned NOT NULL DEFAULT '0',
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `uid` (`touid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_myop_userapp
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_myop_userapp`;

CREATE TABLE `ts_myop_userapp` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appname` varchar(60) NOT NULL DEFAULT '',
  `privacy` tinyint(1) NOT NULL DEFAULT '0',
  `allowsidenav` tinyint(1) NOT NULL DEFAULT '0',
  `allowfeed` tinyint(1) NOT NULL DEFAULT '0',
  `allowprofilelink` tinyint(1) NOT NULL DEFAULT '0',
  `narrow` tinyint(1) NOT NULL DEFAULT '0',
  `menuorder` smallint(6) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `ext` text,
  KEY `uid` (`uid`,`appid`),
  KEY `menuorder` (`uid`,`menuorder`),
  KEY `displayorder` (`uid`,`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_myop_userappfield
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_myop_userappfield`;

CREATE TABLE `ts_myop_userappfield` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `appid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `profilelink` text NOT NULL,
  `myml` text NOT NULL,
  KEY `uid` (`uid`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_myop_userlog
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_myop_userlog`;

CREATE TABLE `ts_myop_userlog` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `action` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_node
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_node`;

CREATE TABLE `ts_node` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `app_alias` varchar(255) DEFAULT NULL,
  `mod_name` varchar(255) NOT NULL,
  `mod_alias` varchar(255) DEFAULT NULL,
  `act_name` varchar(255) NOT NULL,
  `act_alias` varchar(255) DEFAULT NULL,
  `parent_node_id` int(11) NOT NULL COMMENT '??action',
  `description` text,
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `ts_node` DISABLE KEYS */;
INSERT INTO `ts_node` (`app_name`,`app_alias`,`mod_name`,`mod_alias`,`act_name`,`act_alias`,`parent_node_id`,`description`)
VALUES
	('admin','管理后台','*','全部','*','全部',0,'在“权限管理”中将本节点赋予某个用户组，它就能访问管理后台了');

/*!40000 ALTER TABLE `ts_node` ENABLE KEYS */;


# Dump of table ts_notify
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_notify`;

CREATE TABLE `ts_notify` (
  `notify_id` int(11) NOT NULL auto_increment,
  `from` int(11) NOT NULL,
  `receive` int(11) NOT NULL,
  `type` char(80) NOT NULL,
  `data` text NOT NULL,
  `is_read` tinyint(1) NOT NULL default '0',
  `ctime` int(11) NOT NULL,
  PRIMARY KEY  (`notify_id`),
  KEY `receive` (`receive`,`is_read`),
  KEY `ctime` (`ctime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_space
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_space`;

CREATE TABLE `ts_space` (
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `hit` int(11) unsigned NOT NULL DEFAULT '0',
  `setting` text NOT NULL,
  `credit_score` int(11) unsigned NOT NULL DEFAULT '0',
  `credit_exp` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_system_data
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_system_data`;

CREATE TABLE `ts_system_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `list` char(30) DEFAULT 'default',
  `key` char(50) DEFAULT 'default',
  `value` text,
  `mtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `list` (`list`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `ts_system_data` DISABLE KEYS */;
INSERT INTO `ts_system_data` (`uid`,`list`,`key`,`value`,`mtime`)
VALUES
	(0,'siteopt','site_name','s:36:\"Mạng xã hội thinkPHP Việt Nam\";','2010-11-29 17:40:14'),
	(0,'siteopt','site_slogan','s:33:\"Tôi là thế giới với bạn\";','2010-11-29 17:40:14'),
	(0,'siteopt','site_closed','i:0;','2010-11-29 17:40:14'),
	(0,'siteopt','site_verify','a:1:{i:0;s:8:\"register\";}','2010-11-29 17:40:14'),
	(0,'siteopt','site_user_domain_on','s:1:\"1\";','2010-12-20 18:06:59'),
	(0,'siteopt','site_system_version','s:12:"ThinkSNS 2.5";','2010-12-31 15:46:44'),
	(0,'siteopt','site_system_version_number','s:5:"25367";','2010-12-31 15:46:44'),
	(0,'siteopt','expression','s:8:\"miniblog\";','2010-11-29 17:40:14'),
	(0,'register','register_type','s:4:\"open\";','2010-12-06 12:08:56'),
	(0,'register','register_email_activate','s:1:\"0\";','2010-12-06 12:08:56'),
	(0,'register','register_auto_friend','s:1:\"1\";','2010-12-06 12:08:56'),
	(0,'register','register_realname_check','s:1:\"0\";','2010-11-25 17:33:01'),
	(0,'register','register_lastname_single','s:3582:\"艾,安,昂,敖,奥,巴,霸,白,柏,拜,班,包,保,葆,豹,鲍,暴,卑,贲,毕,闭,秘,边,鞭,彪,别,宾,邴,秉,薄,卜,布,部,才,蔡,仓,苍,操,曹,策,岑,柴,镡,昌,苌,常,昶,畅,唱,晁,巢,朝,车,陈,谌,成,承,晟,乘,程,池,迟,充,种,崇,丑,侴,初,储,楚,禇,揣,啜,春,椿,慈,次,从,丛,爨,崔,萃,寸,达,笪,大,代,戴,丹,但,啖,党,刀,德,邓,狄,翟,邸,底,弟,典,刁,丁,定,东,冬,董,豆,窦,都,堵,杜,度,端,段,敦,顿,多,朵,颚,恩,法,氾,樊,范,方,芳,防,房,费,丰,风,封,酆,冯,逢,凤,奉,俸,伏,扶,苻,服,符,福,付,傅,富,改,盖,干,甘,淦,冮,刚,皋,高,杲,郜,戈,革,合,格,盖,葛,庚,赓,耿,弓,公,宫,龚,巩,贡,勾,缑,苟,勾,辜,古,谷,固,顾,关,官,筦,管,观,贯,冠,光,广,归,妫,邽,炅,炔,贵,桂,滚,过,呙,郭,国,虢,果,哈,海,罕,撖,杭,郝,合,何,和,亻各,贺,赫,黑,亨,恒,衡,弘,闳,宏,鸿,侯,后,郈,厚,呼,轷,狐,胡,壶,虎,户,扈,花,华,滑,华,怀,槐,还,环,郇,桓,宦,皇,黄,回,惠,浑,火,霍,姬,嵇,稽,及,吉,汲,姞,戢,集,藉,籍,纪,计,季,暨,冀,加,家,嘉,郏,甲,贾,坚,菅,检,简,翦,蹇,见,监,江,将,姜,蒋,降,焦,矫,皎,敫,曒,教,接,揭,节,介,金,晋,烬,京,经,荆,井,景,敬,靖,静,酒,局,倶,琚,鞠,菊,巨,剧,隽,圈,角,开,凯,阚,康,亢,伉,柯,可,坑,孔,寇,库,蒯,郐,宽,匡,邝,旷,况,奎,隗,夔,腊,来,赖,兰,蓝,郎,劳,老,乐,雷,冷,离,黎,李,里,力,历,厉,立,励,利,郦,栗,连,廉,练,良,梁,聊,廖,列,林,临,吝,蔺,令,泠,凌,刘,留,柳,龙,隆,娄,楼,卢,庐,鲁,陆,逯,禄,路,闾,吕,律,栾,论,论,罗,洛,骆,雒,麻,马,买,麦,满,莽,毛,茆,茅,冒,枚,梅,门,蒙,孟,弥,祢,糜,米,芈,弭,宓,密,苗,缪,闵,敏,名,万,莫,墨,默,牟,母,木,沐,睦,慕,穆,那,纳,乃,佴,南,铙,倪,年,粘,念,乜,聂,宁,牛,钮,农,侬,区,欧,潘,盘,泮,庞,裴,彭,邳,皮,朴,品,平,繁,蒲,濮,浦,普,溥,柒,戚,漆,亓,齐,祁,歧,綦,乞,杞,启,千,钱,潜,强,乔,桥,谯,且,郄,钦,秦,琴,覃,勤,青,卿,清,庆,丘,邱,秋,仇,求,裘,曲,屈,麴,渠,璩,瞿,蘧,权,全,泉,阙,冉,饶,壬,任,戎,荣,容,茹,汝,阮,软,芮,瑞,洒,撒,萨,伞,桑,沙,山,闪,陕,单,善,商,赏,尚,少,召,邵,折,佘,厍,舍,申,莘,神,沈,生,绳,盛,师,施,石,时,史,士,世,是,奭,首,寿,殳,舒,疏,束,树,耍,帅,双,水,睡,顺,司,思,死,斯,四,佀,姒,松,宋,苏,宿,粟,眭,睢,隋,随,穗,孙,所,索,塔,台,邰,台,太,泰,谈,覃,谭,澹,檀,镡,汤,唐,棠,陶,腾,提,遆,题,帖,铁,通,仝,同,佟,彤,童,钭,徒,涂,屠,土,脱,完,宛,晚,万,汪,王,望,危,韦,维,蒍,隗,位,尉,温,文,闻,问,翁,瓮,邬,巫,毋,吾,吴,伍,仵,武,务,西,析,郗,息,奚,锡,习,席,袭,隰,舄,夏,先,鲜,咸,冼,洗,羡,线,相,香,襄,祥,向,相,项,肖,萧,孝,谢,渫,辛,忻,新,信,兴,星,刑,邢,行,幸,熊,修,须,顼,徐,许,旭,续,轩,禤,旋,薛,穴,雪,寻,郇,荀,押,牙,轧,鄢,燕,延,严,言,阎,颜,晏,扬,羊,阳,杨,仰,幺,要,尧,姚,铫,药,冶,业,叶,伊,衣,依,仪,宜,乙,蚁,扆,弋,义,亦,易,弈,益,裔,翼,阴,殷,银,尹,印,应,英,营,赢,灜,雍,勇,涌,幽,尤,由,游,於,欲,余,鱼,俞,馀,宇,禹,庾,玉,郁,遇,喻,裕,毓,渊,元,袁,原,圆,源,员,苑,院,乐,岳,悦,越,云,妘,郧,运,员,郓,恽,韵,载,昝,臧,迮,笮,曾,增,查,乍,翟,呰,祭,占,詹,瞻,展,战,湛,张,章,彰,仉,掌,招,召,兆,赵,肇,真,甄,镇,正,郑,政,支,执,直,植,志,郅,智,终,钟,衷,种,仲,周,朱,邾,诸,竹,竺,主,祝,专,庄,卓,禚,资,訾,子,紫,宗,邹,驺,俎,祖,左,韩\";','2010-07-29 16:43:04'),
	(0,'register','register_lastname_double','s:3060:\"安陵,安平,安期,安阳,白马,百里,柏侯,鲍俎,北宫,北郭,北门,北山,北唐,奔水,逼阳,宾牟,薄奚薄野,曹牟,曹丘,常涛,长鱼,车非,成功,成阳,乘马,叱卢,丑门,樗里,穿封,淳子,答禄,达勃,达步,达奚,淡台,邓陵,第五,地连,地伦,东方,东里,东南,东宫,东门东乡,东丹,东郭,东陵,东关,东闾,东阳,东野,东莱,豆卢,斗于,都尉,独孤端木,段干,多子,尔朱,方雷丰将,封人,封父,夫蒙,夫馀,浮丘,傅余,干已,高车,高陵,高堂,高阳,高辛,皋落,哥舒,盖楼,庚桑,梗阳,宫孙,公羊,公良,公孙,公罔,公西,公冶,公敛,公梁,公输,公上,公山,公户,公玉,公仪,公仲公坚,公伯,公祖,公乘,公晰,公族,姑布,古口,古龙,古孙,谷梁,谷浑,瓜田,关龙,鲑阳,归海,函治,韩馀,罕井,浩生,浩星,纥骨,纥奚纥于,贺拨,贺兰,贺楼,赫连,黑齿,黑肱,侯冈,呼延,壶丘,呼衍,斛律,胡非,胡母,胡毋,皇甫,皇父,兀官吉白,即墨,季瓜,季连,季孙,茄众,蒋丘,金齿,晋楚,京城,泾阳,九百,九方,睢鸠,沮渠,巨母,勘阻,渴侯,渴单,可汗,空桐,空相,昆吾,老阳,乐羊,荔菲,栎阳,梁丘,梁由,梁馀,梁垣,陵阳伶舟,冷沦,令狐,刘王,柳下,龙丘,卢妃,卢蒲,鲁步,陆费,角里,闾丘,马矢,麦丘,茅夷,弥牟,密革,密茅,墨夷,墨台,万俊,昌顿,慕容,木门,木易,南宫,南郭,南门,南荣,欧侯,欧阳,逄门,盆成,彭祖,平陵,平宁,破丑,仆固,濮阳,漆雕,奇介,綦母,綦毋,綦连,祁连,乞伏,绮里,千代,千乘,勤宿,青阳,丘丽,丘陵,屈侯,屈突,屈男,屈卢,屈同,屈门,屈引,壤四,扰龙,容成,汝嫣,萨孤,三饭,三闾,三州,桑丘,商瞿,上官,尚方,少师,少施,少室,少叔,少正,社南社北,申屠,申徒,沈犹,胜屠,石作石牛,侍其,士季,士弱,士孙,士贞,叔孙,叔先,叔促,水丘,司城,司空,司寇,司鸿,司马,司徒,司士,似和,素和,夙沙,孙阳,索阳,索卢,沓卢,太史,太叔,太阳,澹台,唐山,堂溪,陶丘,同蹄,统奚,秃发,涂钦,吐火,吐贺,吐万,吐罗,吐门,吐难,吐缶,吐浑吐奚,吐和,屯浑,脱脱,拓拨,完颜,王孙,王官,王人,微生,尾勺,温孤,温稽,闻人,屋户,巫马,吾丘,无庸,无钩,五鹿,息夫,西陵,西乞,西钥,西乡,西门,西周,西郭,西方,西野,西宫,戏阳,瑕吕,霞露,夏侯,鲜虞,鲜于,鲜阳,咸丘,相里,解枇,谢丘,新垣,辛垣,信都,信平,修鱼,徐吾,宣于,轩辕,轩丘,阏氏,延陵,罔法,铅陵,羊角,耶律,叶阳,伊祁,伊耆,猗卢,义渠,邑由,因孙,银齿,尹文,雍门,游水,由吾,右师,宥连,於陵,虞丘,盂丘,宇文,尉迟,乐羊,乐正,运奄,运期,宰父,辗迟,湛卢,章仇,仉督,长孙,长儿,真鄂,正令,执头,中央,中长,中行,中野,中英,中梁,中垒,钟离,钟吾,终黎,终葵,仲孙,仲长,周阳,周氏,周生,朱阳,诸葛,主父,颛孙,颛顼,訾辱,淄丘,子言,子人,子服子家,子桑,子叔,子车,子阳,宗伯,宗正,宗政,尊卢,昨和,左人,左丘,左师,左行,刘文,额尔,达力,蔡斯,浩赏,斛斯,夹谷,揭阳,万俟,淳于,单于,徐离\";','2010-07-29 16:43:04'),
	(0,'register','__hash__','s:32:\"f81cb2f2175eaa0a59d1a48d2cd6dadb\";','2010-12-06 12:08:56'),
	(0,'register','register_lastname','s:6643:\"艾,安,昂,敖,奥,巴,霸,白,柏,拜,班,包,保,葆,豹,鲍,暴,卑,贲,毕,闭,秘,边,鞭,彪,别,宾,邴,秉,薄,卜,布,部,才,蔡,仓,苍,操,曹,策,岑,柴,镡,昌,苌,常,昶,畅,唱,晁,巢,朝,车,陈,谌,成,承,晟,乘,程,池,迟,充,种,崇,丑,侴,初,储,楚,禇,揣,啜,春,椿,慈,次,从,丛,爨,崔,萃,寸,达,笪,大,代,戴,丹,但,啖,党,刀,德,邓,狄,翟,邸,底,弟,典,刁,丁,定,东,冬,董,豆,窦,都,堵,杜,度,端,段,敦,顿,多,朵,颚,恩,法,氾,樊,范,方,芳,防,房,费,丰,风,封,酆,冯,逢,凤,奉,俸,伏,扶,苻,服,符,福,付,傅,富,改,盖,干,甘,淦,冮,刚,皋,高,杲,郜,戈,革,合,格,盖,葛,庚,赓,耿,弓,公,宫,龚,巩,贡,勾,缑,苟,勾,辜,古,谷,固,顾,关,官,筦,管,观,贯,冠,光,广,归,妫,邽,炅,炔,贵,桂,滚,过,呙,郭,国,虢,果,哈,海,罕,撖,杭,郝,合,何,和,亻各,贺,赫,黑,亨,恒,衡,弘,闳,宏,鸿,侯,后,郈,厚,呼,轷,狐,胡,壶,虎,户,扈,花,华,滑,华,怀,槐,还,环,郇,桓,宦,皇,黄,回,惠,浑,火,霍,姬,嵇,稽,及,吉,汲,姞,戢,集,藉,籍,纪,计,季,暨,冀,加,家,嘉,郏,甲,贾,坚,菅,检,简,翦,蹇,见,监,江,将,姜,蒋,降,焦,矫,皎,敫,曒,教,接,揭,节,介,金,晋,烬,京,经,荆,井,景,敬,靖,静,酒,局,倶,琚,鞠,菊,巨,剧,隽,圈,角,开,凯,阚,康,亢,伉,柯,可,坑,孔,寇,库,蒯,郐,宽,匡,邝,旷,况,奎,隗,夔,腊,来,赖,兰,蓝,郎,劳,老,乐,雷,冷,离,黎,李,里,力,历,厉,立,励,利,郦,栗,连,廉,练,良,梁,聊,廖,列,林,临,吝,蔺,令,泠,凌,刘,留,柳,龙,隆,娄,楼,卢,庐,鲁,陆,逯,禄,路,闾,吕,律,栾,论,论,罗,洛,骆,雒,麻,马,买,麦,满,莽,毛,茆,茅,冒,枚,梅,门,蒙,孟,弥,祢,糜,米,芈,弭,宓,密,苗,缪,闵,敏,名,万,莫,墨,默,牟,母,木,沐,睦,慕,穆,那,纳,乃,佴,南,铙,倪,年,粘,念,乜,聂,宁,牛,钮,农,侬,区,欧,潘,盘,泮,庞,裴,彭,邳,皮,朴,品,平,繁,蒲,濮,浦,普,溥,柒,戚,漆,亓,齐,祁,歧,綦,乞,杞,启,千,钱,潜,强,乔,桥,谯,且,郄,钦,秦,琴,覃,勤,青,卿,清,庆,丘,邱,秋,仇,求,裘,曲,屈,麴,渠,璩,瞿,蘧,权,全,泉,阙,冉,饶,壬,任,戎,荣,容,茹,汝,阮,软,芮,瑞,洒,撒,萨,伞,桑,沙,山,闪,陕,单,善,商,赏,尚,少,召,邵,折,佘,厍,舍,申,莘,神,沈,生,绳,盛,师,施,石,时,史,士,世,是,奭,首,寿,殳,舒,疏,束,树,耍,帅,双,水,睡,顺,司,思,死,斯,四,佀,姒,松,宋,苏,宿,粟,眭,睢,隋,随,穗,孙,所,索,塔,台,邰,台,太,泰,谈,覃,谭,澹,檀,镡,汤,唐,棠,陶,腾,提,遆,题,帖,铁,通,仝,同,佟,彤,童,钭,徒,涂,屠,土,脱,完,宛,晚,万,汪,王,望,危,韦,维,蒍,隗,位,尉,温,文,闻,问,翁,瓮,邬,巫,毋,吾,吴,伍,仵,武,务,西,析,郗,息,奚,锡,习,席,袭,隰,舄,夏,先,鲜,咸,冼,洗,羡,线,相,香,襄,祥,向,相,项,肖,萧,孝,谢,渫,辛,忻,新,信,兴,星,刑,邢,行,幸,熊,修,须,顼,徐,许,旭,续,轩,禤,旋,薛,穴,雪,寻,郇,荀,押,牙,轧,鄢,燕,延,严,言,阎,颜,晏,扬,羊,阳,杨,仰,幺,要,尧,姚,铫,药,冶,业,叶,伊,衣,依,仪,宜,乙,蚁,扆,弋,义,亦,易,弈,益,裔,翼,阴,殷,银,尹,印,应,英,营,赢,灜,雍,勇,涌,幽,尤,由,游,於,欲,余,鱼,俞,馀,宇,禹,庾,玉,郁,遇,喻,裕,毓,渊,元,袁,原,圆,源,员,苑,院,乐,岳,悦,越,云,妘,郧,运,员,郓,恽,韵,载,昝,臧,迮,笮,曾,增,查,乍,翟,呰,祭,占,詹,瞻,展,战,湛,张,章,彰,仉,掌,招,召,兆,赵,肇,真,甄,镇,正,郑,政,支,执,直,植,志,郅,智,终,钟,衷,种,仲,周,朱,邾,诸,竹,竺,主,祝,专,庄,卓,禚,资,訾,子,紫,宗,邹,驺,俎,祖,左,韩,安陵,安平,安期,安阳,白马,百里,柏侯,鲍俎,北宫,北郭,北门,北山,北唐,奔水,逼阳,宾牟,薄奚薄野,曹牟,曹丘,常涛,长鱼,车非,成功,成阳,乘马,叱卢,丑门,樗里,穿封,淳子,答禄,达勃,达步,达奚,淡台,邓陵,第五,地连,地伦,东方,东里,东南,东宫,东门东乡,东丹,东郭,东陵,东关,东闾,东阳,东野,东莱,豆卢,斗于,都尉,独孤端木,段干,多子,尔朱,方雷丰将,封人,封父,夫蒙,夫馀,浮丘,傅余,干已,高车,高陵,高堂,高阳,高辛,皋落,哥舒,盖楼,庚桑,梗阳,宫孙,公羊,公良,公孙,公罔,公西,公冶,公敛,公梁,公输,公上,公山,公户,公玉,公仪,公仲公坚,公伯,公祖,公乘,公晰,公族,姑布,古口,古龙,古孙,谷梁,谷浑,瓜田,关龙,鲑阳,归海,函治,韩馀,罕井,浩生,浩星,纥骨,纥奚纥于,贺拨,贺兰,贺楼,赫连,黑齿,黑肱,侯冈,呼延,壶丘,呼衍,斛律,胡非,胡母,胡毋,皇甫,皇父,兀官吉白,即墨,季瓜,季连,季孙,茄众,蒋丘,金齿,晋楚,京城,泾阳,九百,九方,睢鸠,沮渠,巨母,勘阻,渴侯,渴单,可汗,空桐,空相,昆吾,老阳,乐羊,荔菲,栎阳,梁丘,梁由,梁馀,梁垣,陵阳伶舟,冷沦,令狐,刘王,柳下,龙丘,卢妃,卢蒲,鲁步,陆费,角里,闾丘,马矢,麦丘,茅夷,弥牟,密革,密茅,墨夷,墨台,万俊,昌顿,慕容,木门,木易,南宫,南郭,南门,南荣,欧侯,欧阳,逄门,盆成,彭祖,平陵,平宁,破丑,仆固,濮阳,漆雕,奇介,綦母,綦毋,綦连,祁连,乞伏,绮里,千代,千乘,勤宿,青阳,丘丽,丘陵,屈侯,屈突,屈男,屈卢,屈同,屈门,屈引,壤四,扰龙,容成,汝嫣,萨孤,三饭,三闾,三州,桑丘,商瞿,上官,尚方,少师,少施,少室,少叔,少正,社南社北,申屠,申徒,沈犹,胜屠,石作石牛,侍其,士季,士弱,士孙,士贞,叔孙,叔先,叔促,水丘,司城,司空,司寇,司鸿,司马,司徒,司士,似和,素和,夙沙,孙阳,索阳,索卢,沓卢,太史,太叔,太阳,澹台,唐山,堂溪,陶丘,同蹄,统奚,秃发,涂钦,吐火,吐贺,吐万,吐罗,吐门,吐难,吐缶,吐浑吐奚,吐和,屯浑,脱脱,拓拨,完颜,王孙,王官,王人,微生,尾勺,温孤,温稽,闻人,屋户,巫马,吾丘,无庸,无钩,五鹿,息夫,西陵,西乞,西钥,西乡,西门,西周,西郭,西方,西野,西宫,戏阳,瑕吕,霞露,夏侯,鲜虞,鲜于,鲜阳,咸丘,相里,解枇,谢丘,新垣,辛垣,信都,信平,修鱼,徐吾,宣于,轩辕,轩丘,阏氏,延陵,罔法,铅陵,羊角,耶律,叶阳,伊祁,伊耆,猗卢,义渠,邑由,因孙,银齿,尹文,雍门,游水,由吾,右师,宥连,於陵,虞丘,盂丘,宇文,尉迟,乐羊,乐正,运奄,运期,宰父,辗迟,湛卢,章仇,仉督,长孙,长儿,真鄂,正令,执头,中央,中长,中行,中野,中英,中梁,中垒,钟离,钟吾,终黎,终葵,仲孙,仲长,周阳,周氏,周生,朱阳,诸葛,主父,颛孙,颛顼,訾辱,淄丘,子言,子人,子服子家,子桑,子叔,子车,子阳,宗伯,宗正,宗政,尊卢,昨和,左人,左丘,左师,左行,刘文,额尔,达力,蔡斯,浩赏,斛斯,夹谷,揭阳,万俟,淳于,单于,徐离\";','2010-11-25 17:33:01'),
	(0,'inviteset','invite_set','s:6:\"common\";','2010-12-06 12:08:56'),
	(0,'siteopt','site_theme','s:8:\"newstyle\";','2010-11-29 17:40:14'),
	(0,'inviteset','__hash__','s:32:\"de6fa0dbb82ebd33d9d824d757332c1e\";','2010-11-26 11:51:05'),
	(0,'default','default','15','2010-11-19 11:57:11'),
	(0,'siteopt','site_closed_reason','s:0:\"\";','2010-11-29 17:40:14'),
	(0,'siteopt','site_header_keywords','s:77:\"Mạng xã hội|Mạng thông tin trực tuyến|Mạng sinh viên|Mạng IT\";','2010-11-29 17:40:14'),
	(0,'siteopt','site_header_description','s:77:\"Mạng xã hội|Mạng thông tin trực tuyến|Mạng sinh viên|Mạng IT\";','2010-11-29 17:40:14'),
	(0,'siteopt','site_icp','s:39:\"Đang chờ cấp phép của bộ VHTT\"','2010-11-29 17:40:14'),
	(0,'siteopt','site_anonymous','s:1:\"1\";','2010-11-29 17:40:14'),
	(0,'siteopt','site_anonymous_square','s:1:\"1\";','2010-11-29 17:40:14'),
	(0,'siteopt','site_anonymous_search','s:1:\"0\";','2010-11-29 17:40:14'),
	(0,'siteopt','site_appalias_wordwrap','s:1:\"1\";','2010-11-29 17:40:14'),
	(0,'attach','attach_path_rule','s:7:\"Y/md/H/\";','2010-11-29 17:41:15'),
	(0,'attach','attach_max_size','d:2;','2010-11-29 17:41:15'),
	(0,'attach','attach_allow_extension','s:59:\"jpg,gif,png,jpeg,bmp,zip,rar,doc,xls,ppt,docx,xlsx,pptx,pdf\";','2010-11-29 17:41:15'),
	(0,'attach','__hash__','s:32:\"3d1ba92bca03cacb92bb32379f880356\";','2010-11-29 17:41:15'),
	(0,'announcement','is_open','s:1:\"1\";','2010-12-13 15:20:06'),
	(0,'announcement','content','s:57:\"Chào mừng bạn đến với mạng xã hội ThinkSNS\";','2010-12-13 15:20:06');

/*!40000 ALTER TABLE `ts_system_data` ENABLE KEYS */;

# Dump of table ts_tag
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_tag`;

CREATE TABLE `ts_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(120) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_template
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_template`;

CREATE TABLE `ts_template` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `title` text,
  `body` text,
  `lang` varchar(255) NOT NULL DEFAULT 'zh',
  `type` varchar(255) DEFAULT NULL,
  `type2` varchar(255) DEFAULT NULL,
  `is_cache` tinyint(1) NOT NULL DEFAULT '1',
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `ts_template` DISABLE KEYS */;
INSERT INTO `ts_template` (`tpl_id`,`name`,`alias`,`title`,`body`,`lang`,`type`,`type2`,`is_cache`,`ctime`)
VALUES
	(1,'invite_register','邀请注册','{actor_name}邀请您加入{site_name}','亲爱的{email}您好，\r\n{actor}邀请您加入{site}','zh','invite','',1,1282554257);

/*!40000 ALTER TABLE `ts_template` ENABLE KEYS */;

# Dump of table ts_template_record
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_template_record`;

CREATE TABLE `ts_template_record` (
  `tpl_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `tpl_name` varchar(255) NOT NULL DEFAULT '',
  `tpl_alias` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `type2` varchar(255) DEFAULT NULL,
  `data` text,
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`tpl_record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_user
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user`;

CREATE TABLE `ts_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `province` mediumint(6) NOT NULL DEFAULT '0',
  `city` mediumint(6) NOT NULL DEFAULT '0',
  `location` varchar(255) DEFAULT NULL,
  `admin_level` varchar(255) DEFAULT '0',
  `commend` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_init` tinyint(1) NOT NULL,
  `is_synchronizing` tinyint(1) NOT NULL DEFAULT '0',
  `ctime` int(11) DEFAULT NULL,
  `identity` tinyint(1) NOT NULL DEFAULT '1',
  `score` int(11) NOT NULL DEFAULT '0',
  `myop_menu_num` int(2) NOT NULL DEFAULT '10',
  `api_key` varchar(255) DEFAULT NULL,
  `domain` char(80) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`),
  KEY `location` (`location`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_user_app
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user_app`;

CREATE TABLE `ts_user_app` (
  `user_app_id` int(11) unsigned NOT NULL auto_increment,
  `app_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `display_order` int(5) NOT NULL default '0',
  `ctime` int(11) default NULL,
  PRIMARY KEY  (`user_app_id`),
  KEY `display_order` (`display_order`),
  KEY `app_id` (`app_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_user_blacklist
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user_blacklist`;

CREATE TABLE `ts_user_blacklist` (
  `uid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_user_count
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user_count`;

CREATE TABLE `ts_user_count` (
  `uid` int(11) NOT NULL,
  `atme` mediumint(6) NOT NULL,
  `comment` mediumint(6) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_user_group
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user_group`;

CREATE TABLE `ts_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `ctime` int(11) DEFAULT NULL,
  `icon` varchar(120) NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `ts_user_group` DISABLE KEYS */;
INSERT INTO `ts_user_group` (`user_group_id`,`title`,`ctime`,`icon`)
VALUES
	(1,'管理员',1291136345,'v_05.gif');

/*!40000 ALTER TABLE `ts_user_group` ENABLE KEYS */;

# Dump of table ts_user_group_link
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user_group_link`;

CREATE TABLE `ts_user_group_link` (
  `user_gorup_link_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `user_group_title` varchar(255) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY  (`user_gorup_link_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_user_group_popedom
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user_group_popedom`;

CREATE TABLE `ts_user_group_popedom` (
  `user_group_popedom_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  PRIMARY KEY (`user_group_popedom_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `ts_user_group_popedom` DISABLE KEYS */;
INSERT INTO `ts_user_group_popedom` (`user_group_popedom_id`,`user_group_id`,`node_id`)
VALUES
	(1,1,1);

/*!40000 ALTER TABLE `ts_user_group_popedom` ENABLE KEYS */;

# Dump of table ts_user_online
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user_online`;

CREATE TABLE `ts_user_online` (
  `uid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_user_privacy
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user_privacy`;

CREATE TABLE `ts_user_privacy` (
  `uid` int(11) NOT NULL,
  `key` varchar(120) NOT NULL,
  `value` varchar(120) NOT NULL,
  UNIQUE KEY `key` (`key`),
  UNIQUE KEY `key_2` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_user_profile
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user_profile`;

CREATE TABLE `ts_user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `module` varchar(150) NOT NULL,
  `data` longtext,
  `type` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_user_set
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user_set`;

CREATE TABLE `ts_user_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldkey` varchar(120) NOT NULL,
  `fieldname` varchar(120) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `module` varchar(60) NOT NULL,
  `showspace` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `ts_user_set` DISABLE KEYS */;
INSERT INTO `ts_user_set` (`id`,`fieldkey`,`fieldname`,`status`,`module`,`showspace`)
VALUES
	(3,'name','名字',1,'intro',1),
	(4,'summary','我的简介',1,'intro',0),
	(5,'nearestwish','最近心愿',1,'intro',0),
	(6,'motto','座右铭',1,'intro',0),
	(7,'idol','偶像',1,'intro',0),
	(8,'favbook','喜欢的书',1,'intro',0),
	(9,'interest','兴趣爱好',1,'intro',0),
	(10,'address','地址',1,'contact',0),
	(11,'postcode','邮编',1,'contact',0),
	(12,'telphone','电话',1,'contact',0),
	(13,'mobile','手机',1,'contact',0),
	(14,'qq','QQ',1,'contact',0),
	(15,'msn','MSN',1,'contact',0),
	(16,'blood','血型',1,'intro',0);

/*!40000 ALTER TABLE `ts_user_set` ENABLE KEYS */;

# Dump of table ts_user_tag
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_user_tag`;

CREATE TABLE `ts_user_tag` (
  `user_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`user_tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_validation
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_validation`;

CREATE TABLE `ts_validation` (
  `validation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `from_uid` int(11) NOT NULL DEFAULT '0',
  `to_user` varchar(255) NOT NULL DEFAULT '0',
  `data` text,
  `code` varchar(120) NOT NULL DEFAULT '0',
  `target_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`validation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_weibo
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_weibo`;

CREATE TABLE `ts_weibo` (
  `weibo_id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `content` text NOT NULL,
  `ctime` int(11) NOT NULL,
  `from` tinyint(1) NOT NULL,
  `comment` mediumint(8) NOT NULL,
  `transpond_id` int(11) NOT NULL default '0',
  `transpond` mediumint(8) NOT NULL,
  `type` varchar(255) default '0',
  `type_data` text,
  `from_data` text,
  `isdel` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`weibo_id`),
  KEY `type` (`uid`,`type`),
  KEY `transpond` (`uid`,`transpond_id`),
  KEY `ctime` (`ctime`),
  KEY `uid_2` (`uid`,`isdel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_weibo_atme
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_weibo_atme`;

CREATE TABLE `ts_weibo_atme` (
  `uid` int(11) NOT NULL,
  `weibo_id` int(11) NOT NULL,
  UNIQUE KEY `uid` (`uid`,`weibo_id`),
  KEY `weibo_id` (`weibo_id`,`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# Dump of table ts_weibo_comment
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_weibo_comment`;

CREATE TABLE `ts_weibo_comment` (
  `comment_id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `reply_comment_id` int(11) NOT NULL,
  `reply_uid` int(11) NOT NULL,
  `weibo_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `ctime` int(11) NOT NULL,
  `isdel` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `weibo_id` (`weibo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_weibo_favorite
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_weibo_favorite`;

CREATE TABLE `ts_weibo_favorite` (
  `uid` int(11) NOT NULL,
  `weibo_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`weibo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_weibo_follow
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_weibo_follow`;

CREATE TABLE `ts_weibo_follow` (
  `follow_id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`follow_id`),
  KEY `fid` (`fid`,`type`),
  KEY `uid` (`uid`,`type`),
  KEY `uid_fid` (`uid`,`fid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ts_weibo_plugin
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_weibo_plugin`;

CREATE TABLE `ts_weibo_plugin` (
  `plugin_id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(120) NOT NULL,
  `icon_pic` varchar(120) NOT NULL,
  `plugin_path` varchar(255) NOT NULL,
  PRIMARY KEY (`plugin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `ts_weibo_plugin` DISABLE KEYS */;
INSERT INTO `ts_weibo_plugin` (`plugin_id`,`plugin_name`,`icon_pic`,`plugin_path`)
VALUES
	(1,'图片','','image'),
	(3,'视频','','video'),
	(4,'音乐','','music');

/*!40000 ALTER TABLE `ts_weibo_plugin` ENABLE KEYS */;

# Dump of table ts_weibo_topic
# ------------------------------------------------------------;

DROP TABLE IF EXISTS `ts_weibo_topic`;

CREATE TABLE `ts_weibo_topic` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `count` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  PRIMARY KEY  (`topic_id`),
  KEY `count` (`count`),
  KEY `name` (`name`,`count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 新增ts_credit_setting, ts_credit_type, ts_credit_user表
DROP TABLE IF EXISTS `ts_credit_setting`;

CREATE TABLE `ts_credit_setting` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL default 'user',
  `info` text NOT NULL,
  `score` int(11) NOT NULL default '0',
  `experience` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `ts_credit_setting` (`id`,`name`,`alias`,`type`,`info`,`score`,`experience`)
VALUES
    (34,'add_blog','发表博客','blog','{action}{sign}了{score}{typecn}',5,5),
    (37,'invite_friend','邀请好友','register','{action}{sign}了{score}{typecn}',10,10),
    (39,'add_weibo','发布微薄','weibo','{action}{sign}了{score}{typecn}',1,2),
    (40,'user_login','用户登录','user','{action}{sign}了{score}{typecn}',0,1),
    (42,'space_visited','空间被访问','user','{action}{sign}了{score}{typecn}',1,1),
    (45,'add_vote','发起投票','vote','{action}{sign}了{score}{typecn}',20,20),
    (46,'join_vote','参与投票','vote','{action}{sign}了{score}{typecn}',1,5),
    (47,'joined_vote','投票被参与','vote','{action}{sign}了{score}{typecn}',1,1),
    (92,'init_default','注册积分','register','{action}{sign}了{score}{typecn}',200,0),
    (56,'add_album','创建相册','photo','{action}{sign}了{score}{typecn}',10,10),
    (59,'add_comment','评论别人','comment','{action}{sign}了{score}{typecn}',1,1),
    (60,'reply_comment','回复别人的评论','comment','{action}{sign}了{score}{typecn}',1,1),
    (61,'replied_comment','评论被回复','comment','{action}{sign}了{score}{typecn}',2,2),
    (63,'reply_weibo','回复微博','weibo','{action}{sign}了{score}{typecn}',1,1),
    (64,'replied_weibo','微博被回复','weibo','{action}{sign}了{score}{typecn}',1,1),
    (81,'is_commented','被别人评论','comment','{action}{sign}了{score}{typecn}',1,2),
    (82,'add_photo','上传图片','photo','{action}{sign}了{score}{typecn}',2,2),
    (83,'share_to_weibo','分享到微薄','weibo','{action}{sign}了{score}{typecn}',3,3),
    (84,'delete_blog','删除博客','blog','{action}{sign}了{score}{typecn}',-5,-5),
    (85,'delete_album','删除相册','photo','{action}{sign}了{score}{typecn}',-10,-10),
    (86,'delete_photo','删除图片','photo','{action}{sign}了{score}{typecn}',-2,-2),
    (87,'delete_vote','删除投票','vote','{action}{sign}了{score}{typecn}',-20,-20),
    (88,'delete_comment','删除评论','comment','{action}{sign}了{score}{typecn}',-2,-2),
    (89,'delete_weibo','删除微薄','weibo','{action}{sign}了{score}{typecn}',-2,-2),
    (90,'forward_weibo','转发微薄','weibo','{action}{sign}了{score}{typecn}',1,1),
    (91,'forwarded_weibo','微博被转发','weibo','{action}{sign}了{score}{typecn}',1,1),
    (93,'delete_weibo_comment','删除微博评论','weibo','{action}{sign}了{score}{typecn}',-1,-1);


DROP TABLE IF EXISTS `ts_credit_type`;

CREATE TABLE `ts_credit_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `ts_credit_type` (`name`,`alias`)
VALUES
    ('score','积分'),
    ('experience','经验');

DROP TABLE IF EXISTS `ts_credit_user`;

CREATE TABLE `ts_credit_user` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

##################################################################################################################
# 以下为 ThinkSNS 2.1 beta Build 10470 新增的数据表
# ts_denounce, ts_admin_log, ts_weibo_follow_group, ts_weibo_follow_group_link, ts_weibo_star, ts_weibo_star_group

DROP TABLE IF EXISTS `ts_denounce`;

CREATE TABLE `ts_denounce` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键ID',
  `from` varchar(255) NOT NULL COMMENT '目前存入各个应用的名称，比如blog,weibo，说明举报的是不同应用下的内容',
  `aid` int(11) NOT NULL COMMENT '记录内容表的主键ID',
  `state` tinyint(4) NOT NULL COMMENT '记录状态，0，默认，表示刚举报；1，表示已删除；2，表示已经通过可以正常显示；',
  `uid` int(11) NOT NULL COMMENT '记录举报人的UID',
  `fuid` int(11) NOT NULL COMMENT '记录被举报人UID',
  `reason` text NOT NULL COMMENT '举报理由',
  `content` varchar(255) NOT NULL,
  `ctime` int(11) NOT NULL COMMENT '记录举报的时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#------------------------------------#

DROP TABLE IF EXISTS `ts_admin_log`;

CREATE TABLE `ts_admin_log` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '操作人UID',
  `type` tinyint(4) NOT NULL,
  `data` text NOT NULL,
  `ctime` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#------------------------------------#

DROP TABLE IF EXISTS `ts_weibo_follow_group`;

CREATE TABLE `ts_weibo_follow_group` (
  `follow_group_id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `ctime` int(11) default NULL,
  PRIMARY KEY  (`follow_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#------------------------------------#

DROP TABLE IF EXISTS `ts_weibo_follow_group_link`;

CREATE TABLE `ts_weibo_follow_group_link` (
  `follow_group_link_id` int(11) NOT NULL auto_increment,
  `follow_group_id` int(11) NOT NULL,
  `follow_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY  (`follow_group_link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#------------------------------------#

DROP TABLE IF EXISTS `ts_weibo_star`;

CREATE TABLE `ts_weibo_star` (
  `star_id` int(11) NOT NULL auto_increment,
  `star_group_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `ctime` int(11) default NULL,
  PRIMARY KEY  (`star_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#------------------------------------#

DROP TABLE IF EXISTS `ts_weibo_star_group`;

CREATE TABLE `ts_weibo_star_group` (
  `star_group_id` int(11) NOT NULL auto_increment,
  `top_group_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL default '0',
  `ctime` int(11) default NULL,
  PRIMARY KEY  (`star_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

##################################################################################################################
# 以下为 ThinkSNS 2.1 Build 10920 新增的数据表
# 
DROP TABLE IF EXISTS `ts_ucenter_user_link`;

CREATE TABLE `ts_ucenter_user_link` (
  `uid` int(11) NOT NULL,
  `uc_uid` mediumint(8) NOT NULL,
  `uc_username` char(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

##################################################################################################################
# 以下为 ThinkSNS 2.2 新增的数据表
# ts_invite_record
#

DROP TABLE IF EXISTS `ts_invite_record`;

CREATE TABLE IF NOT EXISTS `ts_invite_record` (
  `invite_record_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `fid` int(11) unsigned NOT NULL,
  `ctime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`invite_record_id`),
  UNIQUE KEY `uid` (`uid`,`fid`),
  KEY `ctime` (`ctime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

##################################################################################################################
# 以下为 ThinkSNS 2.3 新增的数据表
# ts_weibo_topics
#

DROP TABLE IF EXISTS `ts_weibo_topics`;

CREATE TABLE IF NOT EXISTS `ts_weibo_topics` (
  `topics_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) unsigned NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `recommend` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ctime` int(11) DEFAULT NULL,
  `isdel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topics_id`),
  UNIQUE KEY `page` (`domain`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

##################################################################################################################
# ThinkSNS 2.5 新增的表
# ts_addons
#

DROP TABLE IF EXISTS `ts_addons`;

CREATE TABLE IF NOT EXISTS `ts_addons` (
  `addonId` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `pluginName` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(255) NOT NULL DEFAULT '',
  `info` tinytext,
  `version` varchar(50) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `lastupdate` varchar(255) DEFAULT '',
  `site` varchar(255) DEFAULT NULL,
  `tsVersion` varchar(11) DEFAULT '2.5',
  PRIMARY KEY (`addonId`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;


DROP TABLE IF EXISTS `ts_weibo_attach`;

CREATE TABLE IF NOT EXISTS `ts_weibo_attach` (
  `weibo_id` int(11) NOT NULL,
  `attach_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `weibo_type` tinyint(3) NOT NULL,
  `mtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `user_attach` (`uid`,`attach_id`,`weibo_type`),
  KEY `weibo_index` (`weibo_id`,`weibo_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微博附件表';


DROP TABLE IF EXISTS `ts_user_data`;

CREATE TABLE IF NOT EXISTS `ts_user_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text,
  `mtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user-key` (`uid`,`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ts_message_content`;

CREATE TABLE `ts_message_content` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(11) unsigned NOT NULL,
  `from_uid` int(11) unsigned NOT NULL,
  `content` text,
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `list_id` (`list_id`,`is_del`,`mtime`),
  KEY `list_id_2` (`list_id`,`mtime`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ts_message_list`;

CREATE TABLE `ts_message_list` (
  `list_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_uid` int(11) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `member_num` smallint(5) unsigned NOT NULL DEFAULT '0',
  `min_max` varchar(17) DEFAULT NULL,
  `mtime` int(11) unsigned NOT NULL,
  `last_message` text NOT NULL,
  PRIMARY KEY (`list_id`),
  KEY `type` (`type`),
  KEY `min_max` (`min_max`),
  KEY `from_uid` (`from_uid`,`mtime`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ts_message_member`;

CREATE TABLE `ts_message_member` (
  `list_id` int(11) unsigned NOT NULL,
  `member_uid` int(11) unsigned NOT NULL,
  `new` smallint(8) unsigned NOT NULL DEFAULT '0',
  `message_num` int(10) unsigned NOT NULL DEFAULT '1',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0',
  `list_ctime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`list_id`,`member_uid`),
  KEY `new` (`new`),
  KEY `ctime` (`ctime`),
  KEY `list_ctime` (`list_ctime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ts_weibo_topic_link`;
CREATE TABLE `ts_weibo_topic_link` (
  `weibo_topic_id` int(11) NOT NULL auto_increment,
  `weibo_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL default '0',
  `transpond_id` int(11) NOT NULL default 0,
  PRIMARY KEY  (`weibo_topic_id`),
  KEY `topic_type` (`topic_id`,`type`),
  KEY `topic_transpond` (`topic_id`,`transpond_id`),
  KEY `weibo` (`weibo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;