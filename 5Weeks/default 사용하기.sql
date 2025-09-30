drop table if exists usertbl2;
create table usertbl2 (
	userID 		char(8) 	not null primary key,
    userName    varchar(10) not null,
	birthYear   int 		not null default -1,
    addr 		char(2) 	not null default '서울',
    mobile1 	char(3) 	null,
    mobile2 	char(8) 	null,
    height 		smallint 	null 	default 170,
    mDate 		datetime     	null 	default current_timestamp -- datetime에 current_timestamp를 사용하면 등록한 시간이 자동으로 입력됨 
    );