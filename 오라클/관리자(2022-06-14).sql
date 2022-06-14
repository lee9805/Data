-- 관리자 화면
-- selfit 데이터 저장 공간 생성

create TABLESPACE selfitDB
DATAFILE 'C:/oraclexe/data/selfit.dbf'
size 1m AUTOEXTEND on next 1k;

create user selfit IDENTIFIED by selfit
DEFAULT TABLESPACE selfitDB;

GRANT dba to selfit;

DROP TABLESPACE selfitDB;
DROP USER selfit;