/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-01-16 21:59:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `_admin`
-- ----------------------------
DROP TABLE IF EXISTS `_admin`;
CREATE TABLE `_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _admin
-- ----------------------------
INSERT INTO `_admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `_category`
-- ----------------------------
DROP TABLE IF EXISTS `_category`;
CREATE TABLE `_category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _category
-- ----------------------------
INSERT INTO `_category` VALUES ('1', 'Java');
INSERT INTO `_category` VALUES ('3', 'Python');
INSERT INTO `_category` VALUES ('4', 'HTML/CSS');
INSERT INTO `_category` VALUES ('5', 'JavaScript');
INSERT INTO `_category` VALUES ('6', 'Java Web');
INSERT INTO `_category` VALUES ('7', '操作系统');
INSERT INTO `_category` VALUES ('8', '数据结构与算法');
INSERT INTO `_category` VALUES ('9', '数据库');
INSERT INTO `_category` VALUES ('10', 'Android');
INSERT INTO `_category` VALUES ('12', 'IOS');

-- ----------------------------
-- Table structure for `_order`
-- ----------------------------
DROP TABLE IF EXISTS `_order`;
CREATE TABLE `_order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `_order_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _order
-- ----------------------------
INSERT INTO `_order` VALUES ('15', '64.4', '2016-01-10 10:54:32', '2', '1', '范超', '13921901231', '河北省石家庄市', '057250');
INSERT INTO `_order` VALUES ('16', '856.1', '2016-01-12 21:03:22', '3', '1', '范超', '13921901231', '河北省石家庄市', '057250');
INSERT INTO `_order` VALUES ('17', '167.9', '2016-01-15 13:30:22', '1', '1', '范超', '13921901231', '河北省石家庄市', '057250');
INSERT INTO `_order` VALUES ('18', '311.4', '2016-01-16 19:04:41', '1', '1', '范超', '13921901231', '河北省石家庄市', '057250');

-- ----------------------------
-- Table structure for `_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `_order_item`;
CREATE TABLE `_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `oid` (`oid`),
  CONSTRAINT `_order_item_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `_product` (`pid`),
  CONSTRAINT `_order_item_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `_order` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _order_item
-- ----------------------------
INSERT INTO `_order_item` VALUES ('8', '1', '64.4', '50', '15');
INSERT INTO `_order_item` VALUES ('9', '5', '344', '44', '16');
INSERT INTO `_order_item` VALUES ('10', '9', '512.1', '42', '16');
INSERT INTO `_order_item` VALUES ('11', '2', '167.9', '32', '17');
INSERT INTO `_order_item` VALUES ('12', '9', '311.4', '47', '18');

-- ----------------------------
-- Table structure for `_product`
-- ----------------------------
DROP TABLE IF EXISTS `_product`;
CREATE TABLE `_product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid` (`cid`),
  CONSTRAINT `_product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `_category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _product
-- ----------------------------
INSERT INTO `_product` VALUES ('1', 'Java编程思想（第四版）', '埃史尔', '89.2', 'image/image1.jpg', '2007-06-01', '1');
INSERT INTO `_product` VALUES ('28', 'Java核心技术(卷1):基础知识(原书第9版)', '霍斯特曼 (Cay S. Horstmann)', '91.4', 'image/image2.jpg', '2013-11-18', '1');
INSERT INTO `_product` VALUES ('29', 'Java语言程序设计(基础篇)(原书第8版)', '梁勇 (Y.Daniel Liang)', '60', 'image/image3.jpg', '2011-06-01', '1');
INSERT INTO `_product` VALUES ('30', 'Sun 公司核心技术丛书:Effective Java中文版(第2版)', 'Joshua Bloch', '31.2', 'image/image4.jpg', '2009-01-01', '1');
INSERT INTO `_product` VALUES ('31', '深入理解Java虚拟机:JVM高级特性与最佳实践(第2版)', '周志明', '58', 'image/image5.jpg', '2013-06-13', '1');
INSERT INTO `_product` VALUES ('32', '疯狂Java讲义(第3版)(附CD光盘1张)', '李刚', '83.93', 'image/image6.jpg', '2014-07-01', '1');
INSERT INTO `_product` VALUES ('33', 'Java并发编程实战', '盖茨 (Brian Goetz)', '51.3', 'image/image7.jpg', '2012-02-18', '1');
INSERT INTO `_product` VALUES ('34', 'Java核心技术·卷2:高级特性(原书第9版)', '霍斯特曼 (Cay S.Horstmann)', '96.5', 'image/image8.jpg', '2014-03-10', '1');
INSERT INTO `_product` VALUES ('35', 'Java语言程序设计:进阶篇(原书第8版)', '梁勇(Y.Daniel Liang) 63.20', '63.2', 'image/image9.jpg', '2011-06-11', '1');
INSERT INTO `_product` VALUES ('36', 'Java从入门到精通(第3版)(附光盘)', '明日科技', '35.9', 'image/image10.jpg', '2012-09-01', '1');
INSERT INTO `_product` VALUES ('37', '数据结构与算法分析:C语言描述(原书第2版)', '维斯', '25.1', 'image/image11.jpg', '2004-01-01', '8');
INSERT INTO `_product` VALUES ('38', '数据结构与算法分析:Java语言描述(第2版)', '韦斯 (Mark Allen Weiss)', '33', 'image/image12.jpg', '2009-01-01', '8');
INSERT INTO `_product` VALUES ('39', '算法导论(原书第3版)', 'Thomas H.Cormen', '87', 'image/image13.jpg', '2012-12-06', '8');
INSERT INTO `_product` VALUES ('40', '图灵程序设计丛书:算法(第4版)', '塞奇威克 (Robert Sedgewick)', '64.4', 'image/image14.jpg', '2012-10-01', '8');
INSERT INTO `_product` VALUES ('41', '大话数据结构', '程杰', '41.1', 'image/image15.jpg', '2011-07-07', '8');
INSERT INTO `_product` VALUES ('42', '程序员代码面试指南:IT名企算法与数据结构题目最优解', '左程云', '56.9', 'image/image16.jpg', '2015-09-01', '8');
INSERT INTO `_product` VALUES ('43', '现代操作系统(原书第3版)', '塔嫩鲍姆 (Tanenbaum.A.S)', '56.2', 'image/image17.jpg', '2009-07-01', '7');
INSERT INTO `_product` VALUES ('44', '计算机科学丛书:深入理解计算机系统(原书第2版)', '布莱恩特 (Randal E.Bryant)', '68.8', 'image/image18.jpg', '2011-01-01', '7');
INSERT INTO `_product` VALUES ('45', '操作系统:精髓与设计原理(原书第6版)', '斯托林斯(William Stallings) ', '54.7', 'image/image19.jpg', '2010-09-01', '7');
INSERT INTO `_product` VALUES ('47', '\"笨办法\"学Python(第3版)', '肖 (Zed A.Shaw)', '34.6', 'image/image21.jpg', '2014-11-01', '3');
INSERT INTO `_product` VALUES ('48', 'Python Cookbook(第3版)(中文版)', '大卫·比斯利 (David Beazley)', '64.8', 'image/image22.jpg', '2015-05-01', '3');
INSERT INTO `_product` VALUES ('49', 'Head First HTML与CSS(第2版)', '罗布森 (Elisabeth Robson)', '70.3', 'image/image23.jpg', '2013-09-01', '4');
INSERT INTO `_product` VALUES ('50', 'JavaScript高级程序设计(第3版)', '泽卡斯 (Zakas. Nicholas C.)', '64.4', 'image/image24.jpg', '2012-03-01', '5');
INSERT INTO `_product` VALUES ('51', 'JavaScript DOM编程艺术(第2版)', '基思 (Jeremy Keith)', '34', 'image/image25.jpg', '2011-04-01', '5');
INSERT INTO `_product` VALUES ('52', '名师讲坛:Java Web开发实战经典基础篇(JSP、Servlet、Struts、Ajax)', '李兴华', '53.3', 'image/image26.jpg', '2010-08-01', '6');
INSERT INTO `_product` VALUES ('53', '疯狂软件教育标准教材:Struts 2.x权威指南(第3版)', '李刚', '72', 'image/image27.jpg', '2012-10-01', '6');
INSERT INTO `_product` VALUES ('66', 'test', 'test', '99', 'image/as.jpg', null, '10');
INSERT INTO `_product` VALUES ('67', 'qweqwe', 'qweqw', '12', 'image/b29a686fa25f001df7ea9a1e539b4c00_b.jpg', null, '3');
INSERT INTO `_product` VALUES ('68', '3123', '123123', '111', 'image/as.jpg', '2016-01-01', '1');
INSERT INTO `_product` VALUES ('69', '1231', '12312', '11', 'image/2e2b014f78f0f7367b03e3ae0955b319eac4136b.jpg', '2015-12-30', '1');

-- ----------------------------
-- Table structure for `_user`
-- ----------------------------
DROP TABLE IF EXISTS `_user`;
CREATE TABLE `_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of _user
-- ----------------------------
INSERT INTO `_user` VALUES ('1', 'fanchao', '123', '范超', '1104641801@qq.com', '13921901231', '河北省石家庄市', '057250');
INSERT INTO `_user` VALUES ('2', '范超', '123', '范超', '110@qq.com', '11111111111', '河北经贸大学', '010101');
