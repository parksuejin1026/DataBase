use tabledb;
drop table if exists buytbl2;
create table buytbl2 (
	num int auto_increment not null primary key,
    userID char(8) not null,
    prodName char(6) not null,
    foreign key (userID) references usertbl (userID)
    );
    
/*drop table if exists buytbl2;
create table buytbl2 (
	num int auto_increment not null primary key,
    userID char(8) not null,
    prodName char(6) not null
    );
alter table buytbl2
	add constraint fk1
    foreign key (userID) references usertbl2 (userID);
*/