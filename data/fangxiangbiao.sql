-- phpMyAdmin SQL Dump
-- version 4.0.6-rc1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017-08-17 09:24:30
-- 服务器版本: 5.5.19
-- PHP 版本: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `fangxiangbiao`
--

-- --------------------------------------------------------

--
-- 表的结构 `ys_admin`
--

CREATE TABLE IF NOT EXISTS `ys_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `nine_password` varchar(255) DEFAULT NULL COMMENT '9宫格密码',
  `reg_time` int(11) DEFAULT NULL COMMENT '注册时间(时间戳)',
  `reg_time_date` datetime DEFAULT NULL COMMENT '注册时间',
  `reg_ip` varchar(255) DEFAULT NULL COMMENT '注册时ip',
  `last_login_time` int(11) DEFAULT NULL COMMENT '最后登录时间(时间戳)',
  `last_login_time_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(255) DEFAULT NULL COMMENT '最后登录ip',
  `update_time` int(11) DEFAULT NULL COMMENT '修改的时间(时间戳)',
  `update_time_date` datetime DEFAULT NULL COMMENT '修改的时间',
  `visit_url` text COMMENT '登录后访问的地址',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态(1：为正常，0：为停止使用)',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '级别标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台管理员表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ys_admin`
--

INSERT INTO `ys_admin` (`id`, `username`, `password`, `nine_password`, `reg_time`, `reg_time_date`, `reg_ip`, `last_login_time`, `last_login_time_date`, `last_login_ip`, `update_time`, `update_time_date`, `visit_url`, `status`, `type`) VALUES
(1, 'president', 'MDAwMDAwMDAwMJp_rtHJa5ycwIxqkYp9vGOEoYmWhaB0cQ', 'MDAwMDAwMDAwMIWhtd61fXWos4l-2Yh9qGODi4Gh', NULL, NULL, NULL, 1495295984, '2017-05-20 23:59:44', '127.0.0.1', NULL, NULL, 'http://ys.com/manager', 1, 1),
(2, 'master', 'MDAwMDAwMDAwMJmOqt_KgIaqt3mclYh6oG4', 'MDAwMDAwMDAwMJmOqt_KgIaqt3l62oaztGKEoZeYhnp0cQ', NULL, NULL, NULL, 1502439947, '2017-08-11 16:25:47', '127.0.0.1', NULL, NULL, 'http://www.f.com/manager', 1, 0),
(3, 'admin', 'MDAwMDAwMDAwMJCOttnHkGVys4l-2w', NULL, NULL, NULL, NULL, 1495392337, '2017-05-22 02:45:37', '127.0.0.1', 1494904951, '2017-05-16 11:22:31', 'http://ys.com/manager', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ys_admin_log`
--

CREATE TABLE IF NOT EXISTS `ys_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminID` int(11) NOT NULL COMMENT '后台管理员id',
  `opType` int(11) DEFAULT NULL COMMENT '操作的权限类型',
  `opTime` int(11) NOT NULL COMMENT '操作时的时间戳',
  `opDate` datetime NOT NULL COMMENT '操作时的时间',
  `ip` varchar(255) DEFAULT NULL COMMENT '操作时的ip',
  `content` text COMMENT '操作的内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `ys_admin_log`
--

INSERT INTO `ys_admin_log` (`id`, `adminID`, `opType`, `opTime`, `opDate`, `ip`, `content`) VALUES
(4, 2, 1, 1493782000, '2017-05-03 11:26:40', '127.0.0.1', '管理员[master]操作了：后台首页'),
(5, 2, 1, 1493782341, '2017-05-03 11:32:21', '127.0.0.1', '管理员[master]操作了：后台首页'),
(6, 2, 1, 1495392231, '2017-05-22 02:43:51', '127.0.0.1', '管理员[master]操作了：左侧菜单列表'),
(7, 2, 1, 1495392235, '2017-05-22 02:43:55', '127.0.0.1', '管理员[master]操作了：查看管理员日志'),
(8, 3, 1, 1495392337, '2017-05-22 02:45:37', '127.0.0.1', '管理员[admin]操作了：后台首页'),
(9, 3, 1, 1495392345, '2017-05-22 02:45:45', '127.0.0.1', '管理员[admin]操作了：查看管理员日志'),
(10, 2, 1, 1495392352, '2017-05-22 02:45:52', '127.0.0.1', '管理员[master]操作了：后台首页'),
(11, 2, 1, 1495392355, '2017-05-22 02:45:55', '127.0.0.1', '管理员[master]操作了：后台设置'),
(12, 2, 1, 1495392360, '2017-05-22 02:46:00', '127.0.0.1', '管理员[master]操作了：后台设置');

