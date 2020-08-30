/*
Navicat MySQL Data Transfer

Source Server         : zyqwe
Source Server Version : 50527
Source Host           : 192.168.43.108:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2020-08-30 11:36:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '重庆');
INSERT INTO `address` VALUES ('2', '成都');
INSERT INTO `address` VALUES ('3', '长沙');
INSERT INTO `address` VALUES ('4', '云南');

-- ----------------------------
-- Table structure for fault
-- ----------------------------
DROP TABLE IF EXISTS `fault`;
CREATE TABLE `fault` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '故障id',
  `f_img` varchar(255) DEFAULT NULL,
  `fcontent_id` int(255) DEFAULT NULL COMMENT '故障信息id',
  `f_machine` varchar(255) DEFAULT NULL COMMENT '故障机器',
  `address_id` int(11) DEFAULT NULL,
  `f_state` varchar(255) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `over_time` date DEFAULT NULL,
  `f_describe` varchar(255) DEFAULT NULL COMMENT '故障描述',
  `f_userid` int(11) DEFAULT NULL COMMENT '修理工id',
  PRIMARY KEY (`f_id`),
  KEY `fcontent_id` (`fcontent_id`),
  KEY `address_id` (`address_id`),
  KEY `f_userid` (`f_userid`),
  CONSTRAINT `fault_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fault_ibfk_3` FOREIGN KEY (`f_userid`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='故障清单表\r\n';

-- ----------------------------
-- Records of fault
-- ----------------------------
INSERT INTO `fault` VALUES ('1', 'test.jpg', '3', 'TK-108', '2', '已完成', '2020-08-29', '2020-08-30', '运行时内部出现异响', null);
INSERT INTO `fault` VALUES ('4', 'hahah.jsp', '3', 'kb-000', '4', '未修理', '2020-08-29', null, '指示灯不亮了, 未处理', '1');
INSERT INTO `fault` VALUES ('5', 'hahah.jsp', '5', 'tr-800', '2', '未修理', '2020-08-29', null, '杨威不行了', '2');
INSERT INTO `fault` VALUES ('6', 'hahah.jsp', '2', 'qerw-778', '1', '未修理', '2020-08-29', null, '我的天哪哦', '3');
INSERT INTO `fault` VALUES ('7', 'D:\\javastart\\apache-tomcat-9.0.37\\work\\Catalina\\localhost\\MaintenanceDemo\\upload__70e18361_1743993a109__8000_00000005.tmp', '3', 'kb-000', '2', '未修理', '2020-08-29', null, '杨威拉屎不带纸', '3');
INSERT INTO `fault` VALUES ('18', 'D:\\javastart\\apache-tomcat-9.0.37\\work\\Catalina\\localhost\\MaintenanceDemo\\upload__48832d9d_1743a1f8d17__8000_00000017.tmp', '4', 'tr-800', '2', '未修理', '2020-08-29', null, '	v巨好看					', null);
INSERT INTO `fault` VALUES ('19', 'D:\\javastart\\apache-tomcat-9.0.37\\work\\Catalina\\localhost\\MaintenanceDemo\\upload__65d1c09c_1743a25fc22__8000_00000005.tmp', '4', 'kb-000', '2', '未修理', '2020-08-29', null, '			金额是金色			', null);
INSERT INTO `fault` VALUES ('27', '', '2', 'tr-800', '3', '未修理', '2020-08-30', null, '		fgflgkyigih				', null);
INSERT INTO `fault` VALUES ('28', null, '3', 'qerw-778', '2', '已修理', '2020-08-30', null, '要好的				', null);

-- ----------------------------
-- Table structure for fault_content
-- ----------------------------
DROP TABLE IF EXISTS `fault_content`;
CREATE TABLE `fault_content` (
  `fcontent_id` int(11) NOT NULL AUTO_INCREMENT,
  `fcontent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fcontent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='故障信息表';

-- ----------------------------
-- Records of fault_content
-- ----------------------------
INSERT INTO `fault_content` VALUES ('1', '错误信息1');
INSERT INTO `fault_content` VALUES ('2', '错误信息2');
INSERT INTO `fault_content` VALUES ('3', '错误信息3');
INSERT INTO `fault_content` VALUES ('4', '错误信息4');
INSERT INTO `fault_content` VALUES ('5', '错误信息5');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `address_id` int(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `address_id` (`address_id`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '杨威', '1', 'yw', '123', '修理工', '123456');
INSERT INTO `user` VALUES ('2', 'aaa', '2', 'aaa', 'aaa', '修理工', '123789');
INSERT INTO `user` VALUES ('3', 'bbb', '2', 'bbb', '123456', '修理工', '123147');
INSERT INTO `user` VALUES ('4', 'ccc', '3', 'ccc', '123456', '生产工', '123369');
INSERT INTO `user` VALUES ('5', '杨威123', '3', 'yw123', '321', '生产工', '13258');
INSERT INTO `user` VALUES ('6', 'ddd', '1', 'ddd', 'ddd', '管理员', '123123');
INSERT INTO `user` VALUES ('7', 'fff', '2', 'fff', 'fff', '生产工', '123789963');
