drop database if exists cookdb2; -- 만약 cookdb가 존재하면 먼저 삭제해줘. 
create database cookdb2; -- cookdb 만들어줘.
-- usertbl 만들기
use cookdb2;     -- cookdb를 사용하자.
create table usertbl  -- usertbl을 만들어 줘
(userId char(8) not null primary key, -- 사용자 아이디 항목(기본키)
 userName varchar(10) not null,       -- 이름 항목
 birthYear int        not null,       -- 출생년도 
 addr      char(2)    not null,       -- 지역(서울, 경기, 인천, 충청, 경상, 전라, 등등)
 mobile1   char(3),                   -- 휴대폰(010, 011~ ) 
 mobile2   char(8),                   -- 휴대폰 나머지 번호
 height    smallint,                  -- 키
 mDate     date      default (current_date)                  -- 회원 가입일 
);

select * from usertbl; 
-- buytbl 만들기 
drop table if exists buytbl;
create table buytbl 
( num       int auto_increment not null primary key,   -- 번호 자동으로 1씩 증가 (PK) 
  userid    char(8) not null,                       -- 사용자 아이디 (FK) 
  prodName  char(6) not null,                     -- 물품
  groupName char(4),                             -- 분류
  price     int not null,                        -- 가격
  amount    smallint not null,                      -- 수량
  foreign key(userid) references usertbl(userid) 
); 
SET SESSION auto_increment_increment=1;
-- usertbl insert문
-- 본인이름 추가하세요.
insert into usertbl values ('PSJ','박수진',2002,'경기','010','99433932',185, default);
insert into usertbl values ('CJH','조준혁',2004,'서울','010','12345677',173, default);
insert into usertbl values ('CJO','최준오',2003,'경기','010','12344444',173, default);
insert into usertbl values ("YJS", "유재석", 1972, "서울", "010","11111111", 178, "2008.8.8"),("KHD","강호동",1970,"경북","011","22222222",182,"2007.7.7"),('KKJ','김국진',1965,'서울','019','33333333',171,'2009.9.9'),('KYM','김용만',1967,'서울','010','44444444',171,'2015.5.5'),('KJD','김제동',1974,'경남',null,null,173,'2013.3.3'),('NHS','남희석',1971,'충남','016','66666666',180,'2017.4.4'),('SDY','신동엽',1971,'경기',null,null,176,'2008.10.10'),('LHJ','이휘재',1972,'경기','011','88888888',180,'2006.4.4'),('LKK','이경규',1960,'경남','018','99999999',170,'2004.12.12'),('PSH','박수홍',1970,'서울','010','00000000',183,'2012.5.5');
insert into usertbl (userId, username, birthYear,addr, mobile1, mobile2, height) values('key2', 'key', 2000, '서울', '010', '1111111', 165); 
select * from usertbl; 
-- buytbl insert문 

insert into buytbl(userid,prodName,groupName,price,amount)
			values	("KHD","운동화",null,30,2),
					("KHD","노트북","전자",1000,1),
					("KYM","모니터","전자",200,1),
                    ("PSH","모니터","전자",200,5),
                    ("KHD","청바지","의류",50,3),
                    ("PSH","메모리","전자",80,10),
                    ("KJD","책","서적",15,5),
                    ("LHJ","책","서적",15,2),
                    ("LHJ","청바지","의류",50,1),
                    ("PSH","운동화",null,30,2),
                    ("LHJ","책","서적",15,1),
                    ("PSH","운동화",null,30,2);
-- 본인 구매내역 추가하세요.
insert into buytbl values (default, "PSJ","폭스바겐","자동차",500000000,1);

select * from buytbl; 



-- 2000년생 이후만 테이블 testtbl33 에 삽입하세요
create table testtbl33 (select userId,userName,birthyear from usertbl where birthyear >= 2000);
select * from testtbl33;

update usertbl
set birthYear = 1980
where userid = "key2";
update usertbl
set addr = "구로", mobile2 = "12345678"
where userId= "yjs";
select * from usertbl;
-- KHD - > 이름을 최호동으로 변경
update usertbl
set userName = "최호동"
where userId = "KHD";

select * from usertbl 
where userName = "최호동";

use cookdb2;
-- khd 삭제
DELETE FROM buytbl 
WHERE userid = "KHD";
delete from usertbl
where userId = "KHD";

-- 함수 사용해서 키가 큰 순으로 정렬하기 
use cookdb2;
select row_number() over(order by height desc)
"키큰순위",username, addr, heights
from usertbl;