-- --------------------------------------------------------

--
-- 表的结构 `ys_article`
--

CREATE TABLE IF NOT EXISTS `ys_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题-text',
  `subtitle` varchar(255) DEFAULT NULL COMMENT '副标题-text',
  `simple_intro` text COMMENT '简要介绍-textarea-2',
  `content` text COMMENT '正文内容-edit-2',
  `add_time` int(11) DEFAULT NULL COMMENT '添加的时间戳-hide-2-timestamp',
  `add_date` datetime DEFAULT NULL COMMENT '添加的日期-hide-1-datetime',
  `update_time` int(11) DEFAULT NULL COMMENT '更新文章的时间戳-edit_hide-2-timestamp',
  `update_date` datetime DEFAULT NULL COMMENT '更新文章的日期-edit_hide-1-datetime',
  `recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐-toggle',
  `weight` int(11) DEFAULT NULL COMMENT '排序(数字越大越靠前)-text',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示-toggle',
  `owner` tinyint(1) DEFAULT '1' COMMENT '原创-select-1-null-1;2-原创;转载',
  `view_num` int(11) DEFAULT NULL COMMENT '点击量-text',
  `upload` varchar(255) DEFAULT NULL COMMENT '上传附件-upload-2',
  `upload_img` varchar(255) DEFAULT NULL COMMENT '图片上传-upload-2',
  `backup` text COMMENT '备注-edit-2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台设置表' AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `ys_article`
--

INSERT INTO `ys_article` (`id`, `title`, `subtitle`, `simple_intro`, `content`, `add_time`, `add_date`, `update_time`, `update_date`, `recommend`, `weight`, `is_show`, `owner`, `view_num`, `upload`, `upload_img`, `backup`) VALUES
(16, '', NULL, '', '<p>fghdfgh</p>', 1495523989, '2017-05-23 15:19:49', NULL, NULL, 0, 0, 0, 1, 0, '', '', NULL),
(17, '阿斯顿发斯蒂芬', NULL, '', '<p><img src="/ueditor/php/upload/image/20170607/1496807295908357.gif" title="1496807295908357.gif" alt="92e8647aly1fdne2bh93yg20dw07t7wh (1).gif"/></p>', 1500348064, '2017-07-18 11:21:04', NULL, NULL, 0, 0, 0, 2, 0, '', '', NULL),
(18, '测试文章标题', '测试副标题', '测试介绍', '<p>测试正文内容</p><p><img src="/ueditor/php/upload/image/20170718/1500348253118294.jpg" title="1500348253118294.jpg" alt="注册 登陆.jpg" width="912" height="740"/></p>', 1500348192, '2017-07-18 11:23:12', NULL, NULL, 0, 112, 1, 1, 2, '4', '3', ''),
(19, '车市', '123', '123', '<p><img src="/ueditor/php/upload/image/20170725/1500971376576754.png" title="1500971376576754.png" alt="20170724170311.png"/></p><p><img src="/ueditor/php/upload/image/20170725/1500971380965805.png" title="1500971380965805.png" alt="20170724170311.png"/></p><p><br/></p>', 1500971364, '2017-07-25 16:29:24', NULL, NULL, 0, 12, 1, 1, 12, '22', '23', '<p style="text-align:center"><img src="/ueditor/php/upload/image/20170725/1500971418127838.png" title="1500971418127838.png" alt="20170724170311.png"/></p><p><img src="/ueditor/php/upload/image/20170725/1500971425588244.png" title="1500971425588244.png" alt="20170724170311.png"/></p><p><img src="/ueditor/php/upload/image/20170725/1500971421111912.png" title="1500971421111912.png" alt="20170724170311.png"/></p><p><br/></p>'),
(20, '12312', '123123', '1231321', '<p>321321321</p><p><img src="/ueditor/php/upload/image/20170726/1501054199134409.png" title="1501054199134409.png" alt="01.png"/><img src="/ueditor/php/upload/image/20170726/1501054203369815.png" title="1501054203369815.png" alt="02.png"/><img src="/ueditor/php/upload/image/20170726/1501054207559413.png" title="1501054207559413.png" alt="03.png"/></p>', 1501054153, '2017-07-26 15:29:13', NULL, NULL, 0, 123, 1, 1, 123, '26', '27', '<p><img src="/ueditor/php/upload/image/20170726/1501054180903280.png" title="1501054180903280.png" alt="03.png"/><img src="/ueditor/php/upload/image/20170726/1501054188525934.png" title="1501054188525934.png" alt="02.png"/><img src="/ueditor/php/upload/image/20170726/1501054191417752.png" title="1501054191417752.png" alt="01.png"/></p>');

