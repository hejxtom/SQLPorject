/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.18-log : Database - opticalvalleybookstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`opticalvalleybookstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `opticalvalleybookstore`;

/*Table structure for table `backupsreder` */

DROP TABLE IF EXISTS `backupsreder`;

CREATE TABLE `backupsreder` (
  `uid` char(10) NOT NULL COMMENT '读者id',
  `uname` varchar(50) DEFAULT NULL COMMENT '读者名字',
  `usex` char(5) DEFAULT NULL COMMENT '读者性别',
  `ubirth` date DEFAULT NULL COMMENT '读者生日',
  `uphone` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `pid` char(10) DEFAULT NULL COMMENT '权限id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `backupsreder` */

insert  into `backupsreder`(`uid`,`uname`,`usex`,`ubirth`,`uphone`,`pid`) values ('00001','张青平','女','1999-09-11','13774102089','00001'),('00002','刘东阳','女','1999-10-09','17671729179','00002'),('00003','钱忠理','男','1998-10-09','15341629146','00003'),('00004','马晓夏','女','1995-05-12','15341629146','00004'),('00005','孙海洋','男','1995-04-03','15341629146','00001'),('00006','郭小斌','男','1997-11-10','17671729179','00002'),('00007','张玲珑','女','1997-12-24','15341629146','00003'),('00008','何嘉星','男','1997-12-24','15341629146','00004'),('00009','张三','男','2000-00-00','15341629146','00001'),('00010','赵小龙','男','1999-02-15','17671729179','00002'),('00011','赵小飞','女','1999-03-15','15341629146','00003'),('00012','刘晨','男','1998-02-15','15341629146','00004'),('00013','李永','男','2000-03-18','15341629146','00001'),('00014','秦风','男','1995-02-15','17671729179','00002'),('00015','李小永','女','1999-03-15','15341629146','00005'),('00016','刘小晨','女','1989-02-15','15341629146','00005'),('00017','赵小六','男','2000-03-25','15341629146','00001'),('00018','王晓静','女','2000-03-25','15341629146','00001');

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
  `cid` char(5) NOT NULL COMMENT '类别id',
  PRIMARY KEY (`bid`),
  KEY `cid` (`cid`),
  KEY `bookName` (`bname`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`bid`,`bname`,`bauthor`,`bpress`,`bpubdate`,`moeny`,`bcount`,`cid`) values ('9787010040127','实践理性批判','[德] 伊曼努尔·康德','人民出版社','2004-05-01','20.00',18,'00003'),('9787111530114','这世界唯一的你:自闭症人士独特行为背后的真相','[美]巴瑞·普瑞桑','机械工业出版社','2016-03-01','151.00',151,'00001'),('9787115410986','无人机DIY',' [美] 约翰·贝克托','人民邮电出版社','2016-05-01','59.00',28,'00006'),('9787117095204','儿科学','沈晓明','人民卫生出版社','2011-10-30','104.00',104,'00001'),('9787117096911','口腔颌面外科学','邱蔚六主','人民卫生出版社','2008-01-01','12.00',12,'00001'),('9787117145954','世界手法医学与传统疗法','韦贵康','人民卫生出版社','2011-11-01','161.00',161,'00001'),('9787118029468','结构疲劳寿命分析','姚卫星','国防工业出版社','1900-01-01','24.00',20,'00006'),('9787122237088','我是大能手：水暖工','郭超','化学工业出版社','2016-05-01','29.80',12,'00006'),('9787302508885','自适应学习','李韧','清华大学出版社','2019-01-01','39.50',20,'00002'),('9787304063771','拆出你的沟通力II','赵周','中央广播电视大学出版社','2014-05-01','32.00',32,'00004'),('9787309027778','新闻学概论','李良荣','复旦大学出版社','2005-11-01','32.00',32,'00002'),('9787500579359','投资收益百年史','Elroy Dimso','中国财政经济出版社','2005-06-01','30.00',30,'00005'),('9787508633749','随机漫步的傻瓜','[美] 纳西姆·尼古拉斯·塔勒布','中信出版社','2012-07-01','39.00',30,'00005'),('9787508645865','无处可藏','[美] 爱德华•哈洛韦尔','中信出版社','2014-07-01','42.00',42,'00003'),('9787508649528','简化','Cass Sunstein','中信出版社','2015-01-01','45.00',45,'00003'),('9787508692586','投资21戒','[美]本·斯坦','中信出版社','2019-06-01','35.00',10,'00005'),('9787508694399','石油的时代','王能全','中信出版集团','2018-11-01','198.00',30,'00006'),('9787513594202','谁统治美国？：公司富豪的胜利',' [美] G. 威廉•多姆霍夫','外语教学与研究出版社','2017-09-01','48.00',32,'00003'),('9787514344363','实践理性批判','[德] 伊曼努尔·康德','人民出版社','2004-05-01','18.00',18,'00004'),('9787519305871','内在勇气','林萃芬','群言出版社','2020-02-01','46.80',30,'00004'),('9787521703726','为什么不平等至关重要',' [美]托马斯·斯坎伦','中信出版集团','2019-07-01','48.00',10,'00003'),('9787530477496','DK汽车大百科','英国DK出版社','北京科学技术出版社','2015-12-01','198.00',30,'00006'),('9787537733106','医学衷中参西录','张锡纯','山西科技出版社','2009-01-01','98.00',48,'00001'),('9787544048446','分心的孩子这样教','[美] 爱德华•哈洛韦尔','山西教育出版社','2011-06-01','32.00',32,'00002'),('9787544708173','我不想活得这么累','(日)岸见一郎','现代出版社','2017-03-01','42.00',32,'00004'),('9787544782579','医事法','[英国]查尔斯·福斯特','译林出版社','2020-08-30','28.00',28,'00001'),('9787545402377','股市投资致富之道','（美）菲利普·A.费雪','广东经济出版社','2009-07-01','32.00',32,'00005'),('9787553739762','儿科医生说：当我的孩子生病时','陈英','江苏凤凰科学技术出版社','2015-08-01','91.00',20,'00001'),('9787557675271','神经外科的黑色喜剧','[美]法兰克·佛杜锡克','湖南科学技术出版社','2013-11-01','210.00',20,'00001'),('9787560089553','如何组织课堂会话活动','比尔伯勒','外语教学与研究出版社','2009-09-01','33.00',33,'00007'),('9787560091846','循序渐进法语听写','李洪峰','外语教学与研究出版社','2009-12-01','27.50',30,'00007'),('9787560963952','心理三术','牧之','华中科技','2010-09-01','35.00',10,'00004'),('9787563346134','走近中医','唐云','广西师范大学出版社','2004-05-01','151.00',48,'00001'),('9787563811854','外贸英语函电','许楠','首都经济贸易大学出版社','2005-02-01','32.00',20,'00007'),('9787564045838','一看就懂的财务报表全图解','张珈豪','北京理工大学出版社','2011-06-01','28.00',28,'00005'),('9787565715150','游戏心理学','陈京炜','中国传媒大学出版社','2015-12-01','45.00',45,'00002'),('9787567547612','被解释的美','金雯','华东师范大学出版社','2018-10-01','48.00',12,'00007'),('9787570203451','从小读到大','尹建莉','长江文艺出版社','2018-04-01','49.80',49,'00002'),('9787800898341','汪石山医学全书','高尔鑫','中国中医药出版社','1999-08-01','48.00',48,'00001'),('9787801096418','风格的要素',' [美] 威廉·斯特伦克','中央编译出版社','2009-01-01','20.00',29,'00007'),('9789866052231','解刨列车','ThomasW.Myers','译林出版社','2012-06-30','45.00',44,'00001');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` char(5) NOT NULL COMMENT '类别id',
  `cname` varchar(100) DEFAULT NULL COMMENT '类别名',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cid`,`cname`) values ('00001','医药类'),('00002','教育教学类'),('00003','政治图书类'),('00004','家居休闲类'),('00005','经济管理类'),('00006','工业技术类'),('00007','外语教育类');

/*Table structure for table `lend` */

DROP TABLE IF EXISTS `lend`;

CREATE TABLE `lend` (
  `bid` varchar(50) NOT NULL COMMENT '书号',
  `uid` char(10) NOT NULL COMMENT '读者id',
  `ldate` date DEFAULT NULL COMMENT '借出日期',
  `rdate` date DEFAULT NULL COMMENT '归还日期',
  `charge` decimal(10,3) DEFAULT NULL COMMENT '收费',
  PRIMARY KEY (`bid`,`uid`),
  KEY `uid` (`uid`),
  CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `readers` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lend` */

