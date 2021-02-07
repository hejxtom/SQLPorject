#*******动态备份读者表
DROP TRIGGER IF EXISTS backup_Book;
DELIMITER //
CREATE TRIGGER backup_Book BEFORE UPDATE 
ON opticalvalleybookstore.readers FOR EACH ROW 
BEGIN 
UPDATE backupsreder SET uname=new.uname,usex=new.usex,ubirth=new.ubirth,uphone=new.uphone,pid=new.pid WHERE uid=new.uid;
END//


UPDATE readers SET pid='00001' WHERE uid='00017';

SELECT * FROM backupsreder WHERE uid='00017';

#UPDATE book SET bcount=30 WHERE bid='9789866052231';










