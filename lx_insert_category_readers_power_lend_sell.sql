
#*******************LibraryManagements(图书馆借还管理信息系统数据库设计)
#*****member(读者权限表)

ALTER TABLE member ADD COLUMN ldiscount DECIMAL(10,2);


INSERT INTO member VALUES('00001','钻石会员','0.01'),('00002','黄金会员','0.02'),('00003','白银会员','0.03'),
('00004','青铜会员','0.04'),('00005','普通会员','0.1');


#*****readers(读者信息表)
INSERT INTO USER VALUES('00001','王静','女','1999-09-11','13774102089','00001'),
                          ('00002','刘东阳','女','1999-10-09','17671729179','00002'),
                          ('00003','钱忠理','男','1998-10-09','15341629146','00003'),
                          ('00004','马晓夏','女','1995-05-12','15341629146','00004'),
                          ('00005','孙海洋','男','1995-04-03','15341629146','00001'),
                          ('00006','郭小斌','男','1997-11-10','17671729179','00002'),
                          ('00007','张玲珑','女','1997-12-24','15341629146','00003'),
                          ('00008','罗璇','女','2000-03-21','15341629146','00001'),
                          ('00009','张三','男','2000-00-00','15341629146','00001'),
                          ('00010','赵小龙','男','1999-02-15','17671729179','00002'),
                          ('00011','赵小飞','女','1999-03-15','15341629146','00003'),
                          ('00012','刘晨','男','1998-02-15','15341629146','00004'),
                          ('00013','李永','男','2000-03-18','15341629146','00001'),
                          ('00014','秦风','男','1995-02-15','17671729179','00002'),
                          ('00015','李小永','女','1999-03-15','15341629146','00003'),
                          ('00016','刘小晨','女','1989-02-15','15341629146','00004');
#*******series(丛书表)
                          
INSERT INTO series VALUES('00002','教育教学类'),('00003','政治图书类'),('00004','家居休闲类'),('00005','经济管理类');

#*****lend(借阅信息表)                        
INSERT INTO lend VALUES('9787010040127','00001','2019-00-00','2019-01-00',0.01*18),
                       ('9787111530114','00002','2019-00-00','2019-01-00',0.02*151),
                       ('9787117031868','00003','2019-00-00','2019-01-00',0.03*59),
                       ('9787117096911','00004','2019-00-00','2019-01-00',0.04*104),
                       ('9787302508885','00005','2019-00-00','2019-01-00',0.01*12),
                       ('9787303067336','00006','2019-00-00','2019-01-00',0.02*161),
                       ('9787304063771','00007','2019-00-00','2019-01-00',0.03*24),
                       ('9787309027778','00008','2019-00-00','2019-01-00',0.04*29),
                       ('9787500579359','00009','2019-00-00','2019-01-00',0.01*39),
                       ('9787508633749','00010','2019-00-00','2019-01-00',0.02*32),
                       ('9787508645865','00011','2019-00-00','2019-01-00',0.03*32),
                       ('9787508649528','00012','2019-00-00','2019-01-00',0.04*30),
                       ('9787544708173','00013','2019-00-00','2019-01-00',0.01*39),
                       ('9787545402377','00014','2019-00-00','2019-01-00',0.02*42),
                       ('9787563346134','00015','2019-00-00','2019-01-00',0.1*45),
                       ('9787564045838','00016','2019-00-00','2019-01-00',0.1*35);




















