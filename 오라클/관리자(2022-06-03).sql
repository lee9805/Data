--관리자 접속화면

--tableSapce : 새로운 프로젝트를 만들때 프로젝트의 데이터가 저장될 파일 생성
--naverDb 이름으로 초기 용량은 1MB 씩 자동증가
--naverdb.dbf 팡일 저장하라
CREATE TABLESPACE naverDB
DATAFILE 'C:/oraclexe/data/naverDB.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

--사용자 등록
--사용자 등록할때 DEFALT Tablespace 를 지정하지 않으면
--system tablespace 에 데이터를 저장하게 되어 문제가 될수 있다
CREATE USER bookuser IDENTIFIED BY 12341234
DEFAULT TABLESPACE naverDB;


GRANT DBA TO bookuser;
