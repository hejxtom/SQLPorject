/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.18-log : Database - librarymanagements
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`librarymanagements` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `librarymanagements`;

/*Table structure for table `backupsuser` */

DROP TABLE IF EXISTS `backupsuser`;

CREATE TABLE `backupsuser` (
  `uid` char(10) NOT NULL COMMENT '读者id',
  `uname` varchar(50) DEFAULT NULL COMMENT '读者名字',
  `usex` char(5) DEFAULT NULL COMMENT '读者性别',
  `ubirth` date DEFAULT NULL COMMENT '读者生日',
  `uphone` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `mid` char(10) DEFAULT NULL COMMENT '权限id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `backupsuser` */

insert  into `backupsuser`(`uid`,`uname`,`usex`,`ubirth`,`uphone`,`mid`) values ('00001','王静','女','1999-09-11','13774102089','00001'),('00002','刘东阳','女','1999-10-09','17671729179','00002'),('00003','钱忠理','男','1998-10-09','15341629146','00003'),('00004','马晓夏','女','1995-05-12','15341629146','00004'),('00005','孙海洋','男','1995-04-03','15341629146','00001'),('00006','郭小斌','男','1997-11-10','17671729179','00002'),('00007','张玲珑','女','1997-12-24','15341629146','00003'),('00008','罗璇','女','2000-03-21','15341629146','00001'),('00009','张三','男','2000-00-00','15341629146','00001'),('00010','赵小龙','男','1999-02-15','17671729179','00002'),('00011','赵小飞','女','1999-03-15','15341629146','00003'),('00012','刘晨','男','1998-02-15','15341629146','00004'),('00013','李永','男','2000-03-18','15341629146','00001'),('00014','秦风','男','1995-02-15','17671729179','00002'),('00015','李小永','女','1999-03-15','15341629146','00003'),('00016','刘小晨','女','1989-02-15','15341629146','00004'),('00017','赵六','男','2000-03-25','15341629146','00004');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bid` varchar(50) NOT NULL COMMENT '书号',
  `bname` varchar(255) DEFAULT NULL COMMENT '书名',
  `bauthor` varchar(50) DEFAULT NULL COMMENT '作者',
  `bpress` varchar(255) DEFAULT NULL COMMENT '出版社',
  `bpubdate` date DEFAULT NULL COMMENT '出版日期',
  `moeny` decimal(6,2) DEFAULT NULL COMMENT '售价',
  `bcount` int(10) DEFAULT NULL COMMENT '数目',
  `sid` char(5) NOT NULL COMMENT '类别id',
  PRIMARY KEY (`bid`),
  KEY `sid` (`sid`),
  KEY `bookName` (`bname`),
  CONSTRAINT `sid` FOREIGN KEY (`sid`) REFERENCES `series` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`bid`,`bname`,`bauthor`,`bpress`,`bpubdate`,`moeny`,`bcount`,`sid`) values ('9787010040127','实践理性批判','[德] 伊曼努尔·康德','人民出版社','2004-05-01','18.00',18,'00003'),('9787111530114','这世界唯一的你:自闭症人士独特行为背后的真相','[美]巴瑞·普瑞桑','机械工业出版社','2016-03-01','151.00',151,'00001'),('9787117031868','麦克明彩色人体解剖图谱','PHAbrahams','人民卫生出版社','1999-01-01','39.00',39,'00001'),('9787117096911','口腔颌面外科学','邱蔚六主','人民卫生出版社','2008-01-01','12.00',12,'00001'),('9787302508885','自适应学习','李韧','清华大学出版社','2019-01-01','39.50',20,'00002'),('9787303067336','LSD：我那惹是生非的孩子','阿尔伯特.霍夫曼','北京师范大学出版社','0000-00-00','664.00',30,'00001'),('9787304063771','拆出你的沟通力II','赵周','中央广播电视大学出版社','2014-05-01','32.00',32,'00004'),('9787309027778','新闻学概论','李良荣','复旦大学出版社','2005-11-01','32.00',32,'00002'),('9787500579359','投资收益百年史','Elroy Dimso','中国财政经济出版社','2005-06-01','30.00',30,'00005'),('9787508633749','随机漫步的傻瓜','[美] 纳西尼古拉斯·塔勒布','中信出版社','2012-07-01','39.00',30,'00005'),('9787508645865','无处可藏','[美] 爱德华•哈洛韦尔','中信出版社','2014-07-01','42.00',42,'00003'),('9787508649528','简化','Cass Sunstein','中信出版社','2015-01-01','45.00',45,'00003'),('9787508692586','投资21戒','[美]本·斯坦','中信出版社','2019-06-01','35.00',10,'00005'),('9787513259156','饮食术','[日]牧田善二','中国中医药出版社','0000-00-00','164.00',30,'00001'),('9787513594202','谁统治美国？：公司富豪的胜利',' [美] G. 威廉•多姆霍夫','外语教学与研究出版社','2017-09-01','48.00',32,'00003'),('9787514344363','实践理性批判','[德] 伊曼努尔·康德','人民出版社','2004-05-01','18.00',18,'00004'),('9787518053001','头等大事：脱发青年自救指南','徐峰','人民出版社','2012-06-30','45.00',43,'00001'),('9787519305871','内在勇气','林萃芬','群言出版社','2020-02-01','46.80',30,'00004'),('9787521703726','为什么不平等至关重要',' [美]托马斯·斯坎伦','中信出版集','2019-07-01','48.00',10,'00003'),('9787537733106','医学衷中参西录','张锡纯','山西科技出版社','2009-01-01','98.00',48,'00001'),('9787544048446','分心的孩子这样教','[美] 爱德华•哈洛韦尔','山西教育出版社','2011-06-01','32.00',32,'00002'),('9787544708173','我不想活得这么累','(日)岸见一郎','现代出版社','2017-03-01','42.00',32,'00004'),('9787545402377','股市投资致富之道','（美）菲利普·A.费雪','广东经济出版社','2009-07-01','32.00',32,'00005'),('9787553739762','儿科医生说：当我的孩子生病时','陈英','江苏凤凰科学技术出版社','2015-08-01','91.00',20,'00001'),('9787560963952','心理三术','牧之','华中科技','2010-09-01','35.00',10,'00004'),('9787563346134','走近中医','唐云','广西师范大学出版社','2004-05-01','151.00',48,'00001'),('9787564045838','一看就懂的财务报表全图解','张珈豪','北京理工大学出版社','2011-06-01','28.00',28,'00005'),('9787565715150','游戏心理学','陈京炜','中国传媒大学出版社','2015-12-01','45.00',45,'00002'),('9787570203451','从小读到大','尹建莉','长江文艺出版社','2018-04-01','49.80',49,'00002'),('9787800898341','汪石山医学全书','高尔鑫','中国中医药出版社','1999-08-01','48.00',48,'00001'),('9787802318533','身在中医','李灿东','中国纺织出版社','2018-09-01','28.00',28,'00001'),('9887887182036','当代中文','吴中伟','华语教学出版社','2007-01-01','200.00',10,'00005');

/*Table structure for table `lend` */

DROP TABLE IF EXISTS `lend`;

CREATE TABLE `lend` (
  `bid` varchar(50) NOT NULL COMMENT '书号',
  `uid` char(10) NOT NULL COMMENT '读者id',
  `ldate` date DEFAULT NULL COMMENT '借出日期',
  `rdate` date DEFAULT NULL COMMENT '归还日期',
  `charge` decimal(10,2) DEFAULT NULL COMMENT '收费',
  PRIMARY KEY (`bid`,`uid`),
  KEY `uid` (`uid`),
  CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lend` */

insert  into `lend`(`bid`,`uid`,`ldate`,`rdate`,`charge`) values ('9787010040127','00001','2019-00-00','2019-01-00','0.18'),('9787010040127','00015','2020-12-18','0000-00-00','0.00'),('9787010040127','00016','2020-12-18','0000-00-00','0.00'),('9787111530114','00002','2019-00-00','2019-01-00','3.02'),('9787117031868','00003','2019-00-00','2019-01-00','1.77'),('9787117096911','00004','2019-00-00','2019-01-00','4.16'),('9787302508885','00005','2019-00-00','2019-01-00','0.12'),('9787303067336','00006','2019-00-00','2019-01-00','3.22'),('9787304063771','00007','2019-00-00','2019-01-00','0.72'),('9787309027778','00008','2019-00-00','2019-01-00','1.16'),('9787500579359','00009','2019-00-00','2019-01-00','0.39'),('9787508633749','00010','2019-00-00','2019-01-00','0.64'),('9787508645865','00011','2019-00-00','2019-01-00','0.96'),('9787508649528','00012','2019-00-00','2019-01-00','1.20'),('9787518053001','00017','2020-12-18','2020-12-18','0.00'),('9787544708173','00013','2019-00-00','2019-01-00','0.39'),('9787545402377','00014','2019-00-00','2019-01-00','0.84'),('9787563346134','00015','2019-00-00','2019-01-00','4.50'),('9787564045838','00016','2019-00-00','2019-01-00','3.50');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `mid` char(10) NOT NULL COMMENT '权限id',
  `mname` varchar(50) DEFAULT NULL COMMENT '权限名',
  `ldiscount` decimal(10,2) DEFAULT NULL COMMENT '借书优惠',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`mid`,`mname`,`ldiscount`) values ('00001','钻石会员','0.01'),('00002','黄金会员','0.02'),('00003','白银会员','0.03'),('00004','青铜会员','0.04'),('00005','普通会员','0.10');

