c##scott
tiger

--COUNT(*)
--write query to display the number of rows of table emp

SELECT COUNT(*) FROM emp;

--display the number of emp that earn commition

SELECT COUNT (comm) FROM emp;

--display the ones that dont earn commition

SELECT COUNT (empno) FROM emp WHERE comm IS NULL;
--OR 
SELECT COUNT(*) - COUNT(comm) FROM emp;

--MAX(COLUMN) / MIN(COLUMN) / AVG(COLUMN) / SUM(COLUMN)
--display highest salary, lowest, average and sum of all

SELECT MAX (sal), MIN(sal), AVG(sal), SUM(sal) FROM emp;

--display highest salary, lowest, average and sum of EACH DEPARTMENT

SELECT deptno, MAX (sal), MIN(sal), AVG(sal), SUM(sal) FROM emp GROUP BY deptno;

--display highest salary, lowest, average and sum of EACH job

SELECT job, MAX (sal), MIN(sal), AVG(sal), SUM(sal) FROM emp GROUP BY job;


--display highest salary, lowest, average and sum of EACH department

SELECT deptno, job, MAX (sal), MIN(sal), AVG(sal), SUM(sal) FROM emp GROUP BY deptno, job;

--display highest salary, lowest, average and sum of EACH department - president

SELECT deptno, job, MAX (sal), MIN(sal), AVG(sal), SUM(sal) FROM emp WHERE job <>'PRESIDENT' GROUP BY deptno, job;

--display highest salary, lowest, average and sum of EACH department - president && the minimum salary is greater than 9000

SELECT deptno, MAX (sal), MIN(sal), AVG(sal), SUM(sal) 
FROM emp 
WHERE job <>'PRESIDENT' AND sal > 900 
GROUP BY deptno;