-- --------------------------------------------------------

--
-- 表的结构 `ys_auth_group`
--

CREATE TABLE IF NOT EXISTS `ys_auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '用户组名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态(1为正常，0为禁用)',
  `rules` text COMMENT '访问规则(对应ys_auth_rule表的id)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户组表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ys_auth_group`
--

INSERT INTO `ys_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '超级管理员用户组', 1, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,27,28,29,33,34,35,36,37,38,39,42,43,44,45,46,47,48,50,51,52,53,54,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102'),
(2, '普通管理员组', 1, '1,46');

-- --------------------------------------------------------

--
-- 表的结构 `ys_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `ys_auth_group_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) NOT NULL COMMENT '用户组id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户组关联表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ys_auth_group_access`
--

INSERT INTO `ys_auth_group_access` (`id`, `uid`, `group_id`) VALUES
(1, 2, 1),
(2, 3, 2);

-- --------------------------------------------------------

--
-- 表的结构 `ys_auth_rule`
--

CREATE TABLE IF NOT EXISTS `ys_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '访问的url',
  `title` varchar(255) NOT NULL COMMENT '权限名称',
  `type` mediumint(9) DEFAULT '2' COMMENT '权限组标识',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限状态(1为正常，0为禁止)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='权限规则表' AUTO_INCREMENT=103 ;

--
-- 转存表中的数据 `ys_auth_rule`
--

INSERT INTO `ys_auth_rule` (`id`, `name`, `title`, `type`, `status`) VALUES
(1, 'manager', '后台首页', 1, 1),
(2, 'manager/Index/setting', '后台设置', 1, 1),
(3, 'manager/Index/setting_add', '后台新增设置', 1, 1),
(4, 'manager/Index/setting_del', '后台删除设置', 1, 1),
(5, 'manager/Index/user', '用户管理', 1, 1),
(6, 'manager/Index/edit_userstatus', '修改用户状态', 1, 1),
(7, 'manager/PublicFun/status_change', '状态修改', 1, 1),
(8, 'manager/Index/edit_usergroup', '修改用户组', 1, 1),
(9, 'manager/Index/add_user', '新增用户', 1, 1),
(10, 'manager/Index/del_user', '删除用户', 1, 1),
(11, 'manager/Index/usergroup', '用户组', 1, 1),
(12, 'manager/Index/usergroup_add', '新增用户组', 1, 1),
(13, 'manager/Index/usergroup_del', '删除用户组', 1, 1),
(14, 'manager/Index/usergroup_edit', '编辑用户组', 1, 1),
(15, 'manager/Index/edit_usergroup_status', '修改用户组状态', 1, 1),
(16, 'manager/Index/usergroup_update', '修改用户组权限', 1, 1),
(17, 'manager/Index/rules_list', '权限列表', 1, 1),
(18, 'manager/Index/rules_edit', '编辑访问权限', 1, 1),
(19, 'manager/Index/rule_add', '新增访问权限', 1, 1),
(20, 'manager/Index/rule_del', '删除访问规则', 1, 1),
(21, 'manager/Index/edit_rules_status', '修改访问权限状态', 1, 1),
(27, 'manager/Index/rule_group_list', '权限类型管理', 1, 1),
(28, 'manager/Index/rule_group_add_edit', '权限类型的添加或编辑', 1, 1),
(29, 'manager/Index/del_rule_group', '权限类型的删除', 1, 1),
(33, 'manager/Menu/set_menu', '左侧菜单列表', 1, 1),
(34, 'manager/Menu/add_menu', '新增左侧菜单', 1, 1),
(35, 'manager/Menu/del_menu', '删除左侧菜单', 1, 1),
(36, 'manager/Menu/status_menu', '修改左侧菜单状态', 1, 1),
(37, 'manager/Menu/set_menu_top', '顶部菜单列表', 1, 1),
(38, 'manager/Menu/add_menu_top', '新增顶部菜单', 1, 1),
(39, 'manager/Menu/del_menu_top', '删除顶部菜单', 1, 1),
(42, 'manager/Trash/trash_run', '开始数据清理', 1, 1),
(43, 'manager/Trash/clear_runtime', '清理runtime缓存目录', 1, 1),
(44, 'manager/Trash', '数据清理', 1, 1),
(45, 'manager/Trash/clear_session', '清理session', 1, 1),
(46, 'manager/Index/adminlog', '查看管理员日志', 1, 1),
(47, 'manager/Page', '页面自动生成', 1, 1),
(48, 'manager/Page/start_page', '开始生成页面', 1, 1),
(50, 'manager/Article/data_add', '添加文章', 1, 1),
(51, 'manager/PublicFun/ajax_upload_file', '上传文件', 1, 1),
(52, 'manager/Article/data_edit', '文章编辑', 1, 1),
(53, 'manager/Article', '文章管理', 1, 1),
(54, 'manager/Article/data_del', '删除文章', 1, 1),
(85, 'manager/uploadfile', '上传文件库列表页', 1, 1),
(86, 'manager/uploadfile/data_add', '上传文件库添加', 1, 1),
(87, 'manager/uploadfile/data_edit', '上传文件库编辑', 1, 1),
(88, 'manager/uploadfile/data_del', '上传文件库删除', 1, 1),
(89, 'manager/PublicFun/ajax_del_upload_file', '删除上传文件', 1, 1),
(90, 'manager/PublicFun/get_edit_upload', '编辑上传文件', 1, 1),
(91, 'manager/banner', '轮播图列表页', 2, 1),
(92, 'manager/banner/data_add', '轮播图添加', 2, 1),
(93, 'manager/banner/data_edit', '轮播图编辑', 2, 1),
(94, 'manager/banner/data_del', '轮播图删除', 2, 1),
(95, 'manager/goods', '房产详情列表页', 2, 1),
(96, 'manager/goods/data_add', '房产详情添加', 2, 1),
(97, 'manager/goods/data_edit', '房产详情编辑', 2, 1),
(98, 'manager/goods/data_del', '房产详情删除', 2, 1),
(99, 'manager/category', '文章分类列表页', 2, 1),
(100, 'manager/category/data_add', '文章分类添加', 2, 1),
(101, 'manager/category/data_edit', '文章分类编辑', 2, 1),
(102, 'manager/category/data_del', '文章分类删除', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ys_auth_rule_group`
--

