
#*********************视图
#******1.读者信息,按读者类别分组
DROP VIEW rederinfo;
CREATE VIEW rederinfo
AS
SELECT r.uid '读者号',uname '读者名字',usex '读者性别',ubirth '读者生日',uphone '联系方式',pname '会员名'
FROM readers r,POWER p
WHERE r.pid=p.pid
GROUP BY p.pid,r.uid;

SELECT * FROM rederinfo;


#******2.书本信息，按书本类别分组
DROP VIEW bookinfo;

CREATE VIEW bookinfo
AS
SELECT 
b.bid '书号',bname '书名',bauthor '作者',bpress '出版社',bpubdate '出版日期',moeny '售价',bcount '数目',cname '丛书名'
FROM book b,category c
WHERE b.cid=c.cid
GROUP BY c.cid,b.bid;

SELECT * FROM bookinfo;


#******3.借阅信息,图书价格降序
DROP VIEW lendinfo;

CREATE VIEW lendinfo
AS
SELECT b.bid '书号',bname '书名',bauthor '作者',bpress '出版社',bpubdate '出版日期',moeny '售价',cname '丛书名',
uname '读者名字',usex '读者性别',ubirth '读者生日',uphone '联系方式',pname '会员名'
,ldiscount '借书优惠',charge '收费',ldate '借出日期',rdate '归还日期'
FROM book b,lend l,readers r,POWER p,category c
WHERE b.bid=l.bid AND r.uid=l.uid AND r.pid=p.pid AND b.cid=c.cid
ORDER BY moeny DESC;

SELECT * FROM lendinfo;

#*******4.出售信息,按收费升序
DROP VIEW sellinfo;

CREATE VIEW sellinfo
AS
SELECT b.bid '书号',bname '书名',bauthor '作者',bpress '出版社',bpubdate '出版日期',moeny '售价',c.cid '丛书号',cname '丛书名',
uname '读者名字',usex '读者性别',ubirth '读者生日',uphone '联系方式',pname '会员名'
,sdiscount '买书优惠',charge '收费',scount '出售数目',sdate '出售日期'
FROM sell s,book b,category c,readers r,POWER p
WHERE s.bid=b.bid AND s.uid=r.uid AND r.pid=p.pid AND b.cid=c.cid
ORDER BY charge DESC;

SELECT * FROM sellinfo;


#**************6.各个丛书图书的类别数
DROP VIEW CountCategory;

CREATE VIEW CountCategory
AS
SELECT cname AS '丛书名',COUNT(b.bid) AS '图书类别'
FROM book b,category c
WHERE b.cid=c.cid
GROUP BY c.cid;

SELECT * FROM CountCategory;


#***********7.每个会员注册的人数
DROP VIEW Countpower;
CREATE VIEW Countpower
AS
SELECT p.pname AS '会员名称',COUNT(r.uid) AS '人数'
FROM readers r,POWER p
WHERE r.pid=p.pid
GROUP BY p.pid;

SELECT * FROM Countpower;

#**************8.各个丛书的书本数目,升序
DROP VIEW Countbooks;
CREATE VIEW Countbooks
AS
SELECT cname AS '丛书名',SUM(bcount) AS '书本数目'
FROM book b,category c
WHERE b.cid=c.cid
GROUP BY c.cid
ORDER BY SUM(bcount) ASC;

SELECT * FROM Countbooks;

#**************9.销售小票信息
DROP VIEW BorrowTicket;
CREATE VIEW BorrowTicket
AS
SELECT 
 uname AS '姓名',pname AS '会员名',bname AS '书名',cname AS '丛书名',scount '数量',
 sdiscount AS '优惠力度',moeny AS '原价',charge AS '实收',sdate '日期'
FROM sell s,book b ,category c,readers r,POWER p
WHERE s.bid=b.bid AND s.uid=r.uid AND b.cid=c.cid AND r.pid=p.pid
GROUP BY r.uid,b.bid;


SELECT * FROM BorrowTicket;

#**************9.借书存根
DROP VIEW  borrowReceipt;

CREATE VIEW borrowReceipt
AS
SELECT 
 uname AS '姓名',pname AS '会员名',bname AS '书名',cname AS '丛书名',ldate AS '借出日期'
FROM lend l,book b ,category c,readers r,POWER p
WHERE l.bid=b.bid AND l.uid=r.uid AND b.cid=c.cid AND r.pid=p.pid AND 2020-YEAR(rdate)>0
GROUP BY r.uid,b.bid;

SELECT * FROM borrowReceipt;

#**************10.还书小票*
DROP VIEW  ReturnReceipt;

CREATE VIEW ReturnReceipt
AS
SELECT 
 uname AS '姓名',pname AS '会员名',bname AS '书名',cname AS '丛书名',ldate AS '借出日期',rdate AS '归还日期'
 ,ldiscount AS '借书优惠',charge AS '收费'
FROM lend l,book b ,category c,readers r,POWER p
WHERE l.bid=b.bid AND l.uid=r.uid AND b.cid=c.cid AND r.pid=p.pid AND YEAR(rdate)>0
GROUP BY r.uid,b.bid;

SELECT * FROM ReturnReceipt;



#***********11.最畅销的图书
DROP VIEW SellerBook;

CREATE VIEW SellerBook
AS
SELECT b.bid '书号',bname '书名',bauthor '作者',bpress '出版社',bpubdate '出版日期',moeny '售价',cname '丛书名',scount '售出'
FROM book b,sell s,category c
WHERE b.bid=s.bid AND c.cid=b.cid AND scount=(SELECT MAX(scount) FROM sell);

SELECT * FROM SellerBook;

#***********12.各个丛书出售情况
DROP VIEW SellerCname;
CREATE VIEW SellerCname
AS
SELECT c.cid '丛书号id',cname '丛书名',SUM(scount) '数目'
FROM category c,book b,sell s
WHERE c.cid=b.cid AND b.bid=s.bid
GROUP BY b.cid;

SELECT * FROM SellerCname;

#*********13.推荐图书
CREATE VIEW RecomBooks
AS
SELECT b.bid '书号',bname '书名',bauthor '作者',bpress '出版社',bpubdate '出版日期',moeny '售价',cname '丛书名'
FROM book b,category c
WHERE b.cid=c.cid AND b.bid IN(
SELECT 书号
FROM sellinfo s
WHERE 丛书号 IN(
SELECT 丛书号id
FROM SellerCname
WHERE 数目=(SELECT MAX(数目)FROM SellerCname)) AND 出售数目=(SELECT MAX(出售数目) FROM sellinfo WHERE 丛书号=s.丛书号)
)


SELECT * FROM RecomBooks;


#*****借书中，年龄最大的用户喜欢的图书
****************************************
SELECT li.*
FROM readers r,lendinfo li
WHERE r.uid=li.pid AND 2020-YEAR(ubirth)=(SELECT MAX(2020-YEAR(readers.ubirth)) FROM readers);



