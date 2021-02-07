#*************图书名称加索引
ALTER TABLE book ADD INDEX bookName (bname);
#*************读者姓名加索引
ALTER TABLE readers ADD INDEX readerName (uname);



show index from book where Key_name='bookName';

show index from readers where Key_name='readerName';