CREATE TABLE IF NOT EXISTS `ys_auth_rule_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '权限组名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='权限组表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ys_auth_rule_group`
--

INSERT INTO `ys_auth_rule_group` (`id`, `title`) VALUES
(1, '基本'),
(2, '默认');

-- --------------------------------------------------------

--
-- 表的结构 `ys_banner`
--

CREATE TABLE IF NOT EXISTS `ys_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题-text',
  `link` varchar(255) DEFAULT NULL COMMENT '链接地址-text',
  `image` varchar(255) DEFAULT NULL COMMENT '图片上传-upload-2',
  `weight` int(11) DEFAULT NULL COMMENT '排序(数字越大越靠前)-text',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示-toggle',
  `add_time` datetime DEFAULT NULL COMMENT '添加的日期-hide-1-datetime',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ys_banner`
--

INSERT INTO `ys_banner` (`id`, `title`, `link`, `image`, `weight`, `is_show`, `add_time`) VALUES
(2, '轮播图1', 'http://www.baidu.com', '8', 40, 1, '2017-07-24 17:00:31'),
(3, '轮播图2', 'http://www.baidu.com', '11', 30, 1, '2017-07-24 17:15:01'),
(4, '轮播3', 'www.baidu.com', '29', 30, 1, '2017-08-11 15:15:29');

-- --------------------------------------------------------

--
-- 表的结构 `ys_category`
--

CREATE TABLE IF NOT EXISTS `ys_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '文章分类名称-text',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '所属分类-custom',
  `weight` int(11) NOT NULL DEFAULT '100' COMMENT '排序：数值越大越靠前-text',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文章分类表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ys_category`
--

INSERT INTO `ys_category` (`id`, `name`, `pid`, `weight`) VALUES
(1, '房产介绍', 0, 100),
(2, '公司介绍', 0, 80),
(3, '桂林房产介绍', 1, 100),
(4, '临桂房产介绍', 1, 100);

