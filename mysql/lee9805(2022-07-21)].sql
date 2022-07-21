USE schoolDB;

-- 학사정보 테이블 명세를 참조하여 tbl_student table 생성
 DROP TABLE tbl_score;
create table tbl_school (
	st_num	VARCHAR(5)		PRIMARY KEY,
	st_name	VARCHAR(20)		NOT NULL,	
	st_dept	VARCHAR(20),		
	st_grade INT	,	
	st_tel	 VARCHAR(15)	NOT NULL,	
	st_addr	VARCHAR(125)
);
select count(*) from tbl_school;

create table tbl_subject (
sb_code	VARCHAR(5)	NOT NULL	PRIMARY KEY,
sb_name	VARCHAR(25)	NOT NULL	
);
-- MySQL 의 다중 insert
insert into tbl_subject (sb_code,sb_name) 
values 
( 'SB001','국어'),
( 'SB002','데이터베이스'),
( 'SB003','미술'),
( 'SB004','소프트웨어공학'),
( 'SB005','수학'),
( 'SB006','영어'),
( 'SB007','음악');
select * from tbl_subject;

-- 성적이 저장될 table
-- 학생정보와 과목정보가 함께 연동되어 점수를 관리
-- sc_seq 임의 칼럼을 만들어 PK 로 삼고
-- 학번 + 과목코드가 동시에 같은 코드가 중복되지 않도록
-- UNIQUE(학번, 과목코드) 설정하였다
create table tbl_score (
sc_seq	BIGINT	PRIMARY KEY auto_increment,
sc_stnum	VARCHAR(5)	NOT NULL,
sc_sbcode	VARCHAR(5)	NOT NULL,	
sc_score	INT, 
unique(sc_stnum, sc_sbcode)
);
select count(*) from tbl_score;

-- tbl_score 데이터에서 점수가 70점 이하인 데이터만 추출
-- Selection 조건절(WHERE) 을 추가하여 조건에 맞는 데이터만 추출하기
select * from tbl_score
where sc_score <=70
order by sc_stnum;

-- tbl_score 데이터에서 전체 데이터를 표시하되
-- 과목코드, 점수 칼럼만 표시되도록 

-- Projection
-- table 많은 칼럼(속성 Attribute,필드 field)이 있을경우
-- 필요한 칼럼만 나열하여 리스트를 보고자 할때
 select sc_sbcode,sc_score from tbl_score;
 
-- tbl_score 데이터에서 점수가 50점 이상 70점 이하인 데이터
-- 과목코드와 점수만 보이도록

select sc_sbcode,sc_score from tbl_score
where sc_score >=50 and sc_score <= 70;

-- 범위를 지정할때 이상 AND 이하 일경우 BETWEEN을 사용할 수 있다
select sc_sbcode,sc_score from tbl_score
where sc_score between 50 and 70;

-- 점수가 50이상 70이하인 데이터
-- tbl_subject table 과 연결하여
-- 과목코드, 과목명, 점수 칼럼이 보이도록
-- tbl_score 테이블에서 WHERE 조건에 맞는 데이터를 모두 section하고
-- 
select SC.sc_sbcode,SB.sb_name,SC.sc_score
from tbl_score SC
	left join tbl_subject SB
		on SC.sc_sbcode = SB.sb_code
where SC.sc_score between 50 and 70;

-- 점수가 50 ~ 70인 데이터를 selection
-- 과목코드, 과목명, 점수를 표현 
-- tbl_school table 을 join하고
-- 학번, 학생이름, 과목코드, 과목명, 점수를 projection
-- 학번 순으로 정렬하기
select SC.sc_stnum, ST.st_name, SC.sc_sbcode,SB.sb_name,SC.sc_score
from tbl_score SC
	left join tbl_subject SB
		on SC.sc_sbcode = SB.sb_code
	left join tbl_school ST
		on SC.sc_stnum = ST.st_num
where SC.sc_score between 50 and 70
order by sc_seq;

-- tbl_score table의 데이터를 참조하여
-- 과목별 전체 총점을 구하시오
-- GROUP BY SUM, AVG 등 통계함수를 사용하여 Selection
select sc_sbcode, sum(sc_score), avg(sc_score) from tbl_score
group by sc_sbcode;

-- 과목명을 함께 projection
select sc_sbcode,sb_name, sum(sc_score), avg(sc_score) from tbl_score SC
	left join tbl_subject SB
	on SC.sc_sbcode = SB.sb_code
group by sc_sbcode,sb_name
order by sc_sbcode;

-- 학생별로 총점 구하기
-- 학번, 이름, 총점, 평균 Projection
-- 학번순으로 정렬
select sc_stnum, st_name, sum(sc_score),avg(sc_score) from tbl_score
	left join tbl_school
    on sc_stnum = st_num
group by sc_stnum
order by sc_stnum;

-- tbl_score 테이블에서 각 학생들의 SB002(데이터베이스) 과목 점수만
-- 학번, 데이터베이스점수(sb002)
select sc_stnum, st_name, sc_sbcode, sc_score from tbl_school
	left join tbl_score
    on st_num = sc_stnum
where sc_sbcode ='SB002';

select sc_stnum, st_name,
	sum(if(sc_sbcode = 'SB001', sc_score, 0)) as 국어,
    sum(if(sc_sbcode = 'SB002', sc_score, 0)) as 데이터,
    sum(if(sc_sbcode = 'SB003', sc_score, 0)) as 미술,
    sum(if(sc_sbcode = 'SB004', sc_score, 0)) as 소프트,
    sum(if(sc_sbcode = 'SB005', sc_score, 0)) as 수학,
    sum(if(sc_sbcode = 'SB006', sc_score, 0)) as 영어,
    sum(if(sc_sbcode = 'SB007', sc_score, 0)) as 음악,
    sum(sc_score) as 총점 , avg(sc_score) as 평균
from tbl_score
 left join tbl_school
 on sc_stnum = st_num
group by sc_stnum;

select sc_stnum as 학번, st_name as 이름,
	sum(case when sc_sbcode = 'SB001' then sc_score else 0 end) as 국어,
    sum(case when sc_sbcode = 'SB002' then sc_score else 0 end) as 데이터,
    sum(case when sc_sbcode = 'SB003' then sc_score else 0 end) as 미술,
    sum(case when sc_sbcode = 'SB004' then sc_score else 0 end) as 소프트,
    sum(case when sc_sbcode = 'SB005' then sc_score else 0 end) as 수학,
    sum(case when sc_sbcode = 'SB006' then sc_score else 0 end) as 영어,
    sum(case when sc_sbcode = 'SB007' then sc_score else 0 end) as 음악,
    sum(sc_score) as 총점 , avg(sc_score) as 평균
from tbl_score
 left join tbl_school
 on sc_stnum = st_num
group by sc_stnum;
/*
제 2정규화가 되어있는 데이터를 view 할때는 Pivot으로 데이터
펼쳐서 보는 것이 편리할 때가 많다
제 2정규화가 된 데이터는 기준이 되는 키값을 중심을 Row 방향으로
데이터가 저장되어 있다
이 데티어를 쉽게 보고서등으로 만들때는 pivot을 하여
column 방향으로 펼쳐서 보는것이 편리하다
*/









