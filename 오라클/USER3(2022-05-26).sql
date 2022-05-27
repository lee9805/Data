---user3
insert into tbl_student(st_num, st_name, st_grade, st_addr, st_tel);


DROP TABLE tbl_user;
CREATE TABLE tbl_user (
    username VARCHAR2(30) PRIMARY KEY,
    password VARCHAR2(120) NOT NULL,
    name nVARCHAR2(20),
    email VARCHAR2(125),
    role VARCHAR2(15)
);

SELECT * FROM tbl_user;

ALTER TABLE tbl_student  MODIFY st_tel VARCHAR2(15);

UPDATE tbl_student 
SET st_tel = '010-111-1111'
WHERE st_num = '20220001';

UPDATE tbl_student 
SET st_tel = '010-111-3333'
WHERE st_num = '20220002';

UPDATE tbl_student 
SET st_tel = '010-111-2222'
WHERE st_num = '20220003';

COMMIT;