USE goodsDB;

CREATE TABLE IF NOT EXISTS board (
   num int not null auto_increment,
   b_id varchar(10) not null, 
   b_name varchar(10) not null, 
   b_subject varchar(100) not null,
   b_content text not null,
   b_regist_day varchar(30),
   b_hit int,
   b_ip varchar(20),
   PRIMARY KEY(num)
)default CHARSET=utf8;

desc board;
drop table book;