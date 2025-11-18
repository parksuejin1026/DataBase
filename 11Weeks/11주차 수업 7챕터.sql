# CHAPTER 07 데이터 형식과 내장 함수 2025.11.18 (화) 
drop database if exists db251118;
create database db251118;


use cookdb;

# 변수 지정
set @myVar1 = 5;
set @myVar2 = 3;
set @myVar3 = 4.25;
set @myVar4 = 'MC 이름 == > ';

select @myVar1;
select @myVar2 + @myVar3;

select @myVar4, userName from usertbl where height > 180;

# limit에 들어갈 변수를 넣는 쿼리문
set @myVar1 = 3;
prepare myQuery 
	from 'select userName, height from usertbl order by height limit ?'; # ? 가 들어갈 변수
execute myQuery using @myVar1; # using으로 @myVar1 을 사용한다는 의미

# 평균 구매 개수를 구하여 조회하는 쿼리문
select avg(amount) as '평균 구매 개수' from buytbl; 

# cast 함수를 사용하여 변수 타입을 int로 변경!
select cast(avg(amount) as signed integer) as '평균 구매 개수' from buytbl;

# 2의 3제곱, 9의 2제곱근
select pow(2,3), sqrt(9);

# 날짜 또는 시간에서 연, 월, 일, 시, 분, 초, 밀리초를 출력
select year(curdate()), month(current_date()), dayofmonth(current_date);
select hour(current_time()), minute(current_time()), second(current_time),
microsecond(current_time);

#datetime 형식에서 연-월-일과 시:분:초만 추출 
select date(now()), time(now());

# curdate(), curtime(), now(), sysdate() 이 함수들을 제일 많이 씀
# curdate()는 현재 '연-월-일' 반환
# curtime()은 현재 '시:분:초' 반환
# now() 와 sysdate() 는 현재 '연-월-일 시:분:초' 반환
select curdate(), curtime(), now(), sysdate();

# user(), database() 
# 현재 사용자와 현재 선택된 데이터베이스를 반환 

select current_user(), database();

# 키가 180cm 이상인 사람의 이름과 키를 JSON 데이터로 변환
use cookdb;
select json_object('name', userName, 'height', height) as 'JSON 값'
from usertbl
where height >= 180;