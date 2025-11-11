drop database if exists db251111;
create database DB251111; # 데이터베이스 생성
use DB251111;
drop table if exists testtbl1;
create table testtbl1 (
	id 			int 			primary key, 
	userName 	varchar(10), 
    age 		int
    );
# 삽입 insert 문
insert into testtbl1 values (1, "뽀로로", 16); # 모든 항목 입력
insert into testtbl1 values (2, "크롱", 0); 
insert into testtbl1 values (3, "루피", 14); 
insert into testtbl1 (id, userName) values (4);
insert into testtbl1 (id, age) 		values (5, 45);
# 검색, 조회, select
select * from testtbl1;
# auto_increment 사용
use DB251111;
create table testtbl22 (
	id 			int 		auto_increment 	primary key,
    userName 	varchar(10),
    age 		int 		default 0
    );
insert into testtbl22 values (null, "에디", 15);
insert into testtbl22 values (null, "포비", 12);
insert into testtbl22 values (null, "통통이", 11);
insert into testtbl22 values (null, "뽀로로", 16); # 모든 항목 입력
insert into testtbl22 values (null, "크롱", 0); 
insert into testtbl22 values (null, "루피", 14); 
alter table testtbl22 auto_increment = 100;
set @@auto_increment_increment = 5;
insert into testtbl22 values (null, "우디", 20);
insert into testtbl22 values (null, "버즈", 18);
insert into testtbl22 values (null, "제시", 19);

select * from testtbl22;
