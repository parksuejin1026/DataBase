drop database if exists tableDB;
create database tableDB;
use tableDB;
drop table if exists userTBL;
create table userTBL (
	userID char(8) not null primary key,
    userName varchar(10) not null,
    birthYear int not null,
    addr char(2) not null,
    mobile1 char(4) null,
    mobile2 char(8) null,
    height smallint null,
    mDate date null
    );
    drop table if exists buyTBL;
create table buyTBL (
	num int auto_increment not null primary key,
    userID char(8) not null,
    prodName char(6) not null,
    groupName char(4) null,
    price int not null,
    amount smallint not null,
    foreign key(userID) references userTBL(userID)
    );
    
    