--여기는 user3 화면
-- 학생 Entity 설계를 기준으로 tbl_student table 생성하기
DROP TABLE tbl_student;
CREATE TABLE tbl_student (
    st_num varchar2(8) PRIMARY key,
    st_name nvarchar2(15) not null,
    st_grade NUMBER(1) DEFAULT null,
    st_tel VARCHAR2(15),
    st_addr NVARCHAR2(255)
);

insert into tbl_student(st_num,st_name)
VALUEs('20220001','이혜지');

--학과 테이블
-- 학과 코드는 pk로 선언하고
-- 학과 이름은 null 이거나 중복되지 않도록 설정
DROP TABLE tbl_dept;

CREATE table tbl_dept (

    d_code VARCHAR2(5) PRIMARY key,
    d_name NVARCHAR2(20) not null UNIQUE,
    d_pro NVARCHAR2(15),
    d_class VARCHAR2(5)
);

-- 학생의 학과 소속 정보 reletion 을 table 로 생성
-- reletion을 table로 설계할때 가장 유의 해야할 부분
-- entity table의 칼럼과 domain(type 과 길이) 을 반드시 일치시켜야 한다

--복수의 칼럼이 unique, notnull 선언되었다
--이러한 경우 복수의 칼럼을 묶어 pk로 선언하기도 한다
-- 이 table 에 insert 수행할때는 데이터 검증이 잘 되어
--잘못된 데이터가 추가되는 것을 방지할 수 있다

--하지만 updatem delete 수행할때는
--복수의 칼럼으로 조건절을 수행해야한다
-- 이때 칼럼을 누락시키거나, 잘못된 값으로 조건을 수행하여
-- 데이터 무결성이 피괴될수 있다

--이럴때는 실제 데이터와 관련없는 단일 칼럼을 추가하고
--pk 설정하는 설계를 할 필요가 있다
DROP TABLE tbl_belong;
CREATE TABLE tbl_belong (
    b_seq number PRIMARY KEY,
    b_stnum VARCHAR2(8) not null,
    b_dcode VARCHAR2(5) not null,
    UNIQUE(b_stnum, b_dcode)
);

SELECT * FROM tbl_student;

--전체 칼럼에 데이터 포함하여 insert 하기
insert into tbl_dept(d_code, d_name, d_pro, d_clss)
values('d0001','행위예술과','이혜지','505'); 
    
--전체 칼럼에 데이터를 포함해 insert 할때는 칼럼 리스트를 생략할수 있다
--하지만, 정확히 칼럼에 데이터들이 일치하는 보장이 없다
insert into tbl_dept
values('d0002','수면과','나하나','505'); 

--학번 1번학생의 소속학과(d0001)을 등록
insert into tbl_belong(b_seq, b_stnum, b_dcode)
values(1,'20220001', '00001');

SELECT * FROM tbl_dept;

SELECT st.st_name, b.b_dcode, st.st_grade
FROM tbl_student st
    left join tbl_belong b
    on st.st_num = b.b_stnum;

insert into tbl_student(st_num,st_name) values('20220001','이혜지');
insert into tbl_belong(b_seq, b_stnum,b_dcode) values(1,'20220001','d0001');
insert into tbl_dept(d_code,d_name) values('d0001','행위예술과');

SELECT st.st_num, st.st_name, b.b_dcode,d.d_name,d.d_pro, st.st_grade,d.d_class
FROM tbl_student st
    left join tbl_belong b
        on st.st_num = b.b_stnum
    left join tbl_dept d
        on b.b_dcode = d.d_code;






