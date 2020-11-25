/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : spot_business

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-11-25 11:40:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `accounts_id` int NOT NULL AUTO_INCREMENT COMMENT '费用结算ID',
  `bussiness_id` int NOT NULL COMMENT '关联商户ID',
  `user_id` int NOT NULL COMMENT '经手管理员ID',
  `accounts_date` date NOT NULL COMMENT '结算期限',
  `accounts_money` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '结算金额',
  `accounts_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '结算事宜',
  `remarks` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `accounts_status` int NOT NULL COMMENT '结算状态 0 未结算 1 按时结算 2 延期结算',
  `publish_date` date NOT NULL COMMENT '发布日期',
  `shop_id` int NOT NULL COMMENT '关联商铺ID',
  `accounts_type` int NOT NULL COMMENT '1 为租金收取 2为物业管理费 3位其他费用',
  PRIMARY KEY (`accounts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES ('1', '1', '1', '2020-11-05', '20', '水费', null, '1', '2020-11-01', '1', '2');
INSERT INTO `accounts` VALUES ('2', '12', '1', '2020-11-01', '4864', '4856464', '4156', '0', '2020-11-08', '1', '1');

-- ----------------------------
-- Table structure for agreement
-- ----------------------------
DROP TABLE IF EXISTS `agreement`;
CREATE TABLE `agreement` (
  `agreement_id` int NOT NULL AUTO_INCREMENT COMMENT '合同ID',
  `bussiness_id` int NOT NULL COMMENT '关联商户ID',
  `investment_id` int NOT NULL COMMENT '关联招商服务ID',
  `agreement_name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '合同名称',
  `agreement_content` varchar(5000) COLLATE utf8_bin NOT NULL COMMENT '合同内容',
  `agreement_date` date DEFAULT NULL COMMENT '合同签订时间',
  `agreement_status` int NOT NULL COMMENT '合同状态 1 有效 0 未签署无效或到期自动无效 2 管理员废除合同  3 商户主动退出',
  `agreement_time` date DEFAULT NULL COMMENT '合同签订年限',
  `remarks` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `user_id` int DEFAULT NULL COMMENT '用户的ID',
  `apply_id` int DEFAULT NULL COMMENT '对应的申请表的ID',
  `deadline` date DEFAULT NULL COMMENT '合同截止时间',
  `begin_date` date DEFAULT NULL COMMENT '审批完成时间，即合同开始时间',
  `shop_id` int DEFAULT NULL COMMENT '关联商铺ID',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of agreement
-- ----------------------------
INSERT INTO `agreement` VALUES ('12', '12', '3', '租赁合同2020022', '<p>甲方：XXX有限公司<br><br>乙方：XXX旅游景区管理公司<br><br><b>第一条： 租赁细则</b><br><br>&nbsp;&nbsp;&nbsp;&nbsp;1) xxxxxx<br><br>&nbsp;&nbsp;&nbsp;&nbsp;2) xxxxxx<br><br>&nbsp;&nbsp;&nbsp;&nbsp;3) xxxxxx<br><br><b>第二条： 租赁时长</b><br><br>&nbsp;&nbsp;&nbsp;&nbsp;1) xxxxx<br><br>&nbsp;&nbsp;&nbsp;&nbsp;2) xxxxx<br><br>&nbsp;&nbsp;&nbsp;&nbsp;3) xxxxx<br><br>签署时间: xxxxxx<br><br>最后完成期限:xxxxxx</p>', null, '2', '2021-12-31', null, '1', '1', '2020-11-27', '2020-11-25', '2');

-- ----------------------------
-- Table structure for apply_investment
-- ----------------------------
DROP TABLE IF EXISTS `apply_investment`;
CREATE TABLE `apply_investment` (
  `apply_id` int NOT NULL AUTO_INCREMENT COMMENT '申请ID 递增',
  `bussiness_id` int NOT NULL COMMENT '申请商户ID 关联商户ID',
  `investment_id` int DEFAULT NULL COMMENT '招商服务ID 关联招商服务',
  `apply_reason` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '申请理由 不为空',
  `apply_date` date NOT NULL COMMENT '申请时间',
  `apply_status` int DEFAULT NULL COMMENT '审批状态 0未审批 1未通过 2已通过 3进行中',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `apply_type` int NOT NULL COMMENT '申请种类 0表示申请商铺 1表示申请退铺',
  `shop_id` int DEFAULT NULL COMMENT '申请退铺时的商铺ID',
  `apply_name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '申请名称',
  `user_id` int DEFAULT NULL COMMENT '审批管理员ID',
  `end_date` date DEFAULT NULL COMMENT '审批完成时间',
  `deadline` date DEFAULT NULL COMMENT '合同有效期限',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of apply_investment
-- ----------------------------
INSERT INTO `apply_investment` VALUES ('1', '12', '3', 'hgfh', '2020-11-20', '2', 'hgfh', '0', '2', 'rgtyh', '1', '2020-11-25', '2020-11-27');

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `business_id` int NOT NULL AUTO_INCREMENT COMMENT '商户ID 主键',
  `user_id` int NOT NULL COMMENT '商户负责人ID',
  `business_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商户名称',
  `business_intro` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商户简介',
  `business_num` int NOT NULL COMMENT '商户员工数量',
  `business_money` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商户资金',
  `business_type` int NOT NULL COMMENT '商户类型 关联商户类型表ID',
  `business_settled_date` date DEFAULT NULL COMMENT '商户入驻时间',
  `business_grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商户积分',
  `business_status` int NOT NULL COMMENT '商户状态 0待审核 -1审核不通过 1 未入驻  2已入驻 3被警告  4 已失效',
  `business_level` int NOT NULL COMMENT '商户等级 从低到高 依次从-1到3 -1 不良商户 0 普通商户 1 良好商户 2 优质商户',
  `business_pay` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商户欠费，默认为0',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `business_leave` date DEFAULT NULL COMMENT '商户撤离日期 可为空',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址，可为空',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商户网址地址，可为空',
  `business_cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商户平均花销',
  PRIMARY KEY (`business_id`,`business_money`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('1', '11', '达州友好食品有限公司', 'dsadsaddsa', '22', '660', '1', '2020-10-20', '0', '1', '0', '0', 'dsadsadasd', '2020-10-06', '', 'www.baidu.com', '');
INSERT INTO `business` VALUES ('2', '11', '达州友好食品有限公司', 'dsadsaddsa', '20', '600', '2', '2020-10-20', '0', '1', '0', '0', 'dsadsadasd', '2020-10-06', '', 'www.baidu.com', '');
INSERT INTO `business` VALUES ('3', '11', '达州友好食品有限公司', 'dsadsaddsa', '20', '600', '2', '2020-10-20', '0', '1', '0', '0', 'dsadsadasd', '2020-10-06', '', 'www.baidu.com', '');
INSERT INTO `business` VALUES ('4', '11', '达州友好食品有限公司', 'dsadsaddsa', '20', '600', '2', '2020-10-20', '0', '0', '0', '0', 'dsadsadasd', '2020-10-06', '', 'www.baidu.com', '');
INSERT INTO `business` VALUES ('5', '11', '达州友好食品有限公司', 'dsadsaddsa', '20', '600', '2', '2020-10-20', '0', '0', '0', '0', 'dsadsadasd', '2020-10-06', '', 'www.baidu.com', '');
INSERT INTO `business` VALUES ('6', '11', '达州友好食品有限公司', 'dsadsaddsa', '20', '600', '2', '2020-10-20', '0', '0', '0', '0', 'dsadsadasd', '2020-10-06', '', 'www.baidu.com', '');
INSERT INTO `business` VALUES ('7', '11', '达州友好食品有限公司', 'dsadsaddsa', '20', '600', '2', '2020-10-20', '0', '0', '0', '0', 'dsadsadasd', '2020-10-06', '', 'www.baidu.com', '');
INSERT INTO `business` VALUES ('8', '11', '达州友好食品有限公司', 'dsadsaddsa', '20', '600', '2', '2020-10-20', '0', '0', '0', '0', 'dsadsadasd', '2020-10-06', '', 'www.baidu.com', '');
INSERT INTO `business` VALUES ('9', '11', '达州友好食品有限公司', 'dsadsaddsa', '20', '600', '2', '2020-10-20', '0', '0', '0', '0', 'dsadsadasd', '2020-10-06', '', 'www.baidu.com', '');
INSERT INTO `business` VALUES ('10', '11', '达州友好食品有限公司', 'dsadsaddsa', '20', '600', '2', '2020-10-20', '0', '0', '0', '0', 'dsadsadasd', '2020-10-06', '', 'www.baidu.com', '');
INSERT INTO `business` VALUES ('11', '11', '达州友好食品有限公司', 'dsadsaddsa', '20', '600', '2', '2020-10-20', '0', '0', '0', '0', 'dsadsadasd', '2020-10-06', '', 'www.baidu.com', '');
INSERT INTO `business` VALUES ('12', '14', '达州第二食品公司', '32132', '15', '6000', '1', null, '0', '1', '0', '0', '32323', null, '', '达州市通川区友好食品厂', '');

-- ----------------------------
-- Table structure for bussiness_shop
-- ----------------------------
DROP TABLE IF EXISTS `bussiness_shop`;
CREATE TABLE `bussiness_shop` (
  `bussiness_shop_id` int NOT NULL AUTO_INCREMENT COMMENT '商铺商户关联ID',
  `bussiness_id` int DEFAULT NULL COMMENT '关联商户ID',
  `shop_id` int DEFAULT NULL COMMENT '关联商户ID',
  `relationship_status` int DEFAULT NULL COMMENT '0表示正在租，1表示租约已解除',
  PRIMARY KEY (`bussiness_shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bussiness_shop
-- ----------------------------
INSERT INTO `bussiness_shop` VALUES ('7', '12', '2', '1');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
  `bussiness_id` int NOT NULL COMMENT '商户ID',
  `user_id` int NOT NULL COMMENT '关联用户ID',
  `feedback_level` int NOT NULL COMMENT '反馈级别 从-2到2依次递增',
  `feedback_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '反馈原因 可为空',
  `feedback_time` date NOT NULL COMMENT '反馈时间 不可为空',
  `remarks` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for investment
-- ----------------------------
DROP TABLE IF EXISTS `investment`;
CREATE TABLE `investment` (
  `investment_id` int NOT NULL AUTO_INCREMENT COMMENT '招商服务ID 主键 不为空 自增',
  `user_id` int NOT NULL COMMENT '发布人ID 关联景区管理员',
  `shop_id` int NOT NULL COMMENT '关联商铺ID',
  `investment_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '招商服务名称',
  `investment_intro` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '招商服务介绍',
  `investment_date` date DEFAULT NULL COMMENT '招商服务发布时间',
  `investment_status` int DEFAULT NULL COMMENT '招商服务状态 0 已发布 1 已结束',
  `remarks` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `investment_img` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '招商服务图片地址',
  `investment_end` date DEFAULT NULL COMMENT '招商服务结束时间',
  PRIMARY KEY (`investment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of investment
-- ----------------------------
INSERT INTO `investment` VALUES ('2', '1', '1', '招租申请', '这是一条招租申请，这是一条招租申请', '2020-11-18', '0', '这是一条招租申请', '/web/images/investment/6e4064614d5c460db8ab5e72848c27fb.jpg', null);
INSERT INTO `investment` VALUES ('3', '1', '2', '招租申请', '这是一条招租申请，这是一条招租申请', '2020-11-17', '1', '这是一条招租申请', '/web/images/investment/c8963e0e635e41c89ba67c70dcf9a13a.jpg', null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `bussiness_id` int NOT NULL COMMENT '被留言商户ID',
  `user_id` int NOT NULL COMMENT '留言用户ID',
  `reply_id` int DEFAULT NULL COMMENT '回复留言ID 可为空',
  `message` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '留言信息内容',
  `message_date` date NOT NULL COMMENT '留言时间',
  `remarks` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `local` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `access_token_validity` int DEFAULT NULL,
  `refresh_token_validity` int DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('OrderManagement', null, '$2a$10$8yVwRGY6zB8wv5o0kRgD0ep/HVcvtSZUZsYu/586Egxc1hv3cI9Q6', 'all', 'authorization_code,refresh_token', 'http://localhost:8083/orderSystem/login', null, '7200', null, null, 'true');
INSERT INTO `oauth_client_details` VALUES ('UserManagement', null, '$2a$10$ZRmPFVgE6o2aoaK6hv49pOt5BZIKBDLywCaFkuAs6zYmRkpKHgyuO', 'all', 'authorization_code,refresh_token', 'http://localhost:8082/memberSystem/login', null, '7200', null, null, 'true');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT COMMENT '商铺主键 ID 自增',
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商铺名称',
  `shop_intro` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商铺简介',
  `shop_longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商铺经度',
  `shop_latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商铺纬度',
  `shop_people` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商铺容纳最大人数',
  `shop_money` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商铺租金 统一按年计',
  `shop_spots` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商铺周围景点个数',
  `traffic_status` int NOT NULL COMMENT '交通状况 从差到好依次从 -1 0 1 2',
  `safe_status` int NOT NULL COMMENT '商铺安全状况 从差到好依次从-1 0 1 2',
  `shop_distance` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '到景区门口距离',
  `pedestrian_volume` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '平均人流量 按天计算',
  `shop_remarks` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `shop_floor` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商铺面积',
  `shop_status` int NOT NULL COMMENT '0下架 1上架未出租 2为上架已出租',
  `shop_img` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商铺图片地址',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '望江商厦一楼', '学校的操场真大，大得可以容得下2000多名，不，是3000多名学生；学校操场真干净啊，干净得地板都在发亮；学校的操场真神奇呀，热闹时像炸开了锅似的，安静的时候却一点点声音也没有。我每天早上从操场走过，一天都精神十足。', '123.23', '23.22', '32', '32', '32', '0', '0', '32', '321', '3213', '32', '1', '/web/images/shop/17463ea77af441a49c0330c63902c1c7.jpg');
INSERT INTO `shop` VALUES ('2', '美好国度三楼', '', '213', '123', '32', '23', '23', '-1', '0', '223', '23', '23', '23', '1', '/web/images/shop/88ebcddc18504f0c9ffc7a53aa810d2b.jpg');

-- ----------------------------
-- Table structure for spots
-- ----------------------------
DROP TABLE IF EXISTS `spots`;
CREATE TABLE `spots` (
  `spots_id` int NOT NULL AUTO_INCREMENT COMMENT '景点ID 主键递增',
  `spots_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '景点名称',
  `spots_intro` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '景点介绍',
  `spots_hot` int NOT NULL COMMENT '景点热度 从-1到2依次上升',
  `spots_longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '景点经度',
  `spots_latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '景点纬度',
  `spots_money` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '景点票价',
  `remarks` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`spots_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of spots
-- ----------------------------

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT '0' COMMENT '父ID',
  `type` tinyint NOT NULL COMMENT '资源类型（1：菜单，2：按钮，3：操作）',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '资源名称',
  `code` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '资源标识（或者叫权限字符串）',
  `uri` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '资源URI',
  `seq` int DEFAULT '1' COMMENT '序号',
  `create_user` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', '3', 'normal', '01', '/index', '1', 'system', '2019-03-03 18:50:17', 'system', '2019-03-03 18:50:20');
INSERT INTO `sys_permission` VALUES ('2', '0', '3', 'medium', '02', '/consumer-center/meduim', '1', 'system', '2019-03-03 18:50:17', 'system', '2019-03-03 18:50:20');
INSERT INTO `sys_permission` VALUES ('3', '0', '3', 'top', '03', '/consumer-center/top', '1', 'system', '2019-03-03 18:50:17', 'system', '2019-03-03 18:50:20');
INSERT INTO `sys_permission` VALUES ('4', '0', '3', 'normal', '04', '/provider-02/normal', '1', 'system', '2019-03-03 18:50:17', 'system', '2019-03-03 18:50:20');
INSERT INTO `sys_permission` VALUES ('5', '0', '3', 'medium', '05', '/provider-02/medium', '1', 'system', '2019-03-03 18:50:17', 'system', '2019-03-03 18:50:20');
INSERT INTO `sys_permission` VALUES ('6', '0', '3', 'top', '06', '/provider-02/top', '1', 'system', '2019-03-03 18:50:17', 'system', '2019-03-03 18:50:20');
INSERT INTO `sys_permission` VALUES ('7', '0', '3', '商户认证', '07', '/business/attestation', '1', 'system', '2020-10-29 22:02:19', 'system', '2020-10-29 22:02:27');
INSERT INTO `sys_permission` VALUES ('8', '0', '3', '商户管理商家', '08', '/business/business', '1', 'system', '2020-10-30 19:57:50', 'system', '2020-10-30 19:57:57');
INSERT INTO `sys_permission` VALUES ('9', '0', '3', '商户管理管理员', '09', '/business/manager', '1', 'system', '2020-10-30 19:58:46', 'system', '2020-10-30 19:58:52');
INSERT INTO `sys_permission` VALUES ('10', '0', '3', '商铺管理商家', '10', '/shop/business', '1', 'system', '2020-10-30 20:00:02', 'system', '2020-10-30 20:00:09');
INSERT INTO `sys_permission` VALUES ('11', '0', '3', '商铺管理管理员', '11', '/shop/manager', '1', 'system', '2020-10-30 20:00:41', 'system', '2020-10-30 20:00:49');
INSERT INTO `sys_permission` VALUES ('12', '0', '3', '获取所有类型', '12', '/business/type/alltypes', '1', 'system', '2020-10-31 15:07:04', 'system', '2020-10-31 15:07:10');
INSERT INTO `sys_permission` VALUES ('13', '0', '3', '显示用户信息，显示退出登录', '13', '/logout', '1', 'system', '2020-11-01 16:29:42', 'system', '2020-11-01 16:29:50');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `role_code` varchar(32) NOT NULL,
  `role_description` varchar(64) DEFAULT NULL COMMENT '角色描述',
  `create_user` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '游客', 'visitor', '普通游客', 'system', '2019-02-12 11:14:41', null, null);
INSERT INTO `sys_role` VALUES ('2', '商家', 'bussiness', '普通商家', 'system', '2019-02-12 11:15:37', null, null);
INSERT INTO `sys_role` VALUES ('3', '客服', 'kefu', '客服', 'system', '2019-02-12 11:16:27', null, null);
INSERT INTO `sys_role` VALUES ('4', '景区管理员', 'manager', '景区管理员', 'system', '2020-10-29 15:39:47', null, null);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL COMMENT '角色ID',
  `permission_id` int NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1', '1');
INSERT INTO `sys_role_permission` VALUES ('2', '1', '2');
INSERT INTO `sys_role_permission` VALUES ('3', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('4', '1', '5');
INSERT INTO `sys_role_permission` VALUES ('5', '3', '1');
INSERT INTO `sys_role_permission` VALUES ('6', '2', '1');
INSERT INTO `sys_role_permission` VALUES ('7', '2', '2');
INSERT INTO `sys_role_permission` VALUES ('8', '2', '4');
INSERT INTO `sys_role_permission` VALUES ('9', '2', '5');
INSERT INTO `sys_role_permission` VALUES ('10', '2', '7');
INSERT INTO `sys_role_permission` VALUES ('11', '2', '8');
INSERT INTO `sys_role_permission` VALUES ('12', '2', '10');
INSERT INTO `sys_role_permission` VALUES ('13', '4', '9');
INSERT INTO `sys_role_permission` VALUES ('14', '4', '11');
INSERT INTO `sys_role_permission` VALUES ('15', '2', '12');
INSERT INTO `sys_role_permission` VALUES ('16', '1', '13');
INSERT INTO `sys_role_permission` VALUES ('17', '2', '13');
INSERT INTO `sys_role_permission` VALUES ('19', '4', '13');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL COMMENT '账号',
  `password` varchar(256) NOT NULL COMMENT '密码',
  `nickname` varchar(64) NOT NULL COMMENT '昵称',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态（0：锁定，1：解锁）',
  `create_user` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `sex` int DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin66', '管理员', 'abc@123.com', '1', 'system', '2019-02-12 11:12:19', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('2', 'zhangsan', '123456', '张三', 'zhangsan@126.com', '1', 'system', '2019-02-12 11:13:27', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('11', 'admin6', 'admin6', 'admin6', '18875105026@163.com', '1', 'system', '2020-10-22 03:05:27', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('12', 'admin7', 'admin7', 'Mike', '18875105026@163.com', '1', 'system', '2020-10-24 08:22:13', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('13', 'admin8', 'admin8', 'admin8', '18875105026@163.com', '1', 'system', '2020-10-28 13:34:41', null, null, '1', '18875105026', null);
INSERT INTO `sys_user` VALUES ('14', 'Mike66', 'wjw12345', 'Mike', '18875105026@163.com', '1', 'system', '2020-11-08 02:58:04', null, null, '1', '18875105026', '西安市雁塔区西安电子科技大学北校区');
INSERT INTO `sys_user` VALUES ('15', 'admin88', '$2a$10$5c.vhd6cphPkJ62Rx0wyH.JBIt809EaU./BWxXT1wqjEnepoKqM3m', 'admin88', '18875105026@163.com', '1', 'system', '2020-11-16 14:57:53', null, null, '1', '18875105026', '西安市雁塔区西安电子科技大学北校区');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '4');
INSERT INTO `sys_user_role` VALUES ('2', '2', '1');
INSERT INTO `sys_user_role` VALUES ('5', '11', '2');
INSERT INTO `sys_user_role` VALUES ('6', '12', '1');
INSERT INTO `sys_user_role` VALUES ('7', '13', '1');
INSERT INTO `sys_user_role` VALUES ('9', '14', '2');
INSERT INTO `sys_user_role` VALUES ('10', '15', '2');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` int NOT NULL AUTO_INCREMENT COMMENT '商户类型ID 主键自增',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商户类型名称',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `industry` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '所属行业',
  `scope` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '经营范围',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '饭店', null, '餐饮服务', '普通民众');
INSERT INTO `type` VALUES ('2', '小吃', null, '餐饮服务', '普通民众');
INSERT INTO `type` VALUES ('3', '小卖部', null, '餐饮服务', '普通民众');
INSERT INTO `type` VALUES ('4', '饮料店', null, '餐饮服务', '普通民众');
INSERT INTO `type` VALUES ('5', '旅馆', null, '住宿服务', '普通民众');
INSERT INTO `type` VALUES ('6', '宾馆', null, '住宿服务', '普通民众');
INSERT INTO `type` VALUES ('7', '五星级酒店', null, '住宿服务', '贵宾');
INSERT INTO `type` VALUES ('8', '照相馆', null, '旅游服务', '普通民众');
INSERT INTO `type` VALUES ('9', '导游处', null, '旅游服务', '普通民众');
INSERT INTO `type` VALUES ('10', '纪念品商店', null, '旅游服务', '普通民众');
INSERT INTO `type` VALUES ('11', '衣物商店', null, '旅游服务', '普通民众');
