-- selfit 화면
CREATE TABLE tbl_sch (
    sc_id	varchar2(4)		primary key,
    sc_num	varchar2(6)	not null,
    sc_label	nvarchar2(10)	not null,	
    sc_division	nvarchar2(20)	not null,
    sc_day	varchar2(10)	not null,
    sc_part	nvarchar2(30)	not null	
);

CREATE TABLE tbl_list (
    list_id	varchar2(5)		primary key,
    list_name	nvarchar2(125)	not null
);

drop table tbl_sch_list;

CREATE TABLE tbl_sch_list (
    sl_id	VARCHAR2(5)		primary key,
    sl_scid	VARCHAR2(4)	not null,
    sl_listid	VARCHAR2(5)	not null,
    sl_listname	NVARCHAR2(125)	not null,
    sl_set	number not null,
    sl_weight	VARCHAR2(10)	not null,
    sl_rep	VARCHAR2(10)	not null	
);

SELECT COUNT(*) FROM tbl_sch;
SELECT COUNT(*) FROM tbl_list;
SELECT COUNT(*) FROM tbl_sch_list;

SELECT * FROM tbl_sch_list;

drop view view_Workout;
create view view_Workout
as(
SELECT sl_id,sl_scid, 
            sc_num, sc_label, sc_division, sc_day, sc_part,
       sl_listid, list_name,
       sl_set, sl_weight, sl_rep
FROM tbl_sch_list
    left join tbl_sch
        on sc_id =sl_scid
    left join tbl_list
        on list_id = sl_listid
);

SELECT * from view_workout
ORDER BY sc_num, sc_day;

SELECT sc_num,sc_label
from view_workout
group by sc_num, sc_label
order by sc_num;

SELECT sc_label
from view_workout
group by sc_label;

SELECT sc_label,sc_part
from view_workout
WHERE sc_label='초급';

--운동스케줄 table 에서 등급ID + label + division 이를 묶어서 한개씩만 보고 싶을때
SELECT sc_num,sc_label, sc_division
from tbl_sch
group by sc_num, sc_label, sc_division
order by sc_num;

SELECT * from view_workout
WHERE sl_scid= 'D001';