-- --------------------------------------------------------

--
-- 表的结构 `ys_config`
--

CREATE TABLE IF NOT EXISTS `ys_config` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL COMMENT '字段名',
  `table_name` varchar(255) NOT NULL COMMENT '中文名',
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='站点设置' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `ys_config`
--

INSERT INTO `ys_config` (`id`, `name`, `table_name`, `data`) VALUES
(1, 'site_title', '网站名称', '房向标--周六看房团'),
(2, 'site_subtitle', '网站副标题', '西藏旅游，西藏旅游攻略，拉萨旅游，拉萨旅游攻略'),
(3, 'site_description', '网站描述', '这是网站描述，详细描述'),
(4, 'site_email', 'EMAIL', '4025957@qq.com'),
(5, 'site_keywords', '关键词', '西藏旅游，西藏旅游攻略，拉萨旅游，拉萨旅游攻略'),
(6, 'site_license', '网站执照', '400-088-1087'),
(7, 'site_phone', '联系电话', '400-088-1087'),
(8, 'site_qq', '联系QQ', '4025957'),
(9, 'site_url', '网站地址', 'www.baidu.com'),
(10, 'site_address', '公司地址', '桂林市象山区东安街60号'),
(11, 'site_copyright', '备案号', '桂ICP备15003556号'),
(12, 'site_statistics', '统计代码', '');

-- --------------------------------------------------------

--
-- 表的结构 `ys_goods`
--

CREATE TABLE IF NOT EXISTS `ys_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '项目名称-text',
  `image` varchar(255) DEFAULT NULL COMMENT '封面图-upload-2',
  `price` decimal(10,0) DEFAULT NULL COMMENT '均价-text',
  `unit` varchar(255) DEFAULT NULL COMMENT '单位-text',
  `local_discount` varchar(255) DEFAULT NULL COMMENT '案场折扣-text',
  `vip_discount` varchar(255) DEFAULT NULL COMMENT '专享折扣-text',
  `subsidy` varchar(255) DEFAULT NULL COMMENT '契税补贴-text',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示-toggle',
  `weight` int(11) DEFAULT NULL COMMENT '排序(数字越大越靠前)-text',
  `content` text COMMENT '正文内容-edit-2',
  `add_date` datetime DEFAULT NULL COMMENT '添加的日期-hide-1-datetime',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ys_goods`
--

INSERT INTO `ys_goods` (`id`, `name`, `image`, `price`, `unit`, `local_discount`, `vip_discount`, `subsidy`, `is_show`, `weight`, `content`, `add_date`) VALUES
(1, '桂林【秀峰区】桃源居', '16,20', '7200', '元/平米', '贷款99 一次性98', '10000万', '1%', 1, 10, '<p><img src="/ueditor/php/upload/image/20170725/1500970723134646.png" title="1500970723134646.png" alt="20170724170311.png"/></p><p><img src="/ueditor/php/upload/image/20170725/1500970727650898.png" title="1500970727650898.png" alt="20170724170311.png"/></p><p><img src="/ueditor/php/upload/image/20170725/1500970828106421.png" title="1500970828106421.png" alt="20170724170311.png"/></p><p><img src="/ueditor/php/upload/image/20170725/1500970732533077.png" title="1500970732533077.png" alt="20170724170311.png"/></p>', '2017-07-26 15:37:41'),
(2, '桂林【七星区】彰泰园兰乔圣菲', '21', '7500', '元/平米', '案场99 一次性98', '8000元', '1%', 1, 13, '<p><img src="/ueditor/php/upload/image/20170725/1500971311897772.png" title="1500971311897772.png" alt="20170724170311.png"/></p><p><img src="/ueditor/php/upload/image/20170725/1500971314139440.png" title="1500971314139440.png" alt="20170724170311.png"/></p><p><img src="/ueditor/php/upload/image/20170725/1500971317110380.png" title="1500971317110380.png" alt="20170724170311.png"/></p>', '2017-07-25 16:26:51'),
(3, '桂林【秀峰区】清华园', '28', '8000', '元/平米起', '99 98', '10000元', '1%', 1, 30, '<p><img src="/ueditor/php/upload/image/20170726/1501054593117128.png" title="1501054593117128.png" alt="02.png"/><img src="/ueditor/php/upload/image/20170726/1501054597826855.png" title="1501054597826855.png" alt="03.png"/><img src="/ueditor/php/upload/image/20170726/1501054601724483.png" title="1501054601724483.png" alt="20170724170311.png"/></p>', '2017-07-26 15:35:17');

