select rownum ,sal,empno,ename from (select * from emp order by sal desc) where rownum=2
select *from emp where sal=select sal from(select rownum,sal from emp order by sal desc) where rownum=6;
select e.empno, e.deptno,d.DNAME from emp1 e left join dept1 d on(e.deptno=d.deptno) where d.DNAME is null order by 2
select hiredate,to_char(hiredate,'YYYY'),to_char(sysdate,'YYYY')-5,to_char(sysdate,'YYYY') from emp where to_char(hiredate,'YYYY')=to_char(sysdate,'YYYY')
select * from emp where hiredate<to_date('01011981','DDMMYYYY') or hiredate>to_date('01011985','DDMMYYYY')
select *from all_tables where owner='SCOTT'
select *from all_users
select *from dba_users
select job, instr(JOB,'S',2) from emp where instr(JOB,'S',2)
select ename,length(ename) from emp where ename like '_____'
select e.empno,e.mgr,e.ename,m.ename mname from emp e join emp m on (e.mgr=m.empno) order by 1
select sum(sal), sum(nvl(comm,0)),sum(comm) from emp;
select * from emp
select e.ename,e.job from emp e join emp m on (e.empno=m.mgr)
select *from emp order by deptno,job,sal
select count(*),deptno from emp group by deptno
select count(*),job from emp group by job
select deptno,sum(sal),sum(nvl(comm,0)), (sum(nvl(sal,0))+sum(nvl(comm,0))) Total_Sal from emp group by deptno
select deptno,count(*) c from emp group by deptno having count(*)>5
select max(sal),min(sal),count(*),deptno from emp group by deptno
select * from emp e join (select max(sal) sal from emp) s on (e.sal=s.sal)

select * from emp e join (select max(sal) sal,job from emp group by job) s on (e.sal=s.sal and e.job=s.job)
select * from emp where sal>(select max(sal) from emp where job='CLERK')
select * from emp where sal=any (1600,2000) 
select * from emp e join (select sal from emp where ename in ('JONES','SCOTT')) s on (e.sal>ALL s.sal)
select * from emp e join (select * from dept) d on (e.deptno=d.deptno and dname='ACCOUNTING') 
select * from emp where deptno=10 and sal>ALL(select min(sal) from emp where deptno<>10 group by deptno)
select ename||' '||deptno from emp
select substr('Oracle',1,3) from dual
select instr('achanta','c',1) from dual
select round(sysdate,'DAY') from dual
select sysdate,trunc(add_months(sysdate,-1)) from dual
select e.ename,e.sal,m.ename,m.sal,e.deptno,m.deptno from emp e join emp m on (e.mgr=m.empno and e.deptno=m.deptno)
select * from salgrade
select empno,deptno,sal,grade,losal,hisal from emp e join salgrade s on(e.sal>s.losal and e.sal<s.hisal)
select e.ename,e.sal,s.grade,s.losal,s.hisal,e.job,e.deptno,d.dname from emp e join dept d on(e.deptno=d.deptno and e.job<>'CLERK') 
join salgrade s on(e.sal between s.losal and s.hisal) order by 3

select * from emp where sal>(select (max(sal)+min(sal))/2 from emp)
select e.ename,m.ename mname,e.sal,m.sal,(select avg(sal) from emp) avgsal from emp e join emp m on(e.mgr=m.empno and m.sal>(select avg(sal) from emp))
select e.ename,m.ename mname,e.sal esal,m.sal msal from emp e join emp m on(e.mgr=m.empno and e.sal>m.sal)
select e.ename,m.ename mname,e.job,m.job,e.sal esal,m.sal msal from emp e join emp m on(e.mgr=m.empno and m.job<>'PRESIDENT')
select e2.ename from emp e1,emp e2,emp e3 where e1.mgr=e2.empno and e2.mgr=e3.empno and e3.job!='PRESIDENT';
select length(trunc(123.45)) from dual
select count(*),deptno from emp group by deptno having count(*)>5
select * from dept e where not exists (select * from emp d where e.deptno=d.deptno)

select h1.empno,h2.empno,h1.hiredate,h2.hiredate from emp h1 join emp h2 on(h1.hiredate=h2.hiredate and h1.empno<>h2.empno)

with temp as (select * from emp  order by sal desc) 
select * from temp where rownum<=4 minus
select * from temp where rownum<=3

with temp as (select * from emp  order by sal desc) 
select empno from emp where rownum<=10 
minus
select empno from emp where rownum<=9

select trunc(1234.45634,3),trunc(1234.34),trunc(1234.45634,-2) from dual
select round(1234.34),round(1234.54),round(1234.43934,3),round(1234.45634,-2) from dual

select * from emp where rownum<=5
intersect
select * from emp where rownum<=5

select round(to_date('12-Dec-2018')),round(to_date('12-Dec-2018'),'dd'),round(to_date('12-Dec-2018'),'mm'),round(to_date('12-Jun-2018'),'yyyy') from dual
select sysdate,trunc(sysdate),trunc(sysdate,'dd'),trunc(sysdate,'mm'),trunc(sysdate,'yyyy') from dual

select trunc(to_date('12-Dec-2018'),'dd'),trunc(to_date('12-Dec-2018'),'mm'),trunc(to_date('12-Dec-2018'),'yyyy') from dual