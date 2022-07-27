-- 여기는 root 화면
create database schoolDB;
USE schoolDB;

-- 사용자 등록
-- 사용자를 등록할때 @'%' 를 지정하면 원격접속이 가능하다
-- 하지만 원격접속을 허용하면 DB 보안에 매우 취약해 질수 있다
-- 가급적 특별한 경우가 아니면 @'localhost'로 지정하는것이 좋음
create user lee9805@'localhost' identified by '!Korea8080';
-- 사용자에게 schoolDB 에 접근할수 있는 권한 부여
grant all privileges on schoolDB.* to lee9805@'localhost';


-- 현재 root 외 등록된 사용자에게 DB 전체에 대한 권한 부여하기
grant all privileges on *.* to lee98 @'localhost';
-- 권한을 부여한 다음 적용
flush privileges;

