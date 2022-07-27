use mydb;
create table tbl_books (
bk_isbn	CHAR(13)		PRIMARY KEY,
bk_title	VARCHAR(125)	NOT NULL,	
bk_ccode	CHAR(5)	NOT NULL	,
bk_acode	CHAR(5)	NOT NULL	,
bk_date	VARCHAR(10)		,
bk_price	INT		,
bk_pages	INT		
);
create table tbl_company (
cp_code	CHAR(5)		PRIMARY KEY,
cp_title	VARCHAR(125)	NOT NULL	,
cp_ceo	VARCHAR(20)		,
cp_tel	VARCHAR(20)		,
cp_addr	VARCHAR(125)	,	
cp_genre	VARCHAR(10)		
);
create table tbl_author (
au_code	CHAR(5)		PRIMARY KEY,
au_name	VARCHAR(50)	NOT NULL	,
au_tel	VARCHAR(20)		,
au_addr	VARCHAR(125)	,	
au_genre	VARCHAR(30)	
);

select bk_title, bk_price  from tbl_books
where bk_price <= 20000;

select bk_isbn, bk_title , cp_title, cp_ceo, au_name, bk_date
from tbl_books
 left join tbl_author
	on bk_acode= au_code
 left join tbl_company
	on bk_ccode = cp_code
where bk_date <= '2018-12-30';

delete from tbl_author
where au_code = 'A0010';

select * from tbl_author;

