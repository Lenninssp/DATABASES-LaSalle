Feb 26   DQL = Data Query Language
  script  scott_emp_dept    employee  department
          7clearwater       Traiding Company  CUSTOMER ITEM,...
          7Northwoods       Northwoods University , STUdent, course
          7software         Consulting Company, Consultant, project...




Feb 27   Solve Part 5, Distribute part 6
Mar 4    Simulation Midterm
           Part 1 ON PAPER , closed book , 20% NORMALIZATION
           Part 2 Open book, Computer, script, spool file
               No script 100%OFF (zero) No spool 50%OFF
Mar 5    Return Simulation / Solve Simulation
Mar 11   Real Midterm Exam
Mar 12   New Lecture
Mar 18   Project Part 7



-----------

Syntax of a SELECT statement:
  -- From 1 table
    SELECT name_of_column1, name_of_column2, ...
    FROM   name_of_table
  [ WHERE  search condition ]  ;
If there is no search condition , all rows of the table will be displays

Example 1:  using schema c##scott, write a query to display all departments
(hint: the name  of the table is dept)

  SELECT deptno, dname, loc 
  FROM   dept ;

Note:  If we want to select all the columns, we can use the *

  SELECT * 
  FROM   dept;

Example 2:  using schema c##scott, write a query to display the employee number
name, job, salary of all employee who earn more than 2000 a month.
(hint: the name of the table is emp.  Use the comparison operator :
   >  for greater  , >= greater of  equal,  < less than,  <= less than or equal,
<> for not equal)  

    SELECT empno, ename, job, sal
    FROM   emp
    WHERE  sal > 2000 ;


Example 4:  using schema c##scott, write a query to display the employee number
name, job, salary of all employee who earn between 1250 and 2450.
(hint: the name of the table is emp.  Use the comparison operator :
   >  for greater  , >= greater of  equal,  < less than,  <= less than or equal,
<> for not equal)  

SELECT empno, ename, job, sal
    FROM   emp
    WHERE  sal >= 1250 AND  sal <= 2450 ;

== SELECT empno, ename, job, sal
    FROM   emp
    WHERE  sal BETWEEN 1250 AND 2450 ;


Example 5:  using schema c##scott, write a query to display the employee number
name, job, salary of all employee who earn more than 2000 OR the job is a
'SALESMAN'.
(hint: the name of the table is emp.  Use the comparison operator :
   >  for greater  , >= greater of  equal,  < less than,  <= less than or equal,
<> for not equal) 

    SELECT empno, ename, job, sal
    FROM   emp
    WHERE  sal > 2000 OR job = 'SALESMAN';

Example 5:  using schema c##scott, write a query to display the employee number
name, job, salary of all employee who earn more than 2000 EXCEPT the job 
'PRESIDENT'

SELECT empno, ename, job, sal
    FROM   emp
    WHERE  sal > 2000 AND job  <> 'PRESIDENT';

-------------------  LIKE operator  for range search
   2 wildcard character  
     '%'  for any numbber of charactor different
     '_'  for ONE charactor different

Example 6:  using schema c##scott, write a query to display the employee number
name, job, salary of all employee whose name start with charactor M

  SELECT empno, ename, job,sal
  FROM   emp
  WHERE  ename LIKE 'M%';

Example 6:  using schema c##scott, write a query to display the employee number
name, job, salary of all employee whose name contain charactor 'A'

  SELECT empno, ename, job,sal
  FROM   emp
  WHERE  ename LIKE '%A%';

------------------------- IS NULL / IS NOT NULL   ----

Example 7:  using schema c##scott, write a query to display the employee number
name, job, salary, and commission of all employee whose earn a commission

SELECT empno, ename, job, sal, comm
FROM   emp
WHERE  comm IS NOT NULL;

------------------
Syntax of a SELECT statement:
  -- From MANY tables
    SELECT table1.name_of_column1, table1.name_of_column2, table2.column1, ...
    FROM   table1, table2, ...
  [ WHERE  join condition
    AND search condition ]  ;

The numbers of join condition have to follow the N-1 law.

  N-1 law:  For a select of N table, we must have N-1 join condition.
If the N-1 law is not followed, we will have a Cartesian Product.

Example 8:  using the schemas c##scott, write a query to display the
employee number, name, job, department number, and the name of the department.
(hint: the name of the department is from the table dept)


   -- EQUI JOIN   --
  SELECT empno, ename, job, dept.deptno, dname
  FROM   emp, dept
  WHERE  emp.deptno = dept.deptno ;



---------   SELF JOIN  ------
Example 9:  using the schemas c##scott, write a query to display the
employee number, name, job, the manager id and the name of the manager
of all employees. (hint:  MGR is the empno of the manager of the employee)

   SELECT worker.empno, worker.ename, worker.job, worker.mgr, 
      manager.empno "Boss Id", manager.ename "Boss Name"
   FROM   emp worker, emp manager
   WHERE  worker.mgr =  manager.empno;


---------   OUTER JOIN  ------
Example 10:  using the schemas c##scott, add a new employee named
   Jacky Chan who is an actor with a salary of $1 and he does not work in 
any department write a query to display the
employee number, name, job, the manager id and the name of the manager
of all employees INCLUDING the employee who does not have a manger. 
(hint:  put the outer join operator (+) on the missing side of data)

INSERT INTO emp(empno, ename, job, sal)
VALUES (8888,'Jacky Chan','ACTOR',1);


SELECT worker.empno, worker.ename, worker.job, worker.mgr, 
      manager.empno "Boss Id", manager.ename "Boss Name"
   FROM   emp worker, emp manager
   WHERE  worker.mgr =  manager.empno (+);




Example 10:  using the schemas c##scott, write a query to display the
employee number, name, job, department number, and the name of the department.
INCLUDING  the department that has no employee working in it.
(hint: the name of the department is from the table dept)

SELECT empno, ename, job, dept.deptno, dname
  FROM   emp, dept
  WHERE  emp.deptno (+)  = dept.deptno ;


Example 11:  using the schemas c##scott, write a query to display the
employee number, name, job, department number, and the name of the department.
INCLUDING  the employee who does  not work for any department.
(hint: the name of the department is from the table dept)

SELECT empno, ename, job, dept.deptno, dname
  FROM   emp, dept
  WHERE  emp.deptno  = dept.deptno (+) ;




