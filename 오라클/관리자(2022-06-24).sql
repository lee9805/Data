CREATE TABLESPACE memoDB
datafile 'C:/oraclexe/data/memo.dbf'
size 1m AUTOEXTEND on next 1k;

create user memoDB IDENTIFIED BY 12341234
default tablespace memoDB;

GRANT DBA to memoDB;