use cookdb;
select * from buytbl;
select * from usertbl;
create table buytbl2 (select * from buytbl); # buy table 2 라는 테이블을 buy table의 내용으로 복사하기
select * from buytbl2; # buy table 2 잘 만들어졌는지 보기
--
create table buytbl33 (select userid, prodname from buytbl);
select * from buytbl33;
--
use cookdb;
select userID,amount from buytbl order by userID;
-- 같은 아이디끼리 group by 절로 묶은 후 sum() 함수로 구매 개수를 합치는 방식
select userID, sum(amount) from buytbl group by userID;
-- 별칭을 사용하여 열 일므을 이해하기 좋게 변경
select userID as '사용자 아이디', sum(amount) as '총 구매 개수' from buytbl group by userID;
-- 구매액의 총합
select userID as '사용자 아이디', sum(price * amount) as '총 구매액' from buytbl group by userID; 
-- 전체적으로 한 번 구매할 때마다 평균 몇 개를 구매했는지 조회
select avg(amount) as '평균 구매 개수' from buytbl;
-- 회원별로 한 번 구매할 때마다 평균적으로 몇 개를 구매했는지 조회(group by 절 사용)
select userID,avg(amount) as '평균 구매 개수' from buytbl group by userID;
-- 가장 키가 큰 회원과 가장 키가 작은 회원의 이름과 키 출력
select userName, max(height), min(height) from usertbl;
-- group 절 활용
select userName, max(height), min(height) from usertbl group by userName;
-- 서브쿼리와 조합하여 다시 실행
select userName, height from usertbl where height = (select max(height) from usertbl) or height = (select min(height) from usertbl);
-- 휴대폰이 있는 회원 수
select count(*) from usertbl;
-- 휴대폰이 있는 회원만 구하기
select count(mobile1) as '휴대폰이 있는 사용자' from usertbl;
-- 물품(prodName) 별로 총 판매한 갯수를 구하시오. prodName, 총판매갯수 출력
select prodName, sum(amount) as '총 구매갯수' from buytbl group by prodName;
-- 지역(addr)별로 몇명이 사는 지 구하시오. addr, 집계함수
select addr, count(*) as "합계명수" from usertbl group by addr;
