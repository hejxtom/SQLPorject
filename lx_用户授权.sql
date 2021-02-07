#*************用户授权

#******创建角色
CREATE USER 'reder'@'localhost' IDENTIFIED BY '123456'
GRANT SELECT ON opticalvalleybookstore.book TO 'reder'@'localhost' WITH GRANT OPTION;
#revoke SELECT ON opticalvalleybookstore.book from 'reder'@'localhost';
#set password for 'reder'@'localhost' = password('reder');

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON opticalvalleybookstore.* TO 'admin'@'localhost' WITH GRANT OPTION;
#REVOKE ALL PRIVILEGES ON opticalvalleybookstore.* FROM 'admin'@'localhost';

#*************创建用户
#管理员
CREATE USER 'user'@'localhost' IDENTIFIED BY 'user';
#普通用户(读者用户)
CREATE USER 'lx'@'localhost' IDENTIFIED BY '123456';



#****授权:管理员
#*******进入admin角色:mysql -uadmin -padmin
GRANT ALL PRIVILEGES ON opticalvalleybookstore.* TO 'user'@'localhost';


#****授权:用户
#*******进入reder角色:mysql -ureder -p123456
GRANT SELECT ON opticalvalleybookstore.book TO 'lx'@'localhost';



#***查看角色
SHOW GRANTS FOR 'reder'@'localhost';

#SHOW GRANTS FOR 'root'@'localhost'

FLUSH  PRIVILEGES;
SHOW GRANTS FOR 'admin'@'localhost';

#******查看用户
SHOW GRANTS FOR 'lx'@'localhost';
SHOW GRANTS FOR 'user'@'localhost';


#DROP PROCEDURE IF EXISTS grandToreder;
#DELIMITER //
#CREATE PROCEDURE grandToreder(IN uid CHAR(5))
#BEGIN
#create user uid@'localhost' identified by password(uid);
#grant all privileges on 'opticalvalleybookstore'.book to uid@'localhost';
#END//
#CALL grandToreder('lx');

SELECT * FROM mysql.user WHERE USER='reder';


