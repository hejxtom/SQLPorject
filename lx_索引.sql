#*************图书名称加索引
ALTER TABLE book ADD INDEX bookName (bname);
#*************读者姓名加索引
ALTER TABLE USER ADD INDEX readerName (uname);