-- --------------------------------------------------------

--
-- 表的结构 `ys_left_menu`
--

CREATE TABLE IF NOT EXISTS `ys_left_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '无' COMMENT '菜单名称',
  `url` varchar(255) DEFAULT 'javascript:;' COMMENT '菜单链接',
  `type` int(11) DEFAULT NULL COMMENT '权限标识',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `one` tinyint(1) DEFAULT NULL COMMENT '一级菜单标识',
  `two` varchar(255) DEFAULT NULL COMMENT '二级菜单id',
  `blank` tinyint(1) DEFAULT '0' COMMENT '是否新窗口打开',
  `quick` tinyint(1) DEFAULT '0' COMMENT '是否为常用菜单栏',
  `weight` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `ys_left_menu`
--

INSERT INTO `ys_left_menu` (`id`, `title`, `url`, `type`, `is_show`, `one`, `two`, `blank`, `quick`, `weight`) VALUES
(21, '微信管理', 'javascript:;', NULL, 1, 1, '22,23,24,28,29', 0, 0, 1),
(22, '公众号管理', 'javascript:;', NULL, 1, NULL, NULL, 0, 0, 1),
(23, '微信会员', 'javascript:;', NULL, 1, NULL, NULL, 0, 0, 5),
(24, '回复管理', 'javascript:;', NULL, 1, NULL, '25,26,27', 0, 0, 8),
(25, '欢迎消息', 'javascript:;', NULL, 1, NULL, NULL, 0, 0, 1),
(26, '文字消息回复', 'javascript:;', NULL, 1, NULL, NULL, 0, 0, 5),
(27, '图片消息回复', 'javascript:;', NULL, 1, NULL, NULL, 0, 0, 10),
(28, '自定义菜单', 'javascript:;', NULL, 1, NULL, NULL, 0, 0, 15),
(29, '微信设置', 'javascript:;', NULL, 1, NULL, NULL, 0, 0, 20),
(30, '文章内容管理', '/manager/Article', NULL, 1, NULL, NULL, 0, 1, 5),
(31, '上传文件库', '/manager/uploadfile', NULL, 1, 1, NULL, 0, 0, 99),
(32, '网站设置', 'javascript:;', NULL, 1, 1, '33', 0, 0, 90),
(33, '轮播图设置', '/manager/Banner', NULL, 1, NULL, NULL, 0, 0, 40),
(34, '房产管理', 'javascript:;', NULL, 1, 1, '35', 0, 0, 30),
(35, '房产详情管理', '/manager/Goods', NULL, 1, NULL, NULL, 0, 0, 10),
(36, '文章管理', 'javascript:;', NULL, 1, 1, '30,37', 0, 0, 50),
(37, '文章分类管理', '/manager/Category', NULL, 1, NULL, NULL, 0, 0, 30);

-- --------------------------------------------------------

--
-- 表的结构 `ys_manager_topmenu`
--

CREATE TABLE IF NOT EXISTS `ys_manager_topmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '无' COMMENT '顶部按钮名称',
  `url` varchar(255) DEFAULT 'javascript:;' COMMENT '点击访问的url',
  `is_show` varchar(255) DEFAULT NULL COMMENT '对应用户组显示出来(多个组id之间用逗号分隔)',
  `blank` tinyint(1) DEFAULT '0' COMMENT '是否新窗口打开',
  `weight` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ys_manager_topmenu`
--

INSERT INTO `ys_manager_topmenu` (`id`, `title`, `url`, `is_show`, `blank`, `weight`) VALUES
(1, '自定义1', 'javascript:;', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ys_setting`
--

