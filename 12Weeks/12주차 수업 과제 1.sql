# 2025-11-25 데이터베이스 12주차 수업
drop database if exists cookdb;
create database cookdb;
use cookdb;
drop table if exists stdtbl, stdclubtbl, clubtbl;
create table stdtbl (
	stdName varchar(10) not null primary key,
    addr char(4) not null
    );

create table clubtbl (
	clubName varchar(10) not null primary key,
    roomNo char(4) not null
    );
    
create table stdclubtbl (
	userID int not null auto_increment primary key,
    stdName varchar(10) not null,
    clubName varchar(10) not null,
    foreign key(stdName) references stdtbl(stdName),
    foreign key(clubName) references clubtbl(clubName)
    );
    
insert into stdtbl values ('강호동','경북'),('김제동','경남'),('김용만','서울'),('이휘재','경기'),('박수홍','경남');
insert into clubtbl values ('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');
insert into stdclubtbl values (null,'강호동','바둑'),(null,'강호동','축구'),(null,'김용만','축구'),(null,'이휘재','축구'),(null,'이휘재','봉사'),(null,'박수홍','봉사');

select * from stdtbl;
select * from clubtbl;
select * from  stdclubtbl;

# 3개의 테이블 내부 조인 써서 출력
select S.stdName, S.addr, C.clubName, C.roomNo
	from stdtbl S
		inner join stdclubtbl SC
			on S.stdName = SC.stdName
		inner join clubtbl C
			on SC.clubName = C.clubName
	order by S.stdName;

# where 절을 써서 3개 테이블 출력 하는 방법
select S.stdName, S.addr, C.clubName, C.roomNo
from stdtbl S, stdclubtbl SC, clubtbl C # PK와 FK를 연결 
where S.stdName = SC.stdName and SC.clubName = C.clubName
order by S.stdName;

# 동아리를 기준으로 정렬
select C.clubName, C.roomNo, S.stdName, S.addr
from stdtbl S
	inner join stdclubtbl SC
		on S.stdName = SC.stdName
	inner join clubtbl C
		on C.clubName = SC.clubName
	order by C.clubName;
    
# 전체 회원의 구매 기록을 출력하되 구매 기록이 없는 회원도 출력 malldb로 새로 만듦
use malldb;
select U.userId, U.userName, B.prodName, U.addr, concat(U.mobile1, U.mobile2) as '연락처'
	from usertbl U
		left outer join buytbl B
			on U.userID = B.userID
	order by U.userID;
    
# 물건을 한 번도 구매한 적 없는 회원의 목록 출력
select U.userID, U.userName, B.prodName, U.addr, concat(U.mobile1, U.mobile2) as '연락처'
	from usertbl U # 첫번째 테이블
		left outer join buytbl B # 두번째 테이블 
			on U.userID = B.userID # 두개의 테이블을 조인할 조건 
	where B.prodName is null
    order by U.userId;
    
# 외부 조인을 수행하여 동아리에 가입하지 않은 학생도 출력
select S.stdName, S.addr, C.clubName, C.roomNo
	from stdtbl S
		left outer join stdclubtbl SC
			on S.stdName = SC.stdName
		left outer join clubtbl C
			on SC.clubName = C.clubName
	order by S.stdName;

# 동아리를 기준으로 가입 학생을 출력하되, 가입 학생이 한 명도 없는 동아리도 출력
select C.clubName, C.roomNo, S.stdName, S.addr
	from stdtbl S
		left outer join stdclubtbl SC # stdtbl과 stdclubtbl을 기준으로 left 사용 모든 학생의 정보 획득을 위해서 사용
			on SC.stdName = S.stdName  
		right outer join clubtbl C # stdclubtbl과 clubtbl을 기준으로 right 사용 모든 동아리의 정보 획득을 위해서 사용
			on SC.clubName = C.clubName 
	order by C.clubName;
    
# UNION 사용하기 두 쿼리의 결과를 행으로 합치는 연산자
# 동아리에 가입하지 않은 학생도 출력하고 학생이 한 명도 없는 동아리도 출력하기
select S.stdName, S.addr, C.clubName, C.roomNo
	from stdtbl S 
		left outer join stdclubtbl SC # 모든 학생의 정보
			on S.stdName = SC.stdName
		left outer join clubtbl C # 동아리를 가입하지 않은 학생도 출력
			on SC.clubName = C.clubName
union
select S.stdName, S.addr, C.clubName, C.roomNo
	from stdtbl S
		left outer join stdclubtbl SC
			on SC.stdName = S.stdName
		right outer join clubtbl C
			on SC.clubName = C.clubName;
            
# 물건을 한 번도 구매한 적이 없는 회원 목록 유저 ID순으로 정렬해서 출력
select U.userID, U.userName, B.prodName, U.addr, concat(U.mobile1, U.mobile2) as "휴대폰"	
	from usertbl U
		left outer join buytbl B
			on U.userId = B.userID;
            
            
USE cookDB;
CREATE TABLE empTBL(emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));

INSERT INTO empTBL VALUES ('나사장', NULL, '0000');
INSERT INTO empTBL VALUES ('김재무', '나사장', '2222');
INSERT INTO empTBL VALUES ('김부장', '김재무', '2222-1');
INSERT INTO empTBL VALUES ('이부장', '김재무', '2222-2');
INSERT INTO empTBL VALUES ('우대리', '이부장', '2222-2-1');
INSERT INTO empTBL VALUES ('지사원', '이부장', '2222-2-2');
INSERT INTO empTBL VALUES ('이영업', '나사장', '1111');
INSERT INTO empTBL VALUES ('한과장', '이영업', '1111-1');
INSERT INTO empTBL VALUES ('최정보', '나사장', '3333');
INSERT INTO empTBL VALUES ('윤차장', '최정보', '3333-1');
INSERT INTO empTBL VALUES ('이주임', '윤차장', '3333-1-1');

# 우대리 상관의 구내 번호 확인
select A.emp as '부하직원', B.emp as '직속상관', B.emptel as '직속상관연락처'
	from emptbl A
		inner join emptbl B
			on A.manager = B.emp
	where A.emp = '우대리';

# not in 첫 번째 쿼리의 결과 중에서 두 번째 쿼리에 해당하는 것을 제외하고 출력
# cookdb의 사용자를 모두 출력하되 전화번호가 없는 사람을 제외한다.
select userName, concat(mobile1, '-', mobile2) as '전화번호' from usertbl
	where userName not in (select userName from usertbl where mobile1 is null); # mobile1이 null 상태면 출력에 포함하지 않는다.
    
# 전화번호가 없는 사람만 조회
select userName, concat(mobile1, '-', mobile2) as '전화번호' from usertbl
	where userName in (select userName from usertbl where mobile1 is null);

	