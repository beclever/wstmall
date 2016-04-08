DROP TABLE IF EXISTS `wst_order_settlements`;
CREATE TABLE `wst_order_settlements` (
  `settlementId` int(11) NOT NULL AUTO_INCREMENT,
  `settlementNo` varchar(12) DEFAULT NULL,
  `settlementType` tinyint(4) NOT NULL DEFAULT '0',
  `shopId` int(11) NOT NULL,
  `accName` varchar(50) DEFAULT NULL,
  `accNo` varchar(30) NOT NULL,
  `accUser` varchar(100) NOT NULL,
  `orderMoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `settlementMoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `poundageMoney` decimal(10,2) NOT NULL DEFAULT '0.00',
  `createTime` datetime NOT NULL,
  `isFinish` tinyint(4) NOT NULL DEFAULT '0',
  `finishTime` datetime DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`settlementId`),
  KEY `shopId` (`shopId`),
  KEY `isFinish` (`isFinish`),
  KEY `settlementNo` (`settlementNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `wst_user_score`;
CREATE TABLE `wst_user_score` (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0',
  `score` int(11) NOT NULL DEFAULT '0',
  `dataSrc` int(11) NOT NULL DEFAULT '0',
  `dataId` int(11) NOT NULL DEFAULT '0',
  `dataRemarks` text,
  `scoreType` int(11) NOT NULL DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`scoreId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `wst_log_sys_moneys`;
CREATE TABLE `wst_log_sys_moneys` (
  `moneyId` int(11) NOT NULL AUTO_INCREMENT,
  `targetType` tinyint(4) NOT NULL DEFAULT '0',
  `targetId` int(11) NOT NULL DEFAULT '0',
  `dataSrc` int(11) NOT NULL DEFAULT '0',
  `dataId` int(11) NOT NULL DEFAULT '0',
  `moneyRemark` text,
  `moneyType` tinyint(4) NOT NULL DEFAULT '0',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00',
  `createTime` datetime DEFAULT NULL,
  `dataFlag` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`moneyId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


alter table wst_orders add settlementId int default 0;
INSERT INTO `wst_sys_configs`(parentId,fieldName,fieldCode,fieldType,valueRangeTxt,valueRange,fieldValue,fieldTips,fieldSort) VALUES ('3', '����������', 'settlementStartMoney', 'text', null, null, '0','�����������ڸý����ܽ��н��㣩', '7');



alter table wst_shops add bankUserName varchar(100) NOT NULL;
alter table wst_orders add realTotalMoney decimal(11,2) NOT NULL DEFAULT 0;
alter table wst_orders add poundageRate float(11,2) NOT NULL DEFAULT 0;
alter table wst_orders add poundageMoney decimal(11,2) NOT NULL DEFAULT 0;
alter table wst_orders add useScore int NOT NULL DEFAULT 0;
alter table wst_orders add scoreMoney decimal(11,2) NOT NULL DEFAULT 0;
alter table wst_orders add receiveTime datetime;
alter table wst_orders add deliveryTime datetime;

update wst_orders set realTotalMoney = totalMoney;

update wst_users set userScore = 0;
update wst_users set userTotalScore = 0;

INSERT INTO `wst_sys_configs`(parentId,fieldName,fieldCode,fieldType,valueRangeTxt,valueRange,fieldValue,fieldSort) VALUES ('3', '��������֧��', 'isOpenScorePay', 'radio','��||��','1,0',1,1);
INSERT INTO `wst_sys_configs`(parentId,fieldName,fieldCode,fieldType,valueRangeTxt,valueRange,fieldValue,fieldSort) VALUES ('3', '�����µ������', 'isOrderScore', 'radio','��||��','1,0',1,2);
INSERT INTO `wst_sys_configs`(parentId,fieldName,fieldCode,fieldType,valueRangeTxt,valueRange,fieldValue,fieldSort) VALUES ('3', '�������ۻ����', 'isAppraisesScore', 'radio','��||��','1,0',1,3);
INSERT INTO `wst_sys_configs`(parentId,fieldName,fieldCode,fieldType,valueRangeTxt,valueRange,fieldValue,fieldTips,fieldSort) VALUES ('3', '�������Ǯ�һ�����', 'scoreCashRatio', 'text','','','100:1','�磺100:1����100�����ֿɶһ���1',4);
INSERT INTO `wst_sys_configs`(parentId,fieldName,fieldCode,fieldType,valueRangeTxt,valueRange,fieldValue,fieldTips,fieldSort) VALUES ('3', '���ۻ�ȡ������', 'appraisesScore', 'text','','','5','',5);
INSERT INTO `wst_sys_configs`(parentId,fieldName,fieldCode,fieldType,valueRangeTxt,valueRange,fieldValue,fieldTips,fieldSort) VALUES ('3', '�Զ��ջ�����', 'autoReceiveDays', 'text','','','10','��',8);
INSERT INTO `wst_sys_configs`(parentId,fieldName,fieldCode,fieldType,valueRangeTxt,valueRange,fieldValue,fieldTips,fieldSort) VALUES ('3', '�Զ���������', 'autoAppraiseDays', 'text','','','7','��',9);
INSERT INTO `wst_sys_configs`(parentId,fieldName,fieldCode,fieldType,valueRangeTxt,valueRange,fieldValue,fieldTips,fieldSort) VALUES ('3', '����Ӷ�����', 'poundageRate', 'text','','','1','%',6);






