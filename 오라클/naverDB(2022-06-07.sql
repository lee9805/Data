drop table tbl_naver;

CREATE table tbl_naver(
    ISBN	        VARCHAR2(13)	 primary key,
    TITLE	        NVARCHAR2(50)	Not null,
    AUTHOR	        NVARCHAR2(50)	Not null,
    PUBLISHER	    NVARCHAR2(50)	Not null,
    PRICE	        NUMBER	,
    DISCOUNT	    NUMBER,	
    DESCRIPTION	    NVARCHAR2(2000),
    PUBDATE	        VARCHAR2(10),
    LINK	        VARCHAR2(125),	
    IMAGE	        VARCHAR2(125)
);
Drop table tbl_naver;


insert all
into tbl_naver(isbn, title, author, publisher)
values ('0001','자바','홍길동','우리출판사')
into tbl_naver(isbn, title, author, publisher)
values ('0002','자바','홍길동','우리출판사')
select * from dual;

insert into tbl_naver(isbn, title, author, publisher, price)
values ('0003','Mysql', '이몽룡','남원출판사','9900');

SELECT * FROM tbl_naver;

insert into tbl_naver(isbn, title, author, publisher, price)
values ('0004','Mysql', '이몽룡','남원출판사','');

/*
SQL Developer 에서 insert, update, delete 수행하였으나
다른 (Spring) 프로젝트에서 데이터 반영이 안되는 경우
명령 끝에 반드시 commit 를  수행한다

insert, update, delete 를 수행한 결과는
아직 메모리 버퍼에 머물러있는 상태이다
실제 물리적 저장소에 저장이 안된상태이다
이 상태에서 다른 프로젝트에서 데이터를 조회하면
데이터가 보이 않는다
*/
commit;