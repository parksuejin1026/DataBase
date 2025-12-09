drop database if exists cookdb; -- 만약 cookdb가 존재하면 먼저 삭제해줘. 
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


-- join이란 2개 이상의 테이블을 묶어서 하나의 결과 테이블을 만드는 것
use cookdb;
-- userID가 KYM인 유저의 모든 정보
select *
	from buytbl 
		inner join usertbl
			on buytbl.userID = usertbl.userID
	where buytbl.userID = 'KYM';

-- 아이디, 이름, 구매 물품, 주소, 연락처만 추출
select U.userID, U.userName, B.prodName, U.addr, concat(U.mobile1, U.mobile2) as 연락처 
	from usertbl U
		inner join buytbl B
			on U.userID = B.userID;
		
-- KYM이라는 아이디를 가진 회원이 구매한 물건과 회원 정보 조인(아이디, 이름, 물품, 주소, 연락처만 출력되게 하고 코드도 간결하게 수정)
select u.userID, u.userName, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as 연락처
	from usertbl u
		inner join buytbl b
			on u.userID = b.userID
				where u.userID = "KYM";
                
-- 회원 테이블(usertbl)을 기준으로 KYM이 구매한 목록 조회
select u.userID, u.userName, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as 연락처
	from usertbl u
		inner join buytbl b
			on u.userID = b.userID
				where u.userID = "KYM";

-- 전체 회원이 구매한 목록 모두 출력 (회원 아이디 순으로 정렬)
select u.userID, u.userName, b.prodName, u.addr
	from usertbl u 
		inner join buytbl b
			on u.userID = b.userID
	order by u.userID;
    
-- 쇼핑몰에서 한 번이라도 구매한 기록이 있는 우수 회원에게 감사의 안내문을 발송하기 위해 조회
select distinct u.userID, u.userName, u.addr
	from usertbl u
		inner join buytbl b
			on u.userID = b.userID # buytbl에 userID가 존재한다는 건 구매한 이력이 있다는 뜻
	order by u.userID;
    
-- exisits 구문을 사용하여 똑같은 결과 만들기
select u.userID, u.userName, u.addr
	from usertbl u
		where exists (
			select *
            from buytbl b
            where u.userID = b.userID);
            
-- 3개의 테이블 내부 조인해보기
USE cookDB;
CREATE TABLE stdTBL
( stdName VARCHAR(10) NOT NULL PRIMARY KEY,
addr CHAR(4) NOT NULL
);
CREATE TABLE clubTBL
( clubName VARCHAR(10) NOT NULL PRIMARY KEY,
roomNo CHAR(4) NOT NULL
);
CREATE TABLE stdclubTBL
( num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
stdName VARCHAR(10) NOT NULL,
clubName VARCHAR(10) NOT NULL,
FOREIGN KEY(stdName) REFERENCES stdTBL(stdName),
FOREIGN KEY(clubName) REFERENCES clubTBL(clubName)
);
INSERT INTO stdTBL VALUES ('강호동', '경북'), ('김제동', '경남'), ('김용만', '서울'), ('이휘 재', '경기'), ('박
수홍', '서울');
INSERT INTO clubTBL VALUES ('수영', '101호'), ('바둑', '102호'), ('축구', '103호'), ('봉사', '104호');
INSERT INTO stdclubTBL VALUES (NULL, '강호동', '바둑'), (NULL, '강호동', '축구'), (NULL, '김용만', '축
구'), (NULL, '이휘재', '축구'), (NULL, '이휘재', '봉사'), (NULL, '박수홍', '봉사');

-- 3개의 테이블 내부 조인
select s.stdName, s.addr, c.clubName, c.roomno
	from stdtbl s # 학생테이블
		inner join stdclutbl sc # 학생동아리테이블
			on s.stdName = sc.stdclubtbl # 학생테이블과, 학생동아리테이블 연결하기
		inner join clubtbl c # 동아리 테이블
			on sc.clubName = c.clubName # 학생동아리 테이블과 동아리 테이블을 연결 학생 테이블은 이미 학생동아리테이블
	order by s.stdName;
    
-- 동아리를 기준으로 가입한 학생의 목록
select c.clubName, c.roomno, s.stdName, s.addr
	from stdtbl s
		inner join stdclubtbl sc
			on s.stdName = sc.stdName
		inner join clubtbl c
			on sc.clubName = c.clubName
		order by c.clubName;
            
-- 내부조인 많이 공부하기, 인덱스, 뷰, 인서트문