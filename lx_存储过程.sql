#*********存储过程
#DROP PROCEDURE IF EXISTS grandToreder;

#*****************图书录入

DROP PROCEDURE IF EXISTS InsertBook;

DELIMITER //
CREATE PROCEDURE InsertBook(
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
END;//


CALL InsertBook("9887887182036","当代中文","吴中伟","华语教学出版社",'2007-1-1',200,10,'经济管理类');
SELECT * FROM bookinfo WHERE 书名 LIKE '当代中文';


#*****************图书修改
DELIMITER //
CREATE PROCEDURE UpdateBook(
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
END;//

CALL UpdateBook("9787887182036","当代中文","吴中伟","华语教学出版社",'2007-1-1',200,10,'家居休闲类');


SELECT * FROM bookinfo WHERE 书名 LIKE '当代中文';

#*****************图书删除
DELIMITER //
CREATE PROCEDURE DeleteeBook(
id VARCHAR(50)
)
BEGIN
DELETE FROM book WHERE bid=id;
END;//
CALL DeleteeBook("9787887182036");

SELECT * FROM bookinfo WHERE 书名 LIKE '当代中文';

#*****************办理借书卡模块
DROP PROCEDURE InsertUser;

DELIMITER //
CREATE PROCEDURE InsertUser(
uid CHAR(10),
uname VARCHAR(50),
usex CHAR(5),
ubirth DATE,
uphone VARCHAR(20),
rpname VARCHAR(50)
)
BEGIN
DECLARE rpid CHAR(10) DEFAULT '00006'; 
SELECT MID INTO rpid FROM member WHERE mname=rpname;
INSERT INTO USER VALUES(uid,uname,usex,ubirth,uphone,rpid);
END;//


CALL InsertUser('00017','赵六','男','2000-03-25','15341629146','钻石会员');
SELECT * FROM userinfo WHERE 读者号 LIKE '00017';



#*****************借书功能

DROP PROCEDURE IF EXISTS LendBook;

DELIMITER //
CREATE PROCEDURE LendBook(
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
END;//


CALL LendBook('9787518053001','00017');
SELECT * FROM lendinfo WHERE 书号='9789866052231';

#*****************还书功能
DROP PROCEDURE IF EXISTS BorrwBook;

DELIMITER //
CREATE PROCEDURE BorrwBook(
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
END;//

SELECT MONTH(NOW())-MONTH('2020-11-17')

CALL BorrwBook('9787518053001','00017');
SELECT * FROM lendinfo WHERE 书号='9789866052231';
















