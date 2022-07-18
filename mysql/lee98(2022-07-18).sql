use mydb;
show tables;
select * from tbl_food;

create table tbl_address (
	a_seq bigint auto_increment primary key,
    a_name varchar(20) not null,
    a_tel varchar(30),
    a_address varchar(125)
);
drop table tbl_address;
select * from tbl_address;

insert into tbl_address
value (''),(''),('');

-- Date Create :  테이블에 데이터를 추가하기
INSERT INTO tbl_address(a_name, a_tel, a_address)
values ('lee','1234134','광주 남구');

-- Data 가져오기, 선택하기, Fetch 하기
SELECT * FROM tbl_address;
UPDATE;
DELETE;