insert  into `lend`(`bid`,`uid`,`ldate`,`rdate`,`charge`) values ('9787010040127','00001','2019-00-00','2019-03-00','5.400'),('9787111530114','00001','2019-00-00','2019-01-00','6.400'),('9787115410986','00003','2019-00-00','2019-01-00','6.500'),('9787117095204','00004','2019-00-00','2019-03-00','6.700'),('9787117096911','00005','2019-00-00','2019-03-00','5.400'),('9787117145954','00006','2019-00-00','2019-03-00','9.700'),('9787118029468','00007','2019-00-00','2019-03-00','2.400'),('9787122237088','00008','2019-00-00','2019-03-00','3.200'),('9787302508885','00009','2019-00-00','2019-03-00','1.700'),('9787304063771','00010','2019-00-00','2019-03-00','3.800'),('9787309027778','00011','2019-00-00','2019-03-00','2.800'),('9787500579359','00012','2019-00-00','2019-03-00','3.600'),('9787508633749','00013','2019-00-00','2019-03-00','1.700'),('9787508645865','00014','2019-00-00','2019-03-00','4.700'),('9787508649528','00015','2020-12-00','2021-01-01','0.000'),('9787508692586','00016','2020-12-00','2021-01-01','0.000'),('9787801096418','00013','2020-12-18','0000-00-00','0.000'),('9787801096418','00014','2020-12-17','0000-00-00','0.000'),('9787801096418','00015','2020-12-17','2020-12-18','0.000'),('9789866052231','00001','2020-12-20','0000-00-00','0.000'),('9789866052231','00017','2020-12-18','2020-12-20','0.000'),('9789866052231','00018','2020-12-20','0000-00-00','0.000');

