-- 여기는 USER2

SELECT * FROM tbl_score;
/*
TBL_SCORE  데이터는 한 학생의 과목점수가 각각 레코드별로 저장되어 있다
과목수가 늘어나면 학번, 과목명, 점수 형식으로 저장해주면 된다.

실제 필요한 데이터는 학번, 과목명, 점수 칼럼인데, PK를 설정하기 위해 SEQ라는 
말럼이 추가된 상태이다

SEQ 칼럼이 없이 PK를 설정하려면 학번 +과목명 으로 두개의 칼럼을 묶어서
PK로 해야한다.
다수의 칼럼을 묶음으로  PK 를 설정하는 것을  Super Key라고 한다
필요에 따라 Super Key로 PK를 설정하기도 하지만 Super Key는 잘못 사용하면
데이터 무결성을 해칠수 도 있다

UPDATE tbl_student SET sc_score = 90
WHERE st_num = '1111' AND st_subject ='국어'

DELETE FROM tbl_student
WHERE st_num = '1111' AND st_subject ='국어'


*/
--학번 S0044 인 학생의 미술점수를 50점 에서 80점으로 바꾸고 싶다
-- UPDATE 나 DELETE 실행할때 조건절(WHERE)에 복수의 칼럼 조건을 부여하는 것은 
-- 썩 좋지 않다
UPDATE tbl_score SET sc_score = 80
WHERE sc_stnum = 'S0044' AND sc_subject='미술';

-- 1. 변경하고자 하는 점수의 데이터를 먼저 조회한다
SELECT * FROM tbl_score
WHERE sc_stnum = 'S0044' AND sc_subject='미술';

-- 2. 변겨하고자 하는 데이터가 조회되면 PK가 무엇인지 확인한다
--PK : 308

-- 3. PK를 조건으로 하는 UPDATE명령을 실행한다
UPDATE tbl_score SET sc_score = 80
WHERE sc_seq = 308;

--4. 실행후 정확히 원하는 값으로 변경되었는지 확인
SELECT * FROM tbl_score WHERE sc_seq =308;

--학생별로 성적 총점을 계산하자
SELECT sc_stnum, SUM(sc_score)
FROM tbl_score
GROUP BY sc_stnum;

--정규화되지 않고 각 과목별로 칼럼이 있는 TABLE
SELECT sc_kor + sc_eng + sc_math FROM tbl_score;

--학생별로 성적 총점을 계산하고
--학번 순으로 정렬하자
SELECT sc_stnum, SUM(sc_score)
FROM tbl_score
GROUP BY st_stnum
ORDER by sc_stnum;

--성적조회를 하였는데 학번과 점수만 나타나서 누구인지을 알수 없다
-- 두개 이상의 데이블을 서로 연동하여 데이터를 확인하기
-- JOIN  하여 데이터 검색
--1. tbl_score table  데이터를 저부 펼치고
--2. sc_stnum 칼럼과 sc_score 칼럼 데이터를 보여주며서
--3. tbl_score.sc_stnum 데이터를 가지고 tbl_student.st_num를 SELETE 한 후
--4. 일치하는 데이터가 있으면 st_name 칼럼을 가져와서 함께 보여라
SELECT sc_stnum, st_name, sc_score
FROM tbl_score, tbl_student
WHERE sc_stnum = st_num
ORDER BY sc_stnum;

