use tabledb;
drop table if exists usertbl2, buytbl2;
create table usertbl2 (
	userID char(8) not null primary key,
    userName varchar(10) not null,
    birthYear int not null
    );
create table buytbl2 (
	num int auto_increment not null primary key,
    userID char(8) not null,
    prodName char(6) not null,
    foreign key (userID) references usertbl (userID)
    );