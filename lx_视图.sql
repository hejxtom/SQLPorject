#******1.读者信息,按读者类别分组
DROP VIEW rederinfo;
CREATE VIEW userinfo
AS
SELECT r.uid '读者号',uname '读者名字',usex '读者性别',ubirth '读者生日',uphone '联系方式',mname '会员名'
FROM USER r,member p
WHERE r.mid=p.mid
GROUP BY p.mid,r.uid;

SELECT * FROM userinfo;


#******2.书本信息，按书本类别分组
DROP VIEW bookinfo;

CREATE VIEW bookinfo
AS
SELECT 
b.bid '书号',bname '书名',bauthor '作者',bpress '出版社',bpubdate '出版日期',moeny '售价',bcount '数目',sname '丛书名'
FROM book b,series c
WHERE b.sid=c.sid
GROUP BY c.sid,b.bid;

SELECT * FROM bookinfo;

#******3.借阅信息,图书价格降序
DROP VIEW lendinfo;

CREATE VIEW lendinfo
AS
SELECT b.bid '书号',bname '书名',bauthor '作者',bpress '出版社',bpubdate '出版日期',moeny '售价',sname '丛书名',
uname '读者名字',usex '读者性别',ubirth '读者生日',uphone '联系方式',mname '会员名'
,ldiscount '借书优惠',charge '收费',ldate '借出日期',rdate '归还日期'
FROM book b,lend l,USER r,member p,series c
WHERE b.bid=l.bid AND r.uid=l.uid AND r.mid=p.mid AND b.sid=c.sid
ORDER BY moeny DESC;

SELECT * FROM lendinfo;

#**************4.各个丛书图书的类别数
DROP VIEW CountCategory;

CREATE VIEW CountCategory
AS
SELECT sname AS '丛书名',COUNT(b.bid) AS '图书类别'
FROM book b,series c
WHERE b.sid=c.sid
GROUP BY c.sid;

SELECT * FROM CountCategory;


#***********5.每个会员注册的人数
DROP VIEW Countpower;

CREATE VIEW Countpower
AS
SELECT p.mname AS '会员名称',COUNT(r.uid) AS '人数'
FROM USER r,member p
WHERE r.mid=p.mid
GROUP BY p.mid;

SELECT * FROM Countpower;

#**************6.各个丛书的书本数目,升序
DROP VIEW Countbooks;
CREATE VIEW Countbooks
AS
SELECT sname AS '丛书名',SUM(bcount) AS '书本数目'
FROM book b,series c
WHERE b.sid=c.sid
GROUP BY c.sid
ORDER BY SUM(bcount) ASC;

SELECT * FROM Countbooks;


#**************7.借书存根
DROP VIEW  borrowReceipt;

CREATE VIEW borrowReceipt
AS
SELECT 
 uname AS '姓名',mname AS '会员名',bname AS '书名',sname AS '丛书名',ldate AS '借出日期'
FROM lend l,book b ,series c,USER r,member p
WHERE l.bid=b.bid AND l.uid=r.uid AND b.sid=c.sid AND r.mid=p.mid AND 2020-YEAR(rdate)>0
GROUP BY r.uid,b.bid;

SELECT * FROM borrowReceipt;


#**************8.还书小票
DROP VIEW  ReturnReceipt;

CREATE VIEW ReturnReceipt
AS
SELECT 
 uname AS '姓名',mname AS '会员名',bname AS '书名',sname AS '丛书名',ldate AS '借出日期',rdate AS '归还日期'
 ,ldiscount AS '借书优惠',charge AS '收费'
FROM lend l,book b ,series c,USER r,member p
WHERE l.bid=b.bid AND l.uid=r.uid AND b.sid=c.sid AND r.mid=p.mid AND 2020-YEAR(rdate)>0
GROUP BY r.uid,b.bid;

SELECT * FROM ReturnReceipt;


#************9.每个丛书借书的情况
DROP VIEW LendsCname;
CREATE VIEW LendsCname
AS
SELECT c.sid '丛书号id',sname '丛书名',COUNT(*) '数目'
FROM series c,book b,lend l
WHERE c.sid=b.sid AND b.bid=l.bid
GROUP BY b.sid;

SELECT * FROM LendsCname;



#*********10.推荐图书:最畅销的丛书的图书信息
CREATE VIEW bestsellproducts
AS
SELECT bi.*
FROM bookinfo bi
WHERE 丛书名 IN(
SELECT 丛书名
FROM LendsCname
WHERE 数目=(
SELECT MAX(数目)
FROM LendsCname
)
);

SELECT * FROM bestsellproducts;
















