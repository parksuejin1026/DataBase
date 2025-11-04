-- 2025.11.04 9주차 과제
-- select 컬럼명1, 컬럼명2 or *(모든 컬럼 호출) from 테이블명 [where 검색조건];
use emppdb;
-- 직업이 salesman 인 사원의 이름과 연봉을 구하시오
select 	ename, sal 
from 	emptbl
where 	job = 'salesman';
-- 사원의 담당 업무 목록 조회
select distinct job 
from emptbl;
-- scott 사원 정보 조회
select * 
from emptbl 
where ename = 'scott';
-- 입사일자가 1981년 9월 1일 이후인 사원들의 이름과 입사일자
select ename, hiredate
from emptbl
where hiredate >= '1981-09-01';
-- 입사일자가 1981년 9월 1일 이후이고 급여가 1500 이상인 사원들의 이름과 입사일자 급여를 보이시오
select ename, hiredate, sal
from emptbl
where hiredate >= '1981-09-01' and sal >= 1500 ;
-- 모든 부서의 이름 조회
select dname 
from depttbl;
-- note1 . 자주하는 실수
-- where job = 'saleman' or 'analyst'; (x)
-- where job = 'saleman' or job = 'analyst'; (o)
select ename, hiredate, sal
from emptbl
where (hiredate >= '1981-09-01') and (sal >= 1500) ; -- 괄호로 묶어주면 조건 파악이 쉬워져 가독성을 높일 수 있다.
-- 커미션(보너스)를 받는 사원의 이름과 커미션 값을 보이시오.
select ename, comm
from emptbl
where comm is not null;
-- 커미션(보너스)갑이 NULL인 사원의 이름
select ename
from emptbl
where comm is null;
-- sales 부서는 어느 지역에 있는가?
select loc
from depttbl
where dname = 'sales';
-- 사원번호가7369인사원의이름, 연봉, 담당업무를보이시오.
select ename, sal, job
from emptbl
where empno = 7369;
-- 입사일자가 1981년 3월 1일 이전인 사원의 이름과 입사일자를 보이시오.
select ename, hiredate
from emptbl
where hiredate < '1981-03-01';
-- 연봉이 1000~2000 사이인 사원의 이름과 연봉
select ename, sal
from emptbl
where (sal >= 1000) and (sal <= 2000); -- 괄호로 묶어주면 좋음
-- where sal between 1000 and 2000; 똑같음

-- 연봉이 1000~2000 사이가 아닌 사원의 이름과 연봉을 보이시오.
select ename, sal
from emptbl
where sal not between 1000 and 2000;
-- 담당 업무가‘CLERK’, ‘ANALYST’, ‘MANAGER’ 중의하나인사원의이름과, 담당업무, 연봉을보이시오. 
select ename, job, sal
from emptbl
where jon in ('clerk','analyst','manager');
-- 담당업무가‘CLERK’, ‘ANALYST’, ‘MANAGER’가아닌사원의이름과, 담당업무, 연봉을보이시오. 
select ename, job, sal
from emptbl
where jon not in ('clerk','analyst','manager');
-- 이름이 'A'로 시작하는 사원의 이름과 담당 업무
select ename, job
from emptbl
where ename like 'A%';
-- 이름의 세번째 글자가 'A'인 사원의 이름과 담당업무
select ename, job
from emptbl
where ename like '__A%';
-- 현재 사원의 수 구하기
select count(*)
from emptbl;
-- 담당업무가 'salesman' 사원의 수는 모두 몇 명인지 조회
select count(*)
from emptbl
where job = 'salesman';
-- 질의 결과에 나오는 컬럼 이름 바꾸기 AS
select count(*) as cnt_salesman
from emptbl
where job = 'salesman';
-- 급여를 가장 많이 받는 사원
select max(sal)
from emptbl;
-- 담당업무가 'salesman' 사원 중 급여 가장 높은 사람
select max(sal)
from emptbl
where job = 'salsman';
-- 입사한 지 제일 오래된 사람
select min(hiredate)
from emptbl;
-- 가장 많은 급여, 가장 적은 급여, 그리고 두 급여의 차이 조회
select max(sal), min(sal), max(sal)-min(sal)
from emptbl;
-- 사원들의 평균 급여액
select avg(sal)
from emptbl;
-- 사원들의 평균 커미션(보너스)을 조회
select avg(comm)
from emptbl;
-- 사원들의 급여액 합계를 조회
select sum(sal)
from emptbl;
-- 담당업무가 'analyst'인 사원들의 급여액 합계
select sum(sal)
from emp
where job = 'analyst';
-- 담당업무가 'analyst'인 사원들의 이름, 급여와 10% 인상된 급여를 조회
select ename, sal, sal * 1.1
from emptbl
where job = 'analyst';
-- 사원들의 이름, 급여, 커미션(보너스), 급여 + 커미션 조회
select ename, sal, comm, sal + comm
from emptbl;
-- 정렬 ORDER BY
-- 담당업무가 'salesman'인 사원의 대해 입사일자가 빠른 순으로 사원의 이름, 입사일자 조회
select ename, hiredate
from emptbl
where job = 'salesman'
order by hiredate; -- 디폴드값 asc 오름차순임 아래에서 위로
-- 담당업무가 'salesman'인 사원에 대해 연봉이 많은 순으로 사원의 이름과 연봉을 조회
select ename, sal
from emptbl
where job = 'salesman'
order by sal desc;
-- 모든 사원의 부서번호, 이름, 담당업무를 보이되 부서번호 순으로 정령하여 조회, 같은 부서안에서는 이름 알파벳 순으로 정렬
select deptno, ename, job
from emptbl
order by deptno, ename;
-- GROUP BY 그룹으로 묶어서 조회
-- 각 부서번호별 사원의 수를 조회
select deptno, count(*) as cnt_emp
from emptbl
group by deptno;
-- 각 부서번호별 평균 연봉
select deptno, avg(sal) as avg_sal
from emptbl
group by deptno;
-- 소수점이하 자리수 조정하기
select deptno, round(avg(sal),2) as avg_sal
from emptbl
group by deptno;
-- 각 부서변호별 사원의 수 구하기. 단 사원의 수가 5명 이상인 부서만
select deptno, count(*) as cnt_emp
from emp
group by deptno
having count(*) >= 5;
-- 각 부서변호별 사원의 수 구하기. 단 사원의 수가 5명 이상인 부서만 보이되 사원 수가 많은 순으로
select deptno, count(*) as cnt_emp
from emp
group by deptno
having count(*) >= 5
order by count(*) desc;
-- 각 부서번호별로 급여를 1000이상 받는 사원의 수를 구하시오. 단 사원의 수가 4명 이상인 부서만 보이되 사원 수가 많은 순으로 조회
select deptno, count(*) as cnt_emp
from emptbl
where sal >= 1000
group by deptno
having count(*) >= 4
order by count(*) desc;