/*Table structure for table `power` */

DROP TABLE IF EXISTS `power`;

CREATE TABLE `power` (
  `pid` char(10) NOT NULL COMMENT '权限id',
  `pname` varchar(50) DEFAULT NULL COMMENT '权限名',
  `sdiscount` decimal(10,2) DEFAULT NULL,
  `ldiscount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `power` */

insert  into `power`(`pid`,`pname`,`sdiscount`,`ldiscount`) values ('00001','一卡通A证','0.50','0.01'),('00002','一卡通B证','0.60','0.02'),('00003','一卡通C证','0.70','0.03'),('00004','一卡通D证','0.80','0.04'),('00005','普通','0.90','0.10');

/*Table structure for table `readers` */

DROP TABLE IF EXISTS `readers`;

CREATE TABLE `readers` (
  `uid` char(10) NOT NULL COMMENT '读者id',
  `uname` varchar(50) DEFAULT NULL COMMENT '读者名字',
  `usex` char(5) DEFAULT NULL COMMENT '读者性别',
  `ubirth` date DEFAULT NULL COMMENT '读者生日',
  `uphone` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `pid` char(10) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`uid`),
  KEY `pid` (`pid`),
  KEY `readerName` (`uname`),
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `power` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `readers` */

insert  into `readers`(`uid`,`uname`,`usex`,`ubirth`,`uphone`,`pid`) values ('00001','张青平','女','1999-09-11','13774102089','00001'),('00002','刘东阳','女','1999-10-09','17671729179','00002'),('00003','钱忠理','男','1998-10-09','15341629146','00003'),('00004','马晓夏','女','1995-05-12','15341629146','00004'),('00005','孙海洋','男','1995-04-03','15341629146','00001'),('00006','郭小斌','男','1997-11-10','17671729179','00002'),('00007','张玲珑','女','1997-12-24','15341629146','00003'),('00008','何嘉星','男','1997-12-24','15341629146','00004'),('00009','张三','男','2000-00-00','15341629146','00001'),('00010','赵小龙','男','1999-02-15','17671729179','00002'),('00011','赵小飞','女','1999-03-15','15341629146','00003'),('00012','刘晨','男','1998-02-15','15341629146','00004'),('00013','李永','男','2000-03-18','15341629146','00001'),('00014','秦风','男','1995-02-15','17671729179','00002'),('00015','李小永','女','1999-03-15','15341629146','00005'),('00016','刘小晨','女','1989-02-15','15341629146','00005'),('00017','赵小六','男','2000-03-25','15341629146','00001'),('00018','王晓静','女','2000-03-25','15341629146','00001');

/*Table structure for table `sell` */

DROP TABLE IF EXISTS `sell`;

CREATE TABLE `sell` (
  `bid` varchar(50) NOT NULL COMMENT '书号',
  `uid` char(10) NOT NULL COMMENT '读者id',
  `sdate` date DEFAULT NULL COMMENT '出售日期',
  `scount` int(10) DEFAULT NULL COMMENT '售出数量',
  `charge` decimal(10,3) DEFAULT NULL COMMENT '收费',
  PRIMARY KEY (`bid`,`uid`),
  KEY `suid` (`uid`),
  CONSTRAINT `sbid` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`),
  CONSTRAINT `suid` FOREIGN KEY (`uid`) REFERENCES `readers` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sell` */

insert  into `sell`(`bid`,`uid`,`sdate`,`scount`,`charge`) values ('9787508694399','00001','2019-01-30',2,'99.000'),('9787513594202','00001','2019-12-30',3,'28.800'),('9787514344363','00003','2019-01-30',4,'12.600'),('9787519305871','00004','2019-01-30',5,'37.440'),('9787521703726','00005','2019-01-30',6,'24.000'),('9787530477496','00006','2019-01-30',7,'118.800'),('9787537733106','00007','2019-01-30',8,'68.600'),('9787544048446','00008','2019-01-30',9,'25.600'),('9787544708173','00009','2019-01-30',10,'21.000'),('9787544782579','00010','2019-01-30',11,'16.800'),('9787545402377','00011','2019-01-30',12,'22.400'),('9787553739762','00012','2019-01-30',13,'72.800'),('9787557675271','00013','2019-01-30',14,'105.000'),('9787560089553','00014','2019-01-30',15,'19.800'),('9787560091846','00015','2019-01-30',16,'24.300'),('9787560963952','00016','2019-01-30',17,'31.500');

/* Trigger structure for table `readers` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `backup_Book` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `backup_Book` BEFORE UPDATE ON `readers` FOR EACH ROW BEGIN 
UPDATE backupsreder SET uname=new.uname,usex=new.usex,ubirth=new.ubirth,uphone=new.uphone,pid=new.pid WHERE uid=new.uid;
END */$$


DELIMITER ;

/* Procedure structure for procedure `backupsReders` */

/*!50003 DROP PROCEDURE IF EXISTS  `backupsReders` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `backupsReders`()
begin
DECLARE done INT DEFAULT 0;
declare course_id char(10);
declare course_name varchar(50); 
declare course_sex  char(5);
DECLARE course_birth  date;
DECLARE course_phone  varchar(20);
DECLARE course_pid  char(10);
declare mc cursor for select * from readers;  #定义游标
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; 
    open mc;
    out_loop:
    loop  -- 循环，将表的内容都转移到backupsReder中
        fetch mc into course_id, course_name, course_sex,course_birth,course_phone,course_pid;
        IF done =1 THEN
	   LEAVE out_loop;
	END IF;
	IF (SELECT COUNT(*) FROM backupsReder WHERE uid=course_id)<=0 THEN
	   INSERT INTO backupsReder VALUES(course_id, course_name, course_sex,course_birth,course_phone,course_pid);
	END IF;
        SET done = 0;  
    end loop out_loop;
    close mc;
end */$$
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
SELECT ldiscount INTO discount FROM POWER WHERE pname=(SELECT 会员名 FROM rederinfo WHERE 读者号=puid);
SELECT MONTH(NOW())-MONTH(ldate) INTO ld FROM lend WHERE bid=cbid AND uid=puid;
SELECT ld;
UPDATE lend SET rdate=NOW(),charge=discount*meony*ld WHERE bid=cbid AND uid=puid;
UPDATE book SET bcount=bcount+1 WHERE bid=cbid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteeBook` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteeBook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteeBook`(
id VARCHAR(50)
)
BEGIN
delete from book where bid=id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertBook` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertBook` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertBook`(
bid varchar(50),
bname varchar(255),
bauthor varchar(50),
bpress varchar(255),
bpubdate date,
moeny decimal(6,2),
bcount int(10),
caname varchar(100)
)
BEGIN
declare caid char(5) default '00006'; 
select cid into caid from category where cname=caname;
insert into book values(bid,bname,bauthor,bpress,bpubdate,moeny,bcount,caid);
END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertUser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUser`(
uid char(10),
uname varchar(50),
usex char(5),
ubirth date,
uphone varchar(20),
rpname varchar(50)
)
BEGIN
DECLARE rpid char(10) DEFAULT '00006'; 
SELECT pid INTO rpid FROM power WHERE pname=rpname;
INSERT INTO readers VALUES(uid,uname,usex,ubirth,uphone,rpid);
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
    IF (SELECT COUNT(*) FROM lend WHERE bid=_bid AND uid=_uid)>0  THEN
     IF (SELECT YEAR(rdate) FROM lend WHERE bid=_bid AND uid=_uid)>0 THEN
         DELETE FROM lend WHERE bid=_bid AND uid=_uid;
     ELSE
     SELECT '只允许借一本，请归还书本';
     END IF;
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
name VARCHAR(255),
author VARCHAR(50),
press VARCHAR(255),
pubdate DATE,
meony DECIMAL(6,2),
bacount INT(10),
caname VARCHAR(100)
)
BEGIN
DECLARE caid CHAR(5) DEFAULT '00006'; 
SELECT cid INTO caid FROM category WHERE cname=caname;
update book set bname=NAME,bauthor=author,bpress=press,bpubdate=pubdate,moeny=meony,bcount=bacount,cid=caid where bid=id;
END */$$
DELIMITER ;

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

/*Table structure for table `borrowticket` */

DROP TABLE IF EXISTS `borrowticket`;

/*!50001 DROP VIEW IF EXISTS `borrowticket` */;
/*!50001 DROP TABLE IF EXISTS `borrowticket` */;

/*!50001 CREATE TABLE  `borrowticket`(
 `姓名` varchar(50) ,
 `会员名` varchar(50) ,
 `书名` varchar(255) ,
 `丛书名` varchar(100) ,
 `数量` int(10) ,
 `优惠力度` decimal(10,2) ,
 `原价` decimal(6,2) ,
 `实收` decimal(10,3) ,
 `日期` date 
)*/;

/*Table structure for table `categorytojiaoyu` */

DROP TABLE IF EXISTS `categorytojiaoyu`;

/*!50001 DROP VIEW IF EXISTS `categorytojiaoyu` */;
/*!50001 DROP TABLE IF EXISTS `categorytojiaoyu` */;

/*!50001 CREATE TABLE  `categorytojiaoyu`(
 `bid` varchar(50) ,
 `bname` varchar(255) ,
 `bauthor` varchar(50) ,
 `bpress` varchar(255) ,
 `bpubdate` date ,
 `moeny` decimal(6,2) ,
 `bcount` int(10) ,
 `cid` char(5) ,
 `cname` varchar(100) 
)*/;

/*Table structure for table `categorytoyiyao` */

DROP TABLE IF EXISTS `categorytoyiyao`;

/*!50001 DROP VIEW IF EXISTS `categorytoyiyao` */;
/*!50001 DROP TABLE IF EXISTS `categorytoyiyao` */;

/*!50001 CREATE TABLE  `categorytoyiyao`(
 `bid` varchar(50) ,
 `bname` varchar(255) ,
 `bauthor` varchar(50) ,
 `bpress` varchar(255) ,
 `bpubdate` date ,
 `moeny` decimal(6,2) ,
 `bcount` int(10) ,
 `cid` char(5) ,
 `cname` varchar(100) 
)*/;

/*Table structure for table `categorytozhengzhi` */

DROP TABLE IF EXISTS `categorytozhengzhi`;

/*!50001 DROP VIEW IF EXISTS `categorytozhengzhi` */;
/*!50001 DROP TABLE IF EXISTS `categorytozhengzhi` */;

/*!50001 CREATE TABLE  `categorytozhengzhi`(
 `bid` varchar(50) ,
 `bname` varchar(255) ,
 `bauthor` varchar(50) ,
 `bpress` varchar(255) ,
 `bpubdate` date ,
 `moeny` decimal(6,2) ,
 `bcount` int(10) ,
 `cid` char(5) ,
 `cname` varchar(100) 
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
 `图书类别` varchar(100) ,
 `图书本数` bigint(21) 
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
 `收费` decimal(10,3) ,
 `借出日期` date ,
 `归还日期` date 
)*/;

/*Table structure for table `recombooks` */

DROP TABLE IF EXISTS `recombooks`;

/*!50001 DROP VIEW IF EXISTS `recombooks` */;
/*!50001 DROP TABLE IF EXISTS `recombooks` */;

/*!50001 CREATE TABLE  `recombooks`(
 `书号` varchar(50) ,
 `书名` varchar(255) ,
 `作者` varchar(50) ,
 `出版社` varchar(255) ,
 `出版日期` date ,
 `售价` decimal(6,2) ,
 `丛书名` varchar(100) 
)*/;

/*Table structure for table `rederinfo` */

DROP TABLE IF EXISTS `rederinfo`;

/*!50001 DROP VIEW IF EXISTS `rederinfo` */;
/*!50001 DROP TABLE IF EXISTS `rederinfo` */;

/*!50001 CREATE TABLE  `rederinfo`(
 `读者号` char(10) ,
 `读者名字` varchar(50) ,
 `读者性别` char(5) ,
 `读者生日` date ,
 `联系方式` varchar(20) ,
 `会员名` varchar(50) 
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
 `收费` decimal(10,3) 
)*/;

/*Table structure for table `sellerbook` */

DROP TABLE IF EXISTS `sellerbook`;

/*!50001 DROP VIEW IF EXISTS `sellerbook` */;
/*!50001 DROP TABLE IF EXISTS `sellerbook` */;

/*!50001 CREATE TABLE  `sellerbook`(
 `书号` varchar(50) ,
 `书名` varchar(255) ,
 `作者` varchar(50) ,
 `出版社` varchar(255) ,
 `出版日期` date ,
 `售价` decimal(6,2) ,
 `丛书名` varchar(100) ,
 `售出` int(10) 
)*/;

/*Table structure for table `sellercname` */

DROP TABLE IF EXISTS `sellercname`;

/*!50001 DROP VIEW IF EXISTS `sellercname` */;
/*!50001 DROP TABLE IF EXISTS `sellercname` */;

/*!50001 CREATE TABLE  `sellercname`(
 `丛书号id` char(5) ,
 `丛书名` varchar(100) ,
 `数目` decimal(32,0) 
)*/;

/*Table structure for table `sellinfo` */

DROP TABLE IF EXISTS `sellinfo`;

/*!50001 DROP VIEW IF EXISTS `sellinfo` */;
/*!50001 DROP TABLE IF EXISTS `sellinfo` */;

/*!50001 CREATE TABLE  `sellinfo`(
 `书号` varchar(50) ,
 `书名` varchar(255) ,
 `作者` varchar(50) ,
 `出版社` varchar(255) ,
 `出版日期` date ,
 `售价` decimal(6,2) ,
 `丛书号` char(5) ,
 `丛书名` varchar(100) ,
 `读者名字` varchar(50) ,
 `读者性别` char(5) ,
 `读者生日` date ,
 `联系方式` varchar(20) ,
 `会员名` varchar(50) ,
 `买书优惠` decimal(10,2) ,
 `收费` decimal(10,3) ,
 `出售数目` int(10) ,
 `出售日期` date 
)*/;

/*View structure for view bookinfo */

/*!50001 DROP TABLE IF EXISTS `bookinfo` */;
/*!50001 DROP VIEW IF EXISTS `bookinfo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bookinfo` AS select `b`.`bid` AS `书号`,`b`.`bname` AS `书名`,`b`.`bauthor` AS `作者`,`b`.`bpress` AS `出版社`,`b`.`bpubdate` AS `出版日期`,`b`.`moeny` AS `售价`,`b`.`bcount` AS `数目`,`c`.`cname` AS `丛书名` from (`book` `b` join `category` `c`) where (`b`.`cid` = `c`.`cid`) group by `c`.`cid`,`b`.`bid` */;

/*View structure for view borrowreceipt */

/*!50001 DROP TABLE IF EXISTS `borrowreceipt` */;
/*!50001 DROP VIEW IF EXISTS `borrowreceipt` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `borrowreceipt` AS select `r`.`uname` AS `姓名`,`p`.`pname` AS `会员名`,`b`.`bname` AS `书名`,`c`.`cname` AS `丛书名`,`l`.`ldate` AS `借出日期` from ((((`lend` `l` join `book` `b`) join `category` `c`) join `readers` `r`) join `power` `p`) where ((`l`.`bid` = `b`.`bid`) and (`l`.`uid` = `r`.`uid`) and (`b`.`cid` = `c`.`cid`) and (`r`.`pid` = `p`.`pid`) and ((2020 - year(`l`.`rdate`)) > 0)) group by `r`.`uid`,`b`.`bid` */;

/*View structure for view borrowticket */

/*!50001 DROP TABLE IF EXISTS `borrowticket` */;
/*!50001 DROP VIEW IF EXISTS `borrowticket` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `borrowticket` AS select `r`.`uname` AS `姓名`,`p`.`pname` AS `会员名`,`b`.`bname` AS `书名`,`c`.`cname` AS `丛书名`,`s`.`scount` AS `数量`,`p`.`sdiscount` AS `优惠力度`,`b`.`moeny` AS `原价`,`s`.`charge` AS `实收`,`s`.`sdate` AS `日期` from ((((`sell` `s` join `book` `b`) join `category` `c`) join `readers` `r`) join `power` `p`) where ((`s`.`bid` = `b`.`bid`) and (`s`.`uid` = `r`.`uid`) and (`b`.`cid` = `c`.`cid`) and (`r`.`pid` = `p`.`pid`)) group by `r`.`uid`,`b`.`bid` */;

/*View structure for view categorytojiaoyu */

/*!50001 DROP TABLE IF EXISTS `categorytojiaoyu` */;
/*!50001 DROP VIEW IF EXISTS `categorytojiaoyu` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `categorytojiaoyu` AS select `b`.`bid` AS `bid`,`b`.`bname` AS `bname`,`b`.`bauthor` AS `bauthor`,`b`.`bpress` AS `bpress`,`b`.`bpubdate` AS `bpubdate`,`b`.`moeny` AS `moeny`,`b`.`bcount` AS `bcount`,`b`.`cid` AS `cid`,`c`.`cname` AS `cname` from (`book` `b` join `category` `c`) where ((`b`.`cid` = `c`.`cid`) and (`c`.`cname` = '教育教学类')) */;

/*View structure for view categorytoyiyao */

/*!50001 DROP TABLE IF EXISTS `categorytoyiyao` */;
/*!50001 DROP VIEW IF EXISTS `categorytoyiyao` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `categorytoyiyao` AS select `b`.`bid` AS `bid`,`b`.`bname` AS `bname`,`b`.`bauthor` AS `bauthor`,`b`.`bpress` AS `bpress`,`b`.`bpubdate` AS `bpubdate`,`b`.`moeny` AS `moeny`,`b`.`bcount` AS `bcount`,`b`.`cid` AS `cid`,`c`.`cname` AS `cname` from (`book` `b` join `category` `c`) where ((`b`.`cid` = `c`.`cid`) and (`c`.`cname` = '医药类') and (`b`.`bcount` = (select max(`book`.`bcount`) from `book`))) */;

/*View structure for view categorytozhengzhi */

/*!50001 DROP TABLE IF EXISTS `categorytozhengzhi` */;
/*!50001 DROP VIEW IF EXISTS `categorytozhengzhi` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `categorytozhengzhi` AS select `b`.`bid` AS `bid`,`b`.`bname` AS `bname`,`b`.`bauthor` AS `bauthor`,`b`.`bpress` AS `bpress`,`b`.`bpubdate` AS `bpubdate`,`b`.`moeny` AS `moeny`,`b`.`bcount` AS `bcount`,`b`.`cid` AS `cid`,`c`.`cname` AS `cname` from (`book` `b` join `category` `c`) where ((`b`.`cid` = `c`.`cid`) and (`c`.`cname` = '政治图书类')) */;

/*View structure for view countbooks */

/*!50001 DROP TABLE IF EXISTS `countbooks` */;
/*!50001 DROP VIEW IF EXISTS `countbooks` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `countbooks` AS select `c`.`cname` AS `丛书名`,sum(`b`.`bcount`) AS `书本数目` from (`book` `b` join `category` `c`) where (`b`.`cid` = `c`.`cid`) group by `c`.`cid` order by sum(`b`.`bcount`) */;

/*View structure for view countcategory */

/*!50001 DROP TABLE IF EXISTS `countcategory` */;
/*!50001 DROP VIEW IF EXISTS `countcategory` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `countcategory` AS select `c`.`cname` AS `图书类别`,count(`b`.`bid`) AS `图书本数` from (`book` `b` join `category` `c`) where (`b`.`cid` = `c`.`cid`) group by `c`.`cid` */;

/*View structure for view countpower */

/*!50001 DROP TABLE IF EXISTS `countpower` */;
/*!50001 DROP VIEW IF EXISTS `countpower` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `countpower` AS select `p`.`pname` AS `会员名称`,count(`r`.`uid`) AS `人数` from (`readers` `r` join `power` `p`) where (`r`.`pid` = `p`.`pid`) group by `p`.`pid` */;

/*View structure for view lendinfo */

/*!50001 DROP TABLE IF EXISTS `lendinfo` */;
/*!50001 DROP VIEW IF EXISTS `lendinfo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lendinfo` AS select `b`.`bid` AS `书号`,`b`.`bname` AS `书名`,`b`.`bauthor` AS `作者`,`b`.`bpress` AS `出版社`,`b`.`bpubdate` AS `出版日期`,`b`.`moeny` AS `售价`,`c`.`cname` AS `丛书名`,`r`.`uname` AS `读者名字`,`r`.`usex` AS `读者性别`,`r`.`ubirth` AS `读者生日`,`r`.`uphone` AS `联系方式`,`p`.`pname` AS `会员名`,`p`.`ldiscount` AS `借书优惠`,`l`.`charge` AS `收费`,`l`.`ldate` AS `借出日期`,`l`.`rdate` AS `归还日期` from ((((`book` `b` join `lend` `l`) join `readers` `r`) join `power` `p`) join `category` `c`) where ((`b`.`bid` = `l`.`bid`) and (`r`.`uid` = `l`.`uid`) and (`r`.`pid` = `p`.`pid`) and (`b`.`cid` = `c`.`cid`)) order by `b`.`moeny` desc */;

/*View structure for view recombooks */

/*!50001 DROP TABLE IF EXISTS `recombooks` */;
/*!50001 DROP VIEW IF EXISTS `recombooks` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `recombooks` AS select `b`.`bid` AS `书号`,`b`.`bname` AS `书名`,`b`.`bauthor` AS `作者`,`b`.`bpress` AS `出版社`,`b`.`bpubdate` AS `出版日期`,`b`.`moeny` AS `售价`,`c`.`cname` AS `丛书名` from (`book` `b` join `category` `c`) where ((`b`.`cid` = `c`.`cid`) and `b`.`bid` in (select `s`.`书号` from `sellinfo` `s` where (`s`.`丛书号` in (select `sellercname`.`丛书号id` from `sellercname` where (`sellercname`.`数目` = (select max(`sellercname`.`数目`) from `sellercname`))) and (`s`.`出售数目` = (select max(`sellinfo`.`出售数目`) from `sellinfo` where (`sellinfo`.`丛书号` = `s`.`丛书号`)))))) */;

/*View structure for view rederinfo */

/*!50001 DROP TABLE IF EXISTS `rederinfo` */;
/*!50001 DROP VIEW IF EXISTS `rederinfo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rederinfo` AS select `r`.`uid` AS `读者号`,`r`.`uname` AS `读者名字`,`r`.`usex` AS `读者性别`,`r`.`ubirth` AS `读者生日`,`r`.`uphone` AS `联系方式`,`p`.`pname` AS `会员名` from (`readers` `r` join `power` `p`) where (`r`.`pid` = `p`.`pid`) group by `p`.`pid`,`r`.`uid` */;

/*View structure for view returnreceipt */

/*!50001 DROP TABLE IF EXISTS `returnreceipt` */;
/*!50001 DROP VIEW IF EXISTS `returnreceipt` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `returnreceipt` AS select `r`.`uname` AS `姓名`,`p`.`pname` AS `会员名`,`b`.`bname` AS `书名`,`c`.`cname` AS `丛书名`,`l`.`ldate` AS `借出日期`,`l`.`rdate` AS `归还日期`,`p`.`ldiscount` AS `借书优惠`,`l`.`charge` AS `收费` from ((((`lend` `l` join `book` `b`) join `category` `c`) join `readers` `r`) join `power` `p`) where ((`l`.`bid` = `b`.`bid`) and (`l`.`uid` = `r`.`uid`) and (`b`.`cid` = `c`.`cid`) and (`r`.`pid` = `p`.`pid`) and (year(`l`.`rdate`) > 0)) group by `r`.`uid`,`b`.`bid` */;

/*View structure for view sellerbook */

/*!50001 DROP TABLE IF EXISTS `sellerbook` */;
/*!50001 DROP VIEW IF EXISTS `sellerbook` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sellerbook` AS select `b`.`bid` AS `书号`,`b`.`bname` AS `书名`,`b`.`bauthor` AS `作者`,`b`.`bpress` AS `出版社`,`b`.`bpubdate` AS `出版日期`,`b`.`moeny` AS `售价`,`c`.`cname` AS `丛书名`,`s`.`scount` AS `售出` from ((`book` `b` join `sell` `s`) join `category` `c`) where ((`b`.`bid` = `s`.`bid`) and (`c`.`cid` = `b`.`cid`) and (`s`.`scount` = (select max(`sell`.`scount`) from `sell`))) */;

