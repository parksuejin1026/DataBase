
use tableDB;
drop table if exists userTBL;
create table userTBL (
	userID char(8) not null,
    userName varchar(10) not null,
    birthYear int not null
    );
alter table prodTBL
	add constraint PK1
    primary key (prodCode, proID);

    
drop table if exists prodTBL;
create table prodTBL (
	prodCode char(3) not null,
    prodID char(4) not null,
    prodDate datetime not null,
    prodState char(10) null
    );
alter table prodTBL
add constraint PK1
primary key (prodCode, prodID); -- 기본키(제품코드 + 제품일련번호)