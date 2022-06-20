-- selfit 화면
SELECT sc_num, sc_label, sc_division, sc_day, sc_part
from tbl_sch;


--Projection
-- tbl_sch 테이블에 있는 모든 데이터중에서 sc_num, sc_label, sc_division 칼럼만
-- 나열하여 보고싶다
-- 일부 칼럼만 한정하여 데이터를 보고자 할때
SELECT sc_num, sc_label, sc_division
from tbl_sch;

-- SECTION
--where 조건을 부여하여
--튜플(출력되는 데이터)의 개수를 제한하기
SELECT sc_num, sc_label, sc_division
from tbl_sch
WHERE sc_num= '01-001';

--section, projecction을 수행할때
--sc_num, sc_label, sc_division칼럼의 데이터들을 중복 없이 확인하기
-- sc_num 칼럼을 기준으로 오름차순 정렬 하기
select sc_num, sc_label,sc_division
from tbl_sch
GROUP by sc_num, sc_label,sc_division
order by sc_num;

SELECT sc_num,sc_label, sc_division
from tbl_sch
where SUBSTR(sc_num,1,2) = '01'
group by sc_num, sc_label, sc_division
order by sc_num
        
        
        
        
        
        
        
        
        
