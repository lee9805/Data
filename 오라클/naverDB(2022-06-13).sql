--여기는 네이버 디비
CREATE TABLE tbl_bbs(
	b_seq 		NUMBER 			PRIMARY KEY,
	b_date 		VARCHAR2(10) 	NOT NULL,
	b_time 		VARCHAR2(10) 	NOT NULL,
	b_writer 	VARCHAR2(125) 	NOT NULL,
	b_subject 	nVARCHAR2(125) 	NOT NULL,
	b_content 	nVARCHAR2(1000) NOT NULL
);
-- 시작값을 1로 하고,1씩 자동증가되는 seq 생성하기
create SEQUENCE seq_bbs
INCREMENT BY 1 START WITH 1;

select seq_bbs.nextVAL from dual;
insert into tbl_bbs(
    b_seq,
    b_date,
    b_time, 
    b_writer, 
    b_subject,
    b_content)
values(
    seq_bbs.nextval, 
    '2022-06-13', 
    '14:23:55',
    'lee98',
    '게시판 글쓰기',
    '게시판에 글을 쓰자'
);
SELECT * FROM tbl_bbs;
commit;