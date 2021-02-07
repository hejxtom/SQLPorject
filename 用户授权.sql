#*************用户授权

#******创建角色*

CREATE USER 'USER'@'localhost' IDENTIFIED BY 'USER';
GRANT SELECT ON opticalvalleybookstore.book TO 'USER'@'localhost' WITH GRANT OPTION;



#revoke SELECT ON opticalvalleybookstore.book from 'reder'@'localhost';
#set password for 'reder'@'localhost' = password('reder');

CREATE USER 'ADMIN'@'localhost' IDENTIFIED BY 'ADMIN';
GRANT ALL PRIVILEGES ON opticalvalleybookstore.* TO 'ADMIN'@'localhost' WITH GRANT OPTION;

#REVOKE ALL ON opticalvalleybookstore.* FROM 'admin'@'localhost';

#*************创建用户
#管理员
CREATE USER 'Guanli'@'localhost' IDENTIFIED BY 'Guanli';
#普通用户(读者用户)
CREATE USER 'Duzhe'@'localhost' IDENTIFIED BY 'Duzhe';



#****授权:管理员
#*******进入ADMIN角色:mysql -uADMIN -pADMIN
GRANT ALL PRIVILEGES ON opticalvalleybookstore.* TO 'Guanli'@'localhost';


#****授权:用户
#*******进入USER角色:mysql -uUSER -pUSER
GRANT SELECT ON opticalvalleybookstore.book TO 'Duzhe'@'localhost';



#***查看角色
SHOW GRANTS FOR 'USER'@'localhost';

#SHOW GRANTS FOR 'root'@'localhost'

FLUSH  PRIVILEGES;
SHOW GRANTS FOR 'ADMIN'@'localhost';

#******查看用户
SHOW GRANTS FOR 'Guanli'@'localhost';
SHOW GRANTS FOR 'Duzhe'@'localhost';

revoke SELECT ON opticalvalleybookstore.book from '00001'@'localhost';

#DROP PROCEDURE IF EXISTS grandToreder;
#DELIMITER //
#CREATE PROCEDURE grandToreder(IN uid CHAR(5))
#BEGIN
#create user uid@'localhost' identified by password(uid);
#grant all privileges on 'opticalvalleybookstore'.book to uid@'localhost';
#END//
#CALL grandToreder('00001');

SELECT * FROM mysql.user WHERE USER='reder';