CREATE TABLE IF NOT EXISTS `ys_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '设置的名称',
  `name` varchar(255) NOT NULL COMMENT '设置的控制标识',
  `val` varchar(255) DEFAULT NULL COMMENT '设置的值',
  `type` int(11) DEFAULT '2' COMMENT '类型标示',
  `type_style` int(11) DEFAULT '1' COMMENT '后台展示的形式(1:输入框，2:开关，3:下拉框，4:文本编辑器，5:上传，6:复选框，7:文本域，8:单选)',
  `type_txt` varchar(255) DEFAULT NULL COMMENT '后台生成表单的文字选项(用;号分隔，第一个元素必须是开启的意思)',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助说明的文字',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台设置表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `ys_setting`
--

INSERT INTO `ys_setting` (`id`, `title`, `name`, `val`, `type`, `type_style`, `type_txt`, `help`) VALUES
(2, '后台登录是否启用验证码', 'login_allow_verify', '0', 1, 2, '启用;不启用', NULL),
(3, '是否限制登录失败的次数', 'login_error_times', '0', 1, 2, '是;否', NULL),
(4, '登录失败的次数值(单位：次)', 'error_times_num', '6', 1, 1, NULL, '开启“是否限制登录失败的次数”才生效'),
(5, '禁止登录的时间间隔(单位：秒)', 'error_wait_time', '600', 1, 1, NULL, '开启“是否限制登录失败的次数”才生效'),
(6, '是否只允许单人登录', 'single_login', '0', 1, 2, '是;否', NULL),
(7, '是否启用手机版九宫格登录', 'nine_login', '1', 1, 2, '启用;不启用', NULL),
(8, '是否自动填入登录用户名', 'record_login_username', '1', 1, 2, '是;否', NULL),
(9, '后台操作是否记录管理员日志', 'record_admin_log', '0', 1, 2, '是;否', NULL),
(10, '登录后是否自动清理3个月前的管理员日志', 'auto_clear_adminlog', '0', 1, 2, '是;否', NULL),
(11, '一定时间后登录时自动清理runtime缓存目录(单位:天)', 'auto_clear_runtime', '30', 1, 1, NULL, '关闭的话设为0'),
(12, '测试测试', 'testtest', '', 2, 1, '', '仅作');

-- --------------------------------------------------------

--
-- 表的结构 `ys_uploadfile`
--

CREATE TABLE IF NOT EXISTS `ys_uploadfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '名称-text',
  `url` text COMMENT 'url-textarea',
  `adminid` int(11) DEFAULT NULL COMMENT '管理员id-text-2',
  `admin_name` varchar(255) DEFAULT NULL COMMENT '管理员名称-text',
  `add_time` int(11) DEFAULT NULL COMMENT '上传的时间戳-hide-2-timestamp',
  `add_date` datetime DEFAULT NULL COMMENT '上传的日期-hide-1-datetime',
  `update_time` int(11) DEFAULT NULL COMMENT '更新文件的时间戳-edit_hide-2-timestamp',
  `update_date` datetime DEFAULT NULL COMMENT '更新文件的日期-edit_hide-1-datetime',
  `weight` int(11) DEFAULT NULL COMMENT '排序(数字越大越靠前)-text',
  `param` text COMMENT '参数-textarea-2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `ys_uploadfile`
--

INSERT INTO `ys_uploadfile` (`id`, `title`, `url`, `adminid`, `admin_name`, `add_time`, `add_date`, `update_time`, `update_date`, `weight`, `param`) VALUES
(8, '767747b7cb9d7f799134b22fb46927aa.png', '\\uploads\\20170724\\767747b7cb9d7f799134b22fb46927aa.png', 2, 'master', 1500884278, '2017-07-24 16:17:58', 1500884278, '2017-07-24 16:17:58', NULL, NULL),
(10, '6045a2f00faecd427827f9ffec772c88.png', '\\uploads\\20170724\\6045a2f00faecd427827f9ffec772c88.png', 2, 'master', 1500887555, '2017-07-24 17:12:35', 1500887555, '2017-07-24 17:12:35', NULL, NULL),
(11, 'fd1a1ef3af6860db1e57b0df8907d916.png', '\\uploads\\20170724\\fd1a1ef3af6860db1e57b0df8907d916.png', 2, 'master', 1500887711, '2017-07-24 17:15:11', 1500887711, '2017-07-24 17:15:11', NULL, NULL),
(12, '30f75172f7467a6a08f4359a9c436479.png', '\\uploads\\20170725\\30f75172f7467a6a08f4359a9c436479.png', 2, 'master', 1500963995, '2017-07-25 14:26:35', 1500963995, '2017-07-25 14:26:35', NULL, NULL),
(13, '84aec60e0c1396089a2b3f86e2455052.png', '\\uploads\\20170725\\84aec60e0c1396089a2b3f86e2455052.png', 2, 'master', 1500964024, '2017-07-25 14:27:04', 1500964024, '2017-07-25 14:27:04', NULL, NULL),
(14, 'cf518056e8c794e7ee02e6386ac22d48.png', '\\uploads\\20170725\\cf518056e8c794e7ee02e6386ac22d48.png', 2, 'master', 1500965252, '2017-07-25 14:47:32', 1500965252, '2017-07-25 14:47:32', NULL, NULL),
(15, 'c2fe007015e451b9645fc0c3e27e0cf2.png', '\\uploads\\20170725\\c2fe007015e451b9645fc0c3e27e0cf2.png', 2, 'master', 1500965300, '2017-07-25 14:48:20', 1500965300, '2017-07-25 14:48:20', NULL, NULL),
(17, 'ca617be8e43dda7e7ed41ce8f0ab2e7e.png', '\\uploads\\20170725\\ca617be8e43dda7e7ed41ce8f0ab2e7e.png', 2, 'master', 1500965701, '2017-07-25 14:55:01', 1500965701, '2017-07-25 14:55:01', NULL, NULL),
(19, '58abcf2c333dd8115e2c039bfa6c0ab7.png', '\\uploads\\20170725\\58abcf2c333dd8115e2c039bfa6c0ab7.png', 2, 'master', 1500970457, '2017-07-25 16:14:17', 1500970457, '2017-07-25 16:14:17', NULL, NULL),
(20, '7288a9b1778ca7de60ae7f6ea32578cc.png', '\\uploads\\20170725\\7288a9b1778ca7de60ae7f6ea32578cc.png', 2, 'master', 1500970631, '2017-07-25 16:17:11', 1500970631, '2017-07-25 16:17:11', NULL, NULL),
(21, '206714eb9ce06a87362d2fcf2354065d.png', '\\uploads\\20170725\\206714eb9ce06a87362d2fcf2354065d.png', 2, 'master', 1500971272, '2017-07-25 16:27:52', 1500971272, '2017-07-25 16:27:52', NULL, NULL),
(22, '9b40fb199a17727f009f77427c4128bb.png', '\\uploads\\20170725\\9b40fb199a17727f009f77427c4128bb.png', 2, 'master', 1500971398, '2017-07-25 16:29:58', 1500971398, '2017-07-25 16:29:58', NULL, NULL),
(23, '901cd1807b25dc9152802e755b213728.png', '\\uploads\\20170725\\901cd1807b25dc9152802e755b213728.png', 2, 'master', 1500971407, '2017-07-25 16:30:07', 1500971407, '2017-07-25 16:30:07', NULL, NULL),
(24, '5a2d3c9ccc3ff3c8cc86632c5e4942bd.png', '\\uploads\\20170726\\5a2d3c9ccc3ff3c8cc86632c5e4942bd.png', 2, 'master', 1501054095, '2017-07-26 15:28:15', 1501054095, '2017-07-26 15:28:15', NULL, NULL),
(25, '272954a0733cc9c356fb05f5fa1692b3.png', '\\uploads\\20170726\\272954a0733cc9c356fb05f5fa1692b3.png', 2, 'master', 1501054100, '2017-07-26 15:28:20', 1501054100, '2017-07-26 15:28:20', NULL, NULL),
(26, 'e8319f7dec277d2821c754a417918671.png', '\\uploads\\20170726\\e8319f7dec277d2821c754a417918671.png', 2, 'master', 1501054170, '2017-07-26 15:29:30', 1501054170, '2017-07-26 15:29:30', NULL, NULL),
(27, '6420960ed9e5131b81fc3b914dbba786.png', '\\uploads\\20170726\\6420960ed9e5131b81fc3b914dbba786.png', 2, 'master', 1501054174, '2017-07-26 15:29:34', 1501054174, '2017-07-26 15:29:34', NULL, NULL),
(28, 'fe4154b7bda9981b1408e6497ad288bb.png', '\\uploads\\20170726\\fe4154b7bda9981b1408e6497ad288bb.png', 2, 'master', 1501054563, '2017-07-26 15:36:03', 1501054563, '2017-07-26 15:36:03', NULL, NULL),
(29, 'a9d681425030741fa562f6558c6459d8.jpg', '\\uploads\\20170811\\a9d681425030741fa562f6558c6459d8.jpg', 2, 'master', 1502435749, '2017-08-11 15:15:49', 1502435749, '2017-08-11 15:15:49', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
