#*******动态备份读者表
DROP TRIGGER IF EXISTS backup_Book;
DELIMITER //
CREATE TRIGGER backup_Book BEFORE UPDATE 
ON librarymanagements.user FOR EACH ROW 
BEGIN 
UPDATE backupsUser SET uname=new.uname,usex=new.usex,ubirth=new.ubirth,uphone=new.uphone,MID=new.mid WHERE uid=new.uid;
END//


UPDATE USER SET MID='00004' WHERE uid='00017';

SELECT * FROM backupsUser WHERE uid='00017';