/*
Navicat MySQL Data Transfer

Source Server         : LOCAL
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mess

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-11-10 19:33:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `table_admin`
-- ----------------------------
DROP TABLE IF EXISTS `table_admin`;
CREATE TABLE `table_admin` (
  `admin_id` char(16) NOT NULL COMMENT '管理员ID',
  `admin_name` varchar(32) DEFAULT NULL COMMENT '管理员名称',
  `pass_word` varchar(32) DEFAULT NULL COMMENT '密码',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of table_admin
-- ----------------------------
INSERT INTO `table_admin` VALUES ('1', 'admin', 'admin', '2017-11-10 16:09:24');

-- ----------------------------
-- Table structure for `table_append_mess`
-- ----------------------------
DROP TABLE IF EXISTS `table_append_mess`;
CREATE TABLE `table_append_mess` (
  `ap_mess_id` char(16) NOT NULL COMMENT '附属留言ID',
  `ap_parent_id` char(16) NOT NULL COMMENT '宿主留言ID',
  `ap_mess_content` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `ap_user_id` char(16) DEFAULT NULL COMMENT '留言者ID',
  `ap_user_name` varchar(32) DEFAULT NULL COMMENT '留言者名称',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `audit` tinyint(1) DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`ap_mess_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附属留言表';

-- ----------------------------
-- Records of table_append_mess
-- ----------------------------

-- ----------------------------
-- Table structure for `table_message`
-- ----------------------------
DROP TABLE IF EXISTS `table_message`;
CREATE TABLE `table_message` (
  `mess_id` char(16) NOT NULL COMMENT '留言ID',
  `mess_content` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `user_id` char(16) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `audit` tinyint(1) DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`mess_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of table_message
-- ----------------------------
INSERT INTO `table_message` VALUES ('1', '今天周四', '111', 'aa', '2017-11-10 16:07:59', '2017-11-10 16:08:03', '0');
INSERT INTO `table_message` VALUES ('2', '今天周五', '111', 'aa', '2017-11-10 16:39:47', '2017-11-10 16:39:50', '0');

-- ----------------------------
-- Table structure for `table_user`
-- ----------------------------
DROP TABLE IF EXISTS `table_user`;
CREATE TABLE `table_user` (
  `user_id` char(16) NOT NULL COMMENT '用户ID',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `pass_word` varchar(32) DEFAULT NULL COMMENT '密码',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `audit` tinyint(1) DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of table_user
-- ----------------------------
INSERT INTO `table_user` VALUES ('111', 'aa', 'aa', '2017-11-10 16:06:46', '0');

-- ----------------------------
-- Table structure for `table_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `table_user_info`;
CREATE TABLE `table_user_info` (
  `user_id` char(16) NOT NULL COMMENT '用户ID',
  `user_real_name` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `city` varchar(32) DEFAULT NULL COMMENT '城市',
  `school` varchar(32) DEFAULT NULL COMMENT '学校',
  `picture` varchar(64) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of table_user_info
-- ----------------------------
INSERT INTO `table_user_info` VALUES ('111', 'aa', 'tiantin', 'tianjin', '\\uploads\\images\\1.jpg');

-- ----------------------------
-- View structure for `view_table_message`
-- ----------------------------
DROP VIEW IF EXISTS `view_table_message`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_table_message` AS select `table_message`.`mess_id` AS `mess_id`,`table_message`.`mess_content` AS `mess_content`,`table_message`.`user_id` AS `user_id`,`table_message`.`user_name` AS `user_name`,`table_message`.`creat_time` AS `creat_time`,`table_message`.`operate_time` AS `operate_time`,`table_message`.`audit` AS `audit`,`table_user_info`.`picture` AS `picture` from (`table_message` left join `table_user_info` on((`table_message`.`user_id` = `table_user_info`.`user_id`))) ;
