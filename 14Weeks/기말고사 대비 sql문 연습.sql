drop database if exists cookdb;
create database cookdb;
use cookdb;
drop table if exists membertbl, producttbl;
create table membertbl (
	memberID char(20) primary key, -- primary key를 기준으로 열(index)가 생성된다. 오름차순으로
    memberName char(5) not null,
    memberAddress char(20)
	);

create table producttbl (
	productName char(4) primary key, -- primary key를 기준으로 열(index)가 생성된다. 오름차순으로
    -- memberID char(8) not null,
    cost int not null,
    makeDate date,
    company char(5),
    amount int not null
	/* 제약조건 설정하기 (FK KEY) 
    constraint FK_KEY
    foreign key (memberID)
    references membertbl(memberID) */
    );
    
-- membertbl에 insert 문 입력하기
insert into membertbl values ('Thomas', '토마스', '경기 부천');
insert into membertbl values ('Binary', '이진수', '인천 중구');
insert into membertbl values ('Chalie', '찰리', '경기 안산');
insert into membertbl values ('Diana', '다이애나', '경기 성남');
insert into membertbl values ('Katarina', '카타리나', '녹서스');
insert into membertbl values ('Son', '손흥민', '한국');
insert into membertbl values ('Ronaldo', '호날두', '포르투갈');
select * from membertbl; 

-- producttbl에 insert 문 입력하기
insert into producttbl values('냉장고', 2500000, "2019-07-01", '삼성', 10);
insert into producttbl values('모니터', 350000, "2019-07-01", '삼성', 34);
insert into producttbl values('의자', 1500000, "2019-07-01", '삼성', 100);
insert into producttbl values('자전거', 600000, "2019-07-01", '삼성', 23);
insert into producttbl values('경량패딩', 250000, "2019-07-01", '삼성', 25);
insert into producttbl values('에어팟', 350000, "2019-07-01", '삼성', 30);
insert into producttbl values('핸드폰', 1500000, "2019-07-01", '삼성', 1000);
insert into producttbl values('태블릿', 700000, "2019-07-01", '삼성', 30);
select * from producttbl;

-- select 조회문 작성
select * from membertbl where memberName = "토마스";

-- view : 가상의 테이블, 실체가 없고 진짜 테이블에 연결된 개념
create view uv_membertbl as select mamberName, memberAddress from membertbl;