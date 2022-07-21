use Mydb;
truncate table tbl_address;
select * from tbl_address;
select count(*) from tbl_address;
delete from tbl_address
where a_seq = 212;

-- 검색 조건이 '' 일때는 LIKE 연산자는 조건이 없는 것으로 인식한다
select * from tbl_address
where a_name like'';

select * from tbl_address
where a_name like concat('%','','%');

select * from(
	select * from tbl_address
	where a_name like concat('%','유','%')
)as sub
limit 200 offset 0;
