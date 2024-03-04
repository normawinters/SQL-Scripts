/* Script runs with Oracle 19C */

/*list department and employee count*/
    
select dept.dname "Department Name", count(empno) "Number of Employees"
from dept
left outer join emp on dept.deptno = emp.deptno
group by dept.dname
order by dname;
    

/*list departments that do not have any employees */
    
select dept.dname "Department Name", count(empno) "Number of Employees"
from dept
left outer join emp on dept.deptno = emp.deptno
group by dept.dname
having count(empno) = 0;

/*Using a subquery to list departments with no employees*/

select dept.dname "Department Name"
from dept
where 0 = (select count(*) 
           from emp
           where  dept.deptno = emp.deptno);
