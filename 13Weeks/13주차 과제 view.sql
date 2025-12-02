# 2025-12-2 13주차 view 생성

drop database if exists cookdb;
create database cookdb; -- cookdb 만들어줘.
-- usertbl 만들기
use cookdb;     -- cookdb를 사용하자.
create table usertbl  -- usertbl을 만들어 줘
(userId char(8) not null primary key, -- 사용자 아이디 항목(기본키)
 userName varchar(10) not null,       -- 이름 항목
 birthYear int        not null,       -- 출생년도 
 addr      char(2)    not null,       -- 지역(서울, 경기, 인천, 충청, 경상, 전라, 등등)
 mobile1   char(3),                   -- 휴대폰(010, 011~ ) 
 mobile2   char(8),                   -- 휴대폰 나머지 번호
 height    smallint,                  -- 키
 mDate     date                       -- 회원 가입일 
);
-- buytbl 만들기 
create table buytbl 
( num       int auto_increment not null primary key,   -- 번호 자동으로 1씩 증가 (PK) 
  userid    char(8) not null,                       -- 사용자 아이디 (FK) 
  prodName  char(6) not null,                     -- 물품
  groupName char(4),                             -- 분류
  price     int not null,                        -- 가격
  amount    smallint not null,                      -- 수량
  foreign key(userid) references usertbl(userid) 
); 

use cookdb;     -- cookdb를 사용하자.
insert   into   usertbl  values('kym', '김용만', 1967, '서울', '010', '44444444', 177, '2015-5-5');
INSERT INTO userTBL VALUES ('YJS', '유재석', 1972, '서울', '010', '11111111', 178, '2008-8-8');
INSERT INTO userTBL VALUES ('KHD', '강호동', 1970, '경북', '011', '22222222', 182, '2007-7-7');
INSERT INTO userTBL VALUES ('KKJ', '김국진', 1965, '서울', '019', '33333333', 171, '2009-9-9');
INSERT INTO userTBL VALUES ('KJD', '김제동', 1974, '경남', null, null, 173, '2013-3-3');
INSERT INTO userTBL VALUES ('NHS', '남희석', 1971, '충남', '016', '66666666', 180, '2017-4-4');
INSERT INTO userTBL VALUES ('SDY', '신동엽', 1971, '경기', NULL, NULL, 176, '2008-10-10');
INSERT INTO userTBL VALUES ('LHJ', '이휘재', 1972, '경기', '011', '88888888', 180, '2006-4-4');
INSERT INTO userTBL VALUES ('LKK', '이경규', 1960, '경남', '018', '99999999', 170, '2004-12-12');
INSERT INTO userTBL VALUES ('PSH', '박수홍', 1970, '서울', '010', '00000000', 183, '2012-5-5');
select * from usertbl; 

INSERT INTO buyTBL VALUES (NULL, 'KHD', '운동화', NULL, 30, 2);
INSERT INTO buyTBL VALUES (NULL, 'KHD', '노트북', '전자', 1000, 1);
INSERT INTO buyTBL VALUES (NULL, 'KYM', '모니터', '전자', 200, 1);
INSERT INTO buyTBL VALUES (NULL, 'PSH', '모니터', '전자', 200, 5);
INSERT INTO buyTBL VALUES (NULL, 'KHD', '청바지', '의류', 50, 3);
INSERT INTO buyTBL VALUES (NULL, 'PSH', '메모리', '전자', 80, 10);
INSERT INTO buyTBL VALUES (NULL, 'KJD', '책', '서적', 15, 5);
INSERT INTO buyTBL VALUES (NULL, 'LHJ', '책', '서적', 15, 2);
INSERT INTO buyTBL VALUES (NULL, 'LHJ', '청바지', '의류', 50, 1);
INSERT INTO buyTBL VALUES (NULL, 'PSH', '운동화', NULL, 30, 2);
INSERT INTO buyTBL VALUES (NULL, 'LHJ', '책', '서적', 15, 1);
INSERT INTO buyTBL VALUES (NULL, 'PSH', '운동화', NULL, 30, 2);
select * from buytbl; 

use cookdb;
-- view 만들기
create view v_usertbl
as
	select userID, userName, addr
    from usertbl;
--
select * from v_usertbl;
-- 강호동 구매 목록 2개 테이블 조인
select U.userID, U.username, B.prodname, U.addr, concat(U.mobile1,"-", U.mobile2) as "연락처"
from usertbl U, buytbl B
where U.userID = B.userID and U.userName = "강호동";

-- View 생성
create view v_userbuytbl
as
select U.userID, U.username, B.prodname, U.addr, concat(U.mobile1,"-", U.mobile2) as "연락처"
from usertbl U, buytbl B
where U.userID = B.userID;

-- View 강호동 구매 목록
select * from v_userbuytbl
where username = "강호동";

-- ALTER VIEW 문 사용하여 뷰 수정
alter view v_userbuytbl
as 
select U.userID as "사용자 아이디", U.userName as "이름", B.prodName as "제품 이름", U.addr, concat(U.mobile1, U.mobile2) as '전화번호'	from usertbl U 
		inner join buytbl B 
			on U.userID = B.userID;
            
select `이름`,`전화번호` from v_userbuytbl;

drop view v_userbuytbl;

-- 뷰의 장점 알기
-- 뷰를 수정할때는 alter
-- 뷰를 삭제할때는 drop