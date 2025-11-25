use emppdb;
# 모든 사원의 이름과, 부서명, 근무지를 출력
select E.ename, D.dname, D.loc
	from depttbl D
		inner join emptbl E
			on D.deptNo = E.deptno;
            
# 급여를 1500이상 받는 사원의 이름과, 부서명, 근무지 출력
select E.ename, D.dname, D.loc
	from depttbl D
		inner join emptbl E
			on D.deptNo = E.deptno
	where E.sal >= 1500;
    
# 셀프 조인 어떤 테이블을 자기 자신과 조인을 해야하는 경우
# 모든 사원의 이름과 사원 매니저 이름을 보이시오.
select A.ename as '사원이름' , B.ename as '매니저'
	from emptbl A
		inner join emptbl B
			on A.mgr = b.empno; # mgr의 번호와 empno가 같은 사람 출력 
            
# DALLAS에 근무하는 사원들의 이름, 부서명, 입사일자를 보이시오.
select E.ename, D.dname, E.hiredate
	from emptbl E, depttbl D
		where E.deptno = D.deptno
         and D.loc = 'DALLAS';
         
# 입사일이 1981년 9월 1일 이전인 사원들의 이름, 부서명, 입사일자를 출력
select E.ename, D.dname, E.hiredate
from emptbl E, depttbl D
where E.deptno = D.deptno
and hiredate < '1981-09-01';

# BLAKE의 부하직원 이름과 급여 정보를 출력
select E.ename, E.sal
from emptbl E, emptbl M
where E.mgr = M.empno
and M.ename = 'BLAKE';

# BLAKE의 부하직원의 이름과 급여, 근무지 정보를 출력
select E.ename, E.sal, D.loc
from emptbl E, emptbl M, depttbl D
where E.mgr = M.empno
and E.deptno = D.deptno
and M.ename = 'BLAKE';

# 직무가 ANALYST인 직원들 중에 최소 급여 이상을 받는 모든 사원의 이름과 입사일자 출력
select ename, hiredate
from emptbl
where sal >= (select min(sal) from emptbl where job = 'ANALYST');