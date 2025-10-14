drop database if exists cookDB;
create database cookDB;

use cookDB;
create table userTBL
(   userID CHAR(8) not null primary key,
	userName varchar(10) not null,
	birthYear int not null,
    addr char(2) not null,
    mobile1 char(3),
    mobile2 char(8),
    height smallint,
    mDate date
);
create table buyTBL
(	num int auto_increment not null primary key,
	userID char(8) not null,
    prodName char(6) not null,
    groupName char(4),
    price int not null,
    amount smallint not null,
    foreign key (userID) references userTBL (userID)
);