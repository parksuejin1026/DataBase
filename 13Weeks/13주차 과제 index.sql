use cookdb;
create table tbl1
(	a int primary key,
	b int,
    c int
);

show index from tbl1;

create table tbl2
(	a int primary key,
	b int unique,
    c int unique,
    d int
);
show index from tbl2;

create table tbl3
(	a int unique,
	b int unique,
    c int unique,
    d int
);

show index from tbl3;

create table tbl4
( 	a int unique not null,
	b int unique,
    c int unique,
    d int
    );

show index from tbl4;

select * from usertbl;

create database if not exists testdb;
use testdb;
drop table if exists uesrtbl;
create table usertbl
(	userID char(8) not null primary key,
	userName varchar(10) not null,
    birthYear int not null,
    addr char(2) not null
    );


insert into usertbl values('YJS','유재석',1972,'서울');
insert into usertbl values('KHD','강호동',1970,'경북');
insert into usertbl values('KKJ','김국진',1965,'서울');
insert into usertbl values('KYM','김용만',1967,'서울');
insert into usertbl values('KJD','김제동',1974,'경남');
select * from usertbl;

# userID 열의 기본키를 제거하고 userName 열을 기본키로 설정하기
alter table usertbl drop primary key;
alter table usertbl
	add constraint pk_userName primary key (userName);
select * from usertbl;

/* 클러스터형 인덱스의 특징
▪ 인덱스를 생성할 때 데이터 페이지 전체가 다시 정렬됨. 이미 대용량 데이터가 입력된 상태에서 중간에
클러스터형 인덱스를 생성하면 시스템에 심각한 부하를 줄 수 있음
▪ 리프 페이지가 곧 데이터 페이지. 인덱스 자체에 데이터가 포함되어 있음
▪ 보조 인덱스보다 검색 속도가 빠르고 데이터 변경(삽입, 수정, 삭제) 속도는 느림
▪ 클러스터형 인덱스는 테이블에 하나만 생성할 수 있음. 어느 열에 클러스터형 인덱스를 생성하는지에
따라 시스템의 성능이 달라짐
*/
/* 보조 인덱스의 특징
▪ 인덱스를 생성할 때 데이터 페이지는 그대로 둔 상태에서 별도의 페이지에 인덱스를 구성함
▪ 리프 페이지에 데이터가 아니라 데이터가 위치하는 주소 값(RID)이 들어 있음
▪ 데이터 변경(삽입, 수정, 삭제) 시 클러스터형 인덱스보다 성능 부하가 적음
▪ 보조 인덱스는 한 테이블에 여러 개를 생성할 수 있음. 하지만 함부로 남용하면 오히려 시스템의 성능을
떨어뜨리는 결과를 초래할 수 있으므로 필요한 열에만 생성해야 함
*/

-- 보조 index 1번째
create index idx_usertbl_addr
on usertbl(addr);

show index from usertbl;

-- 보조 인덱스 unique 사용
create unique index idx_usertbl_birth
	on usertbl (birthyear); # birthYear는 중복되는 값이 있어서 에러
    
-- 보조 인덱스 2번째 (이미 클러스터형 primary key 인덱스가 존재함)
create unique index idx_utbl_name
	on usertbl(username);
show index from usertbl;

-- 인덱스가 너무 많으면 성능 저하가 생길 수 있음
-- 인덱스 삭제하기
drop index idx_usertbl_addr on usertbl;
drop index idx_usertbl_userName_birthyear on usertbl;
drop index idx_utbl_name on usertbl;

-- 자동으로 생성된 클러스터형 인덱스 삭제
alter table usetbl drop primary key;

-- 인덱스는 열 단위에 생성
-- 데이터 중복도가 높은 열에는 인덱스를 만들어도 효과가 없음
-- 외래키를  설정한 열에는 자동으로 인덱스를 생성하는 것이 좋음
-- 