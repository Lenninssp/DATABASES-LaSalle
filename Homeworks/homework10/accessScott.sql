/ as sysdba

start C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\Homeworks\homework10\scott_emp_dept.sql;

SPOOL C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\Homeworks\homework10\SPOOLSCOTT.txt;

--1--
SELECT MAX(sal) AS max_sal, MIN(sal) AS min_sal
FROM emp;

--2--
SELECT deptno, SUM(sal) AS sum_sal, MAX(sal) AS max_sal, MIN(sal) AS min_sal
FROM emp
GROUP BY deptno
HAVING MIN(sal) > 1000
AND job != 'PRESIDENT';

--3--
start C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\Homeworks\homework10\7clearwater.sql;
SELECT item_id, SUM(inv_qoh) AS sum_quantity, MIN(inv_price) AS min_inv_price, MAX(inv_price) AS max_inv_price
FROM inventory
WHERE size IN ('L', 'M')
GROUP BY item_id
HAVING SUM(inv_qoh) > 200;

--4--
SELECT item_id, SUM(inv_qoh) AS sum_quantity, MIN(inv_price) AS min_inv_price, MAX(inv_price) AS max_inv_price
FROM inventory
WHERE size = 'S' OR size IS NULL
GROUP BY item_id
HAVING SUM(inv_qoh) > 100;

--5--
SELECT item_id, MIN(inv_price) AS min_inv_price, MAX(inv_price) AS max_inv_price, MAX(color) AS max_color, MIN(color) AS min_color
FROM inventory
WHERE size = 'S' OR size IS NULL
GROUP BY item_id
HAVING SUM(inv_qoh) > 100;

--6--
start C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\Homeworks\homework10\7Northwoods.sql;
SELECT MIN(s_dob) AS youngest, MAX(s_dob) AS oldest
FROM student;

--7--
SELECT s_class, MIN(s_dob) AS youngest, MAX(s_dob) AS oldest
FROM student
GROUP BY s_class;

SPOOL OFF;