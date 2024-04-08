/ as sysdba
SELECT to_char(sysdate,'DD MM YYYY Year Month Day HH:MI:SS Am') FROM dual;
DROP USER c##f19_user1 CASCADE;
CREATE USER c##f19_user1 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE, DBA TO c##f19_user1;
ALTER USER c##f19_user1 QUOTA 100M on users;
CONNECT c##f19_user1/123;

CREATE TABLE student(
    sid NUMBER CONSTRAINT student_sid_PK PRIMARY KEY,
    sname VARCHAR(40) CONSTRAINT student_sname_NN NOT NULL,
    birthdate DATE);

CREATE TABLE dept(
    deptno NUMBER CONSTRAINT dept_deptno_PK PRIMARY KEY,
    dname VARCHAR(40) CONSTRAINT dept_deptno_NN NOT NULL,
    loc VARCHAR(40));

CREATE TABLE emp(
    empno NUMBER CONSTRAINT emp_empno_PK PRIMARY KEY,
    empname VARCHAR (40),
    age NUMBER
);

INSERT INTO dept (deptno, dname, loc) VALUES (20, 'stupid', 'myGod');
INSERT INTO dept (deptno, dname, loc) VALUES (30, 'coco', 'springfield');
INSERT INTO emp (empno, empname, age) VALUES (10, 'jorge', 69);


UPDATE dept SET dname = 'lennin' WHERE deptno = 20;

UPDATE emp SET empname = 'Ramiro' WHERE empno = 10;

INSERT INTO emp (empno, empname, age) VALUES (11, 'comida', amiga);

DELETE FROM dept WHERE deptno = 20;

SELECT * FROM dept;

ROLLBACK;




UPDATE dept SET loc = 'myGod' WHERE deptno = 20;


SAVEPOINTA;

DELETE FROM dept WHERE deptno = 11;

ROLLBACK TO A;