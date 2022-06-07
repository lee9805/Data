-- 여기는 root 화면
-- root는  oracle 의 sys와 같은 역할
/*
mySQL 사용자와 DB(data 저장소) 의 관계가 연결 아니다
오라클에서는 사용자에게 ddefalt Table Space 지정하여 
login(접속)을 하면 자동으로 기본 DB 가 연결된다

사용자는 단순히 DB 서버에 접속하는 권한을 부여받을 뿐이고
어떤 DB를 사용할것인지는 처음 시작할때 연결을 해줘야 한다
*/
-- DB 저장소 생성
create database myDB;

-- 일반 사용자 생성
-- MySQL 은 전통적으로 root 사용자로 접속하여 DB관리한다
-- 최근추세는 root 사용자는 DB, USER 생성만을 담당하고
-- DB 관리는 일반 사용자등 생성하여 실행하도록 권장한다
-- MySQL 은 사용자를 생성할때 어떤 방법으로 접속할 것인지를 명시해야 한다
-- lee98 사용자는 localhost 에서만 mySQL 서버에 접속할수 있다
drop user 'lee98'@'localhost';
create user 'lee98'@'localhost' 
identified by '!Korea8080';

/*
MySQL 은 사용자를 등록화면
그 사용자는 DBA 권한을 기본적으로 갖는다
MySQL 은 실무에서 가장 많이 사용하는 버전이 5.7.x 이다
5.7 버전은 사용자 등록과 동시에 DB 관련된 명령을 대부분 사용할수 있다
8.x 버전은 사용자 권한이 조금더 엄격해졌다

새로 등록한 사용자에게 DB 에 접근할수 있는 권한 부여하기
lee98@localhost 사용자에게myDB Schema 에 접근하여
모든 DML 명령을 수핼할수 있는 권한을 부여하겠다
*/
grant all privileges on myDB.* 
to 'lee98'@'localhost';

create user'user1'@'127.0.0.1' 
identified by '!Korea8080';

-- user1은 모든 DB Schema 에 접근 권한 부여
grant all privileges on *.*
to 'user1'@'127.0.0.1';

-- 어디에서나 접속할수 있도록 범위를 지정하지 않는 사용자 등록
create user 'user2'@'*'
identified by '!Korea8080';