/*Table structure for table `series` */

DROP TABLE IF EXISTS `series`;

CREATE TABLE `series` (
  `sid` char(5) NOT NULL COMMENT '类别id',
  `sname` varchar(100) DEFAULT NULL COMMENT '类别名',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `series` */

insert  into `series`(`sid`,`sname`) values ('00001','医药类'),('00002','教育教学类'),('00003','政治图书类'),('00004','家居休闲类'),('00005','经济管理类');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` char(10) NOT NULL COMMENT '读者id',
  `uname` varchar(50) DEFAULT NULL COMMENT '读者名字',
  `usex` char(5) DEFAULT NULL COMMENT '读者性别',
  `ubirth` date DEFAULT NULL COMMENT '读者生日',
  `uphone` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `mid` char(10) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`uid`),
  KEY `mid` (`mid`),
  KEY `readerName` (`uname`),
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`uname`,`usex`,`ubirth`,`uphone`,`mid`) values ('00001','王静','女','1999-09-11','13774102089','00001'),('00002','刘东阳','女','1999-10-09','17671729179','00002'),('00003','钱忠理','男','1998-10-09','15341629146','00003'),('00004','马晓夏','女','1995-05-12','15341629146','00004'),('00005','孙海洋','男','1995-04-03','15341629146','00001'),('00006','郭小斌','男','1997-11-10','17671729179','00002'),('00007','张玲珑','女','1997-12-24','15341629146','00003'),('00008','罗璇','女','2000-03-21','15341629146','00001'),('00009','张三','男','2000-00-00','15341629146','00001'),('00010','赵小龙','男','1999-02-15','17671729179','00002'),('00011','赵小飞','女','1999-03-15','15341629146','00003'),('00012','刘晨','男','1998-02-15','15341629146','00004'),('00013','李永','男','2000-03-18','15341629146','00001'),('00014','秦风','男','1995-02-15','17671729179','00002'),('00015','李小永','女','1999-03-15','15341629146','00003'),('00016','刘小晨','女','1989-02-15','15341629146','00004'),('00017','赵六','男','2000-03-25','15341629146','00004');

/* Trigger structure for table `user` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `backup_Book` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `backup_Book` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN 
UPDATE backupsUser SET uname=new.uname,usex=new.usex,ubirth=new.ubirth,uphone=new.uphone,mid=new.mid WHERE uid=new.uid;
END */$$


DELIMITER ;

/* Procedure structure for procedure `backupsReders` */

/*!50003 DROP PROCEDURE IF EXISTS  `backupsReders` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `backupsReders`()
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE course_id CHAR(10);
DECLARE course_name VARCHAR(50); 
DECLARE course_sex  CHAR(5);
DECLARE course_birth  DATE;
DECLARE course_phone  VARCHAR(20);
DECLARE course_pid  CHAR(10);
DECLARE mc CURSOR FOR SELECT * FROM user;  #定义游标
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; 
    OPEN mc;
    out_loop:
    LOOP  -- 循环，将表的内容都转移到backupsReder中
        FETCH mc INTO course_id, course_name, course_sex,course_birth,course_phone,course_pid;
        IF done =1 THEN
	   LEAVE out_loop;
	END IF;
	IF (SELECT COUNT(*) FROM backupsUser WHERE uid=course_id)<=0 THEN
	   INSERT INTO backupsUser VALUES(course_id, course_name, course_sex,course_birth,course_phone,course_pid);
	END IF;
        SET done = 0;  
    END LOOP out_loop;
    CLOSE mc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `BorrwBook` */

/*!50003 DROP PROCEDURE IF EXISTS  `BorrwBook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `BorrwBook`(
cbid VARCHAR(50),
puid CHAR(10)
)
BEGIN
DECLARE discount DECIMAL(10,2); 
DECLARE meony DECIMAL(10,2); 
DECLARE ld INT; 
SELECT moeny  INTO meony FROM book WHERE bid=cbid;
SELECT ldiscount INTO discount FROM member WHERE mname=(SELECT 会员名 FROM userinfo WHERE 读者号=puid);
SELECT MONTH(NOW())-MONTH(ldate) INTO ld FROM lend WHERE bid=cbid AND uid=puid;
SELECT ld;
UPDATE lend SET rdate=NOW(),charge=discount*meony*ld WHERE bid=cbid AND uid=puid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteeBook` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteeBook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteeBook`(
id VARCHAR(50)
)
BEGIN
DELETE FROM book WHERE bid=id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertBook` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertBook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertBook`(
bid VARCHAR(50),
bname VARCHAR(255),
bauthor VARCHAR(50),
bpress VARCHAR(255),
bpubdate DATE,
moeny DECIMAL(6,2),
bcount INT(10),
caname VARCHAR(100)
)
BEGIN
DECLARE caid CHAR(5) DEFAULT '00006'; 
SELECT sid INTO caid FROM series WHERE sname=caname;
INSERT INTO book VALUES(bid,bname,bauthor,bpress,bpubdate,moeny,bcount,caid);
END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUser`(
uid CHAR(10),
uname VARCHAR(50),
usex CHAR(5),
ubirth DATE,
uphone VARCHAR(20),
rpname VARCHAR(50)
)
BEGIN
DECLARE rpid CHAR(10) DEFAULT '00006'; 
SELECT mid INTO rpid FROM member WHERE mname=rpname;
INSERT INTO user VALUES(uid,uname,usex,ubirth,uphone,rpid);
END */$$
DELIMITER ;

/* Procedure structure for procedure `LendBook` */

/*!50003 DROP PROCEDURE IF EXISTS  `LendBook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `LendBook`(
_bid VARCHAR(50),
_uid CHAR(10)
)
BEGIN
IF (SELECT bcount FROM book WHERE bid=_bid)>0 THEN
     IF (SELECT YEAR(rdate) FROM lend WHERE bid=_bid AND uid=_uid)>0 THEN
         DELETE FROM lend WHERE bid=_bid AND uid=_uid;
     ELSE
     SELECT '只允许借一本，请归还书本';
     END IF;
    INSERT INTO lend VALUES(_bid,_uid,NOW(),0,0);
    UPDATE book SET bcount=bcount-1 WHERE bid=_bid;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `UpdateBook` */

/*!50003 DROP PROCEDURE IF EXISTS  `UpdateBook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBook`(
id VARCHAR(50),
NAME VARCHAR(255),
author VARCHAR(50),
press VARCHAR(255),
pubdate DATE,
meony DECIMAL(6,2),
bacount INT(10),
caname VARCHAR(100)
)
BEGIN
DECLARE caid CHAR(5) DEFAULT '00006'; 
SELECT sid INTO caid FROM series WHERE sname=caname;
UPDATE book SET bname=NAME,bauthor=author,bpress=press,bpubdate=pubdate,moeny=meony,bcount=bacount,sid=caid WHERE bid=id;
END */$$
DELIMITER ;

/*Table structure for table `bestsellproducts` */

DROP TABLE IF EXISTS `bestsellproducts`;

/*!50001 DROP VIEW IF EXISTS `bestsellproducts` */;
/*!50001 DROP TABLE IF EXISTS `bestsellproducts` */;

/*!50001 CREATE TABLE  `bestsellproducts`(
 `书号` varchar(50) ,
 `书名` varchar(255) ,
 `作者` varchar(50) ,
 `出版社` varchar(255) ,
 `出版日期` date ,
 `售价` decimal(6,2) ,
 `数目` int(10) ,
 `丛书名` varchar(100) 
)*/;

/*Table structure for table `bookinfo` */

DROP TABLE IF EXISTS `bookinfo`;

/*!50001 DROP VIEW IF EXISTS `bookinfo` */;
/*!50001 DROP TABLE IF EXISTS `bookinfo` */;

/*!50001 CREATE TABLE  `bookinfo`(
 `书号` varchar(50) ,
 `书名` varchar(255) ,
 `作者` varchar(50) ,
 `出版社` varchar(255) ,
 `出版日期` date ,
 `售价` decimal(6,2) ,
 `数目` int(10) ,
 `丛书名` varchar(100) 
)*/;

/*Table structure for table `borrowreceipt` */

DROP TABLE IF EXISTS `borrowreceipt`;

/*!50001 DROP VIEW IF EXISTS `borrowreceipt` */;
/*!50001 DROP TABLE IF EXISTS `borrowreceipt` */;

/*!50001 CREATE TABLE  `borrowreceipt`(
 `姓名` varchar(50) ,
 `会员名` varchar(50) ,
 `书名` varchar(255) ,
 `丛书名` varchar(100) ,
 `借出日期` date 
)*/;

/*Table structure for table `countbooks` */

DROP TABLE IF EXISTS `countbooks`;

/*!50001 DROP VIEW IF EXISTS `countbooks` */;
/*!50001 DROP TABLE IF EXISTS `countbooks` */;

/*!50001 CREATE TABLE  `countbooks`(
 `丛书名` varchar(100) ,
 `书本数目` decimal(32,0) 
)*/;

/*Table structure for table `countcategory` */

DROP TABLE IF EXISTS `countcategory`;

/*!50001 DROP VIEW IF EXISTS `countcategory` */;
/*!50001 DROP TABLE IF EXISTS `countcategory` */;

/*!50001 CREATE TABLE  `countcategory`(
 `丛书名` varchar(100) ,
 `图书类别` bigint(21) 
)*/;

/*Table structure for table `countpower` */

DROP TABLE IF EXISTS `countpower`;

/*!50001 DROP VIEW IF EXISTS `countpower` */;
/*!50001 DROP TABLE IF EXISTS `countpower` */;

/*!50001 CREATE TABLE  `countpower`(
 `会员名称` varchar(50) ,
 `人数` bigint(21) 
)*/;

/*Table structure for table `lendinfo` */

DROP TABLE IF EXISTS `lendinfo`;

/*!50001 DROP VIEW IF EXISTS `lendinfo` */;
/*!50001 DROP TABLE IF EXISTS `lendinfo` */;

/*!50001 CREATE TABLE  `lendinfo`(
 `书号` varchar(50) ,
 `书名` varchar(255) ,
 `作者` varchar(50) ,
 `出版社` varchar(255) ,
 `出版日期` date ,
 `售价` decimal(6,2) ,
 `丛书名` varchar(100) ,
 `读者名字` varchar(50) ,
 `读者性别` char(5) ,
 `读者生日` date ,
 `联系方式` varchar(20) ,
 `会员名` varchar(50) ,
 `借书优惠` decimal(10,2) ,
 `收费` decimal(10,2) ,
 `借出日期` date ,
 `归还日期` date 
)*/;

/*Table structure for table `lendscname` */

DROP TABLE IF EXISTS `lendscname`;

/*!50001 DROP VIEW IF EXISTS `lendscname` */;
/*!50001 DROP TABLE IF EXISTS `lendscname` */;

/*!50001 CREATE TABLE  `lendscname`(
 `丛书号id` char(5) ,
 `丛书名` varchar(100) ,
 `数目` bigint(21) 
)*/;

/*Table structure for table `returnreceipt` */

DROP TABLE IF EXISTS `returnreceipt`;

/*!50001 DROP VIEW IF EXISTS `returnreceipt` */;
/*!50001 DROP TABLE IF EXISTS `returnreceipt` */;

/*!50001 CREATE TABLE  `returnreceipt`(
 `姓名` varchar(50) ,
 `会员名` varchar(50) ,
 `书名` varchar(255) ,
 `丛书名` varchar(100) ,
 `借出日期` date ,
 `归还日期` date ,
 `借书优惠` decimal(10,2) ,
 `收费` decimal(10,2) 
)*/;

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

/*!50001 DROP VIEW IF EXISTS `userinfo` */;
/*!50001 DROP TABLE IF EXISTS `userinfo` */;

/*!50001 CREATE TABLE  `userinfo`(
 `读者号` char(10) ,
 `读者名字` varchar(50) ,
 `读者性别` char(5) ,
 `读者生日` date ,
 `联系方式` varchar(20) ,
 `会员名` varchar(50) 
)*/;

/*View structure for view bestsellproducts */

/*!50001 DROP TABLE IF EXISTS `bestsellproducts` */;
/*!50001 DROP VIEW IF EXISTS `bestsellproducts` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bestsellproducts` AS select `bi`.`书号` AS `书号`,`bi`.`书名` AS `书名`,`bi`.`作者` AS `作者`,`bi`.`出版社` AS `出版社`,`bi`.`出版日期` AS `出版日期`,`bi`.`售价` AS `售价`,`bi`.`数目` AS `数目`,`bi`.`丛书名` AS `丛书名` from `bookinfo` `bi` where `bi`.`丛书名` in (select `lendscname`.`丛书名` from `lendscname` where (`lendscname`.`数目` = (select max(`lendscname`.`数目`) from `lendscname`))) */;

/*View structure for view bookinfo */

/*!50001 DROP TABLE IF EXISTS `bookinfo` */;
/*!50001 DROP VIEW IF EXISTS `bookinfo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bookinfo` AS select `b`.`bid` AS `书号`,`b`.`bname` AS `书名`,`b`.`bauthor` AS `作者`,`b`.`bpress` AS `出版社`,`b`.`bpubdate` AS `出版日期`,`b`.`moeny` AS `售价`,`b`.`bcount` AS `数目`,`c`.`sname` AS `丛书名` from (`book` `b` join `series` `c`) where (`b`.`sid` = `c`.`sid`) group by `c`.`sid`,`b`.`bid` */;

/*View structure for view borrowreceipt */

/*!50001 DROP TABLE IF EXISTS `borrowreceipt` */;
/*!50001 DROP VIEW IF EXISTS `borrowreceipt` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `borrowreceipt` AS select `r`.`uname` AS `姓名`,`p`.`mname` AS `会员名`,`b`.`bname` AS `书名`,`c`.`sname` AS `丛书名`,`l`.`ldate` AS `借出日期` from ((((`lend` `l` join `book` `b`) join `series` `c`) join `user` `r`) join `member` `p`) where ((`l`.`bid` = `b`.`bid`) and (`l`.`uid` = `r`.`uid`) and (`b`.`sid` = `c`.`sid`) and (`r`.`mid` = `p`.`mid`) and ((2020 - year(`l`.`rdate`)) > 0)) group by `r`.`uid`,`b`.`bid` */;

/*View structure for view countbooks */

/*!50001 DROP TABLE IF EXISTS `countbooks` */;
/*!50001 DROP VIEW IF EXISTS `countbooks` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `countbooks` AS select `c`.`sname` AS `丛书名`,sum(`b`.`bcount`) AS `书本数目` from (`book` `b` join `series` `c`) where (`b`.`sid` = `c`.`sid`) group by `c`.`sid` order by sum(`b`.`bcount`) */;

/*View structure for view countcategory */

/*!50001 DROP TABLE IF EXISTS `countcategory` */;
/*!50001 DROP VIEW IF EXISTS `countcategory` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `countcategory` AS select `c`.`sname` AS `丛书名`,count(`b`.`bid`) AS `图书类别` from (`book` `b` join `series` `c`) where (`b`.`sid` = `c`.`sid`) group by `c`.`sid` */;

/*View structure for view countpower */

/*!50001 DROP TABLE IF EXISTS `countpower` */;
/*!50001 DROP VIEW IF EXISTS `countpower` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `countpower` AS select `p`.`mname` AS `会员名称`,count(`r`.`uid`) AS `人数` from (`user` `r` join `member` `p`) where (`r`.`mid` = `p`.`mid`) group by `p`.`mid` */;

/*View structure for view lendinfo */

/*!50001 DROP TABLE IF EXISTS `lendinfo` */;
/*!50001 DROP VIEW IF EXISTS `lendinfo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lendinfo` AS select `b`.`bid` AS `书号`,`b`.`bname` AS `书名`,`b`.`bauthor` AS `作者`,`b`.`bpress` AS `出版社`,`b`.`bpubdate` AS `出版日期`,`b`.`moeny` AS `售价`,`c`.`sname` AS `丛书名`,`r`.`uname` AS `读者名字`,`r`.`usex` AS `读者性别`,`r`.`ubirth` AS `读者生日`,`r`.`uphone` AS `联系方式`,`p`.`mname` AS `会员名`,`p`.`ldiscount` AS `借书优惠`,`l`.`charge` AS `收费`,`l`.`ldate` AS `借出日期`,`l`.`rdate` AS `归还日期` from ((((`book` `b` join `lend` `l`) join `user` `r`) join `member` `p`) join `series` `c`) where ((`b`.`bid` = `l`.`bid`) and (`r`.`uid` = `l`.`uid`) and (`r`.`mid` = `p`.`mid`) and (`b`.`sid` = `c`.`sid`)) order by `b`.`moeny` desc */;

/*View structure for view lendscname */

/*!50001 DROP TABLE IF EXISTS `lendscname` */;
/*!50001 DROP VIEW IF EXISTS `lendscname` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lendscname` AS select `c`.`sid` AS `丛书号id`,`c`.`sname` AS `丛书名`,count(0) AS `数目` from ((`series` `c` join `book` `b`) join `lend` `l`) where ((`c`.`sid` = `b`.`sid`) and (`b`.`bid` = `l`.`bid`)) group by `b`.`sid` */;

/*View structure for view returnreceipt */

/*!50001 DROP TABLE IF EXISTS `returnreceipt` */;
/*!50001 DROP VIEW IF EXISTS `returnreceipt` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `returnreceipt` AS select `r`.`uname` AS `姓名`,`p`.`mname` AS `会员名`,`b`.`bname` AS `书名`,`c`.`sname` AS `丛书名`,`l`.`ldate` AS `借出日期`,`l`.`rdate` AS `归还日期`,`p`.`ldiscount` AS `借书优惠`,`l`.`charge` AS `收费` from ((((`lend` `l` join `book` `b`) join `series` `c`) join `user` `r`) join `member` `p`) where ((`l`.`bid` = `b`.`bid`) and (`l`.`uid` = `r`.`uid`) and (`b`.`sid` = `c`.`sid`) and (`r`.`mid` = `p`.`mid`) and ((2020 - year(`l`.`rdate`)) > 0)) group by `r`.`uid`,`b`.`bid` */;

/*View structure for view userinfo */

/*!50001 DROP TABLE IF EXISTS `userinfo` */;
/*!50001 DROP VIEW IF EXISTS `userinfo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userinfo` AS select `r`.`uid` AS `读者号`,`r`.`uname` AS `读者名字`,`r`.`usex` AS `读者性别`,`r`.`ubirth` AS `读者生日`,`r`.`uphone` AS `联系方式`,`p`.`mname` AS `会员名` from (`user` `r` join `member` `p`) where (`r`.`mid` = `p`.`mid`) group by `p`.`mid`,`r`.`uid` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