/*View structure for view sellercname */

/*!50001 DROP TABLE IF EXISTS `sellercname` */;
/*!50001 DROP VIEW IF EXISTS `sellercname` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sellercname` AS select `c`.`cid` AS `丛书号id`,`c`.`cname` AS `丛书名`,sum(`s`.`scount`) AS `数目` from ((`category` `c` join `book` `b`) join `sell` `s`) where ((`c`.`cid` = `b`.`cid`) and (`b`.`bid` = `s`.`bid`)) group by `b`.`cid` */;

/*View structure for view sellinfo */

/*!50001 DROP TABLE IF EXISTS `sellinfo` */;
/*!50001 DROP VIEW IF EXISTS `sellinfo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sellinfo` AS select `b`.`bid` AS `书号`,`b`.`bname` AS `书名`,`b`.`bauthor` AS `作者`,`b`.`bpress` AS `出版社`,`b`.`bpubdate` AS `出版日期`,`b`.`moeny` AS `售价`,`c`.`cid` AS `丛书号`,`c`.`cname` AS `丛书名`,`r`.`uname` AS `读者名字`,`r`.`usex` AS `读者性别`,`r`.`ubirth` AS `读者生日`,`r`.`uphone` AS `联系方式`,`p`.`pname` AS `会员名`,`p`.`sdiscount` AS `买书优惠`,`s`.`charge` AS `收费`,`s`.`scount` AS `出售数目`,`s`.`sdate` AS `出售日期` from ((((`sell` `s` join `book` `b`) join `category` `c`) join `readers` `r`) join `power` `p`) where ((`s`.`bid` = `b`.`bid`) and (`s`.`uid` = `r`.`uid`) and (`r`.`pid` = `p`.`pid`) and (`b`.`cid` = `c`.`cid`)) order by `s`.`charge` desc */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
