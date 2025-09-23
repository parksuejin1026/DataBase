-- 1줄 주석 tableDB 만들기 생성
/* 여러줄 주석
25.09.23 DB만들기, Table 만들기, 20251285, 박수진
*/
-- Database 삭제
drop database if exists tabledb;

create database tableDB;
-- tableDB 지정
use tableDB;
-- table 만들기, 생성
create table userTBL -- 회원 테이블
(   userID char(8), -- 사용자 아이디
	userName varchar(10), -- 이름
    birthYear int, -- 출생연도
    addr char(2), -- 지역
    mobile1 char(3), -- 휴대폰의 국번
    mobile2 char(8), -- 휴대폰의 나머지 전화번호
    height smallint, -- 키
    mDate date -- 회원 가입일
    );
create table buyTBL  -- 구매 테이블
(	num int, -- 순번(PK)
	userID char(8), -- 아이디(FK)
    prodName char(6), -- 물품
    groupName char(4), -- 분류
    price int, -- 단가
    amount smallint -- 수량
    );