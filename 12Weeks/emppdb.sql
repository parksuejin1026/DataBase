/* 25.11.04 SQL이용해서 
	1.데이테베이스만들기, 
	2.테이블만들기
*/ 
-- 1.데이터베이스 만들기
drop   database  if exists emppDB;
create database emppDB;
-- 사용할 데이터베이스를 지정해줘
use emppDB; 
-- 2.테이블만들기
drop    table if exists deptTBL, empTBL; 
-- 부서테이블(deptTBL)
create  table deptTBL  ( 
	deptno     int         not null  primary key, -- 부서번호
    dname      varchar(14) not null,    -- 부서명 
    loc        varchar(14) not null    -- 부서위치
); 
-- 직원테이블(empTBL)
create  table  empTBL (    
	empno      int         not null  primary key,  -- 직원번호
    ename     varchar(14)     not null, 
    job       varchar(14)     not null,
    mgr        int,
    hiredate   date        not null,  -- 반드시 필요(not null) 
    sal       int ,    -- 월급 급여
    comm       int,    -- 보너스
    deptno     int,     
    foreign key (deptno)   references deptTBL(deptno)    
); 
    
use emppdb; 
-- DEPT DML
insert into deptTBL values(10, 'ACCOUNTING', 'NEW YORK');
insert into deptTBL values(20, 'RESEARCH', 'DALLAS');
insert into deptTBL values(30, 'SALES', 'CHICAGO');
insert into deptTBL values(40, 'OPERATIONS', 'BOSTON');
---------------------------------------------------------------------------------------------

-- EMP DML
insert into empTBL values( 7839, 'KING', 'PRESIDENT', null, '1996-11-17', 5000, null, 10);
insert into empTBL values( 7698, 'BLAKE', 'MANAGER', 7839, '1991-1-05', 2850, null, 30);
insert into empTBL values( 7782, 'CLARK', 'MANAGER', 7839, '1999-9-06', 2450, null, 10);
insert into empTBL values( 7566, 'JONES', 'MANAGER', 7839, '2001-02-04', 2975, null, 20);
insert into empTBL values( 7788, 'SCOTT', 'ANALYST', 7566, '2003-06-17', 3000, null, 20);
insert into empTBL values( 7902, 'FORD', 'ANALYST', 7566, '1981-03-12', 3000, null, 20);
insert into empTBL values( 7369, 'SMITH', 'CLERK', 7902, '2007-12-1', 800, null, 20);
insert into empTBL values( 7499, 'ALLEN', 'SALESMAN', 7698, '1981-2-2', 1600, 300, 30);
insert into empTBL values( 7521, 'WARD', 'SALESMAN', 7698, '1981-2-1', 1250, 500, 30);
insert into empTBL values( 7654, 'MARTIN', 'SALESMAN', 7698, '1981-9-28', 1250, 1400, 30);
insert into empTBL values( 7844, 'TURNER', 'SALESMAN', 7698, '1981-8-9', 1500, 0, 30);
insert into empTBL values( 7876, 'ADAMS', 'CLERK', 7788, '1987-7-13',  1100, null, 20);
insert into empTBL values( 7900, 'JAMES', 'CLERK', 7698, '1981-12-3', 950, null, 30);
insert into empTBL values( 7934, 'MILLER', 'CLERK', 7782, '2003-1-23', 1300, null, 10);
    
    
    
    
    