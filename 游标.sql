#***************备份用户表(增量)
#*****建表
CREATE TABLE backupsReder AS SELECT * FROM readers  WHERE 1=2;


DROP PROCEDURE IF EXISTS backupsReders;

DELIMITER //
CREATE PROCEDURE backupsReders()
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE course_id CHAR(10);
DECLARE course_name VARCHAR(50); 
DECLARE course_sex  CHAR(5);
DECLARE course_birth  DATE;
DECLARE course_phone  VARCHAR(20);
DECLARE course_pid  CHAR(10);
DECLARE mc CURSOR FOR SELECT * FROM readers;  #定义游标
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; 
    OPEN mc;
    out_loop:
    LOOP  -- 循环，将表的内容都转移到backupsReder中
        FETCH mc INTO course_id, course_name, course_sex,course_birth,course_phone,course_pid;
        IF done =1 THEN
	   LEAVE out_loop;
	END IF;
	IF (SELECT COUNT(*) FROM backupsReder WHERE uid=course_id)<=0 THEN
	   INSERT INTO backupsReder VALUES(course_id, course_name, course_sex,course_birth,course_phone,course_pid);
	END IF;
        SET done = 0;  
    END LOOP out_loop;
    CLOSE mc;
END;//

#使用
CALL backupsReders();
