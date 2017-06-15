# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.21-MariaDB)
# Database: api
# Generation Time: 2017-06-12 04:34:06 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table api
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api`;

CREATE TABLE `api` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '接口编号',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '接口分类id',
  `num` varchar(100) NOT NULL DEFAULT '' COMMENT '接口编号',
  `url` varchar(240) NOT NULL DEFAULT '' COMMENT '请求地址',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '接口名',
  `des` varchar(300) NOT NULL DEFAULT '' COMMENT '接口描述',
  `parameter` text NOT NULL COMMENT '请求参数{所有的主求参数,以json格式在此存放}',
  `memo` text NOT NULL COMMENT '备注',
  `re` text NOT NULL COMMENT '返回值',
  `lasttime` int(11) unsigned NOT NULL COMMENT '提后操作时间',
  `lastuid` int(11) unsigned NOT NULL COMMENT '最后修改uid',
  `isdel` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '{0:正常,1:删除}',
  `type` char(11) NOT NULL DEFAULT '' COMMENT '请求方式',
  `ord` int(11) NOT NULL DEFAULT '0' COMMENT '排序(值越大,越靠前)',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `utime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='接口明细表';

LOCK TABLES `api` WRITE;
/*!40000 ALTER TABLE `api` DISABLE KEYS */;

INSERT INTO `api` (`id`, `aid`, `num`, `url`, `name`, `des`, `parameter`, `memo`, `re`, `lasttime`, `lastuid`, `isdel`, `type`, `ord`, `ctime`, `utime`)
VALUES
	(1,2,'000','http://api.xxx.com','会员注册','会员注册调用此接口','a:4:{s:4:\"name\";a:3:{i:0;s:10:\"login_name\";i:1;s:8:\"password\";i:2;s:5:\"email\";}s:4:\"type\";a:3:{i:0;s:1:\"Y\";i:1;s:1:\"Y\";i:2;s:1:\"N\";}s:7:\"default\";a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}s:3:\"des\";a:3:{i:0;s:9:\"登录名\";i:1;s:6:\"密码\";i:2;s:12:\"用户邮箱\";}}','','{\r\n    &quot;status&quot;: 1, \r\n    &quot;info&quot;: &quot;注册成功&quot;, \r\n    &quot;data&quot;: {\r\n        &quot;uid&quot;: &quot;20&quot;\r\n    }\r\n}',1435588983,1,0,'POST',0,'2017-06-12 12:18:30','0000-00-00 00:00:00'),
	(2,2,'001','http://api.xxx.com','会员登录','会员登录调用此接口','a:5:{s:4:\"name\";a:3:{i:0;s:10:\"login_name\";i:1;s:5:\"email\";i:2;s:8:\"password\";}s:9:\"paramType\";a:3:{i:0;s:6:\"字符\";i:1;s:6:\"字符\";i:2;s:6:\"字符\";}s:4:\"type\";a:3:{i:0;s:1:\"Y\";i:1;s:1:\"Y\";i:2;s:1:\"Y\";}s:7:\"default\";a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}s:3:\"des\";a:3:{i:0;s:30:\"登录名与邮箱二选其一\";i:1;s:81:\"邮箱与登录名二选其一，测试描述字段的显示长度有没有问题\";i:2;s:6:\"密码\";}}','login_name 与 email 二选其一','{\r\n    &quot;status&quot;: 1, \r\n    &quot;info&quot;: &quot;登录成功&quot;, \r\n    &quot;data&quot;: [ ]\r\n}',1496739353,1,0,'GET',0,'2017-06-12 12:18:30','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `api` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth`;

CREATE TABLE `auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户',
  `aid` varchar(256) NOT NULL DEFAULT '' COMMENT '接口分类权限',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `utime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限表 - 若用户为普通管理员时，读此表获取权限';

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;

INSERT INTO `auth` (`id`, `uid`, `aid`, `ctime`, `utime`)
VALUES
	(1,2,'1,2,3','2017-06-12 12:19:52','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cate`;

CREATE TABLE `cate` (
  `aid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cname` varchar(200) NOT NULL DEFAULT '' COMMENT '分类名称',
  `cdesc` varchar(200) NOT NULL DEFAULT '' COMMENT '分类描述',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除{0:正常,1删除}',
  `ord` int(11) NOT NULL DEFAULT '0' COMMENT '分类排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `utime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='接口分类表';

LOCK TABLES `cate` WRITE;
/*!40000 ALTER TABLE `cate` DISABLE KEYS */;

INSERT INTO `cate` (`aid`, `cname`, `cdesc`, `isdel`, `ord`, `addtime`, `ctime`, `utime`)
VALUES
	(1,'分类一','第一个测试分类',0,0,1435575162,'2017-06-12 12:20:58','0000-00-00 00:00:00'),
	(2,'分类二','第二个测试分类',0,0,1435575185,'2017-06-12 12:20:58','0000-00-00 00:00:00'),
	(3,'分类三','第三个测试分类',0,0,1496721832,'2017-06-12 12:20:58','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `cate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nice_name` char(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `login_name` char(20) NOT NULL DEFAULT '' COMMENT '登录名',
  `last_time` int(11) NOT NULL DEFAULT '0' COMMENT '最近登录时间',
  `login_pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '{0正常,1:删除}',
  `issuper` int(11) NOT NULL DEFAULT '0' COMMENT '{0:普通管理员,1超级管理员}',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `utime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `nice_name`, `login_name`, `last_time`, `login_pwd`, `isdel`, `issuper`, `ctime`, `utime`)
VALUES
	(1,'admin','admin',1497171154,'c33367701511b4f6020ec61ded352059',0,1,'2017-06-12 12:21:59','2017-06-11 16:52:34'),
	(2,'root','root',1497171622,'e10adc3949ba59abbe56e057f20f883e',0,0,'2017-06-12 12:21:59','2017-06-11 17:00:22');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `api` int(11) NOT NULL DEFAULT '0' COMMENT '接口ID',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '接口分类id',
  `num` varchar(100) NOT NULL DEFAULT '' COMMENT '接口编号',
  `url` varchar(240) NOT NULL DEFAULT '' COMMENT '请求地址',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '接口名',
  `des` varchar(300) NOT NULL DEFAULT '' COMMENT '接口描述',
  `parameter` text NOT NULL COMMENT '请求参数{所有的主求参数,以json格式在此存放}',
  `memo` text NOT NULL COMMENT '备注',
  `re` text NOT NULL COMMENT '返回值',
  `lasttime` int(11) unsigned NOT NULL COMMENT '提后操作时间',
  `lastuid` int(11) unsigned NOT NULL COMMENT '最后修改uid',
  `isdel` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '{0:正常,1:删除}',
  `type` char(11) NOT NULL DEFAULT '' COMMENT '请求方式',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `utime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='接口修改记录表';

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;