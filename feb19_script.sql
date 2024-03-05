Menu du jour
  You have work harder because I don`t have SQL, Oracle

DML = Data Manipulation Language
DCL = Data Control Language
SEQUENCE
Continue with Project Part 4b

Example 1: Create a new user named cfeb19_user1 and the 
2 tables of the design below:

  DEPT(DEPTNO, dname, loc)
  EMP (EMPNO, ename, job)

Use the attribute in uppercase to add the Pks to each table
and the E.R.D below to add needed FK. Make sure that each department and each
employee must contain a value in it

  DEPT   ---E   EMP
We need to create table and constraints at the same time.

connect sys/sys as sysdba
DROP USER c##f19_user1 CASCADE;
CREATE USER c##f19_user1 IDENTIFIED BY 123;
GRANT connect, resource TO c##f19_user1;
ALTER USER c##f19_user1 QUOTA 100M on users;
conn c##f19_user1/123
show user

-- create table dept with Primary key and NOT NULL at column level
CREATE TABLE  dept (deptno NUMBER CONSTRAINT dept_deptno_PK PRIMARY KEY,
       dname VARCHAR2(50) CONSTRAINT dept_dname_NN NOT NULL,
       loc VARCHAR2(40) ); 

-- create table emp with Primary key, and Foreign key constraint at table level
CREATE TABLE emp(empno NUMBER, 
            ename VARCHAR2(40) CONSTRAINT emp_ename_NN NOT NULL,
            job VARCHAR2(40) , deptno NUMBER),
    CONSTRAINT emp_empno_PK PRIMARY KEY(empno) ,
    CONSTRAINT emp_deptno_FK FOREIGN KEY (deptno)
    REFERENCES dept(deptno)  );

Example 2:  Insert 2 rows into each table using any value of your choice.

  -- Syntax of an INSERT

  --  INSERT INTO name_of_table (name_of_column1, name_of_column2, ...)
  --  VALUES (value1, value2, ...)   ;

INSERT INTO dept(deptno, dname, loc)
VALUES (10,'ACCOUNTING','MONTREAL');

  -- Note that we don`t have to mention the column`s name if we have all the values

INSERT INTO dept
VALUES (20,'INFORMATIQUE','OTTAWA');

  INSERT INTO emp(empno, ename)
  VALUES(1000,'Bao Anh');

  INSERT INTO emp
  VALUES(1002,'Antonio','F.B.I',10);

Example 2:  Modify the data of table dept to move the department number 10 to TORONTO
and change the job of employee number 1002 to 'MANAGER'

  -- Syntax of an UPDATE
  --  UPDATE name_of_table
  --  SET   name_of_column1 = value1, name_of_column2 = value2, ...
  --  WHERE name_of_columnX = valueX ;
If the WHERE clause is not existed, ALL rows will be updated.

  UPDATE  dept
  SET   loc = 'TORONTO'
  WHERE deptno = 10;

SELECT * FROM dept;


Example 3:  Remove employee number 1000 from the table EMP.

    -- Syntax of a DELETE
    --  DELETE FROM name_of_table
    --  WHERE  name_of_columnX = valueX ;

If the WHERE clause does not exist, ALL rows will be removed.

  DELETE FROM  emp
  WHERE  empno = 1000;

----------------  DCL = Data Control Language
  -- COMMIT  is to make all the DML permanently saved in the database
  -- A DDL (Data Definition Language ex: CREATE TABLE ...) will perform an Auto Commit.
  -- ROLLBACK is to cancel all DML back to the last COMMIT

Example 4:  Cancel all the DML of example 1,2,3 

  ROLLBACK ;
SELECT * FROM emp;
SELECT * FROM dept;

--Example 5: Re-do example 1 , then create table test1 as follow:
--             CREATE TABLE test1(id NUMBER);
--     Can you cancel the INSERT of example 1?

  INSERT INTO dept(deptno, dname, loc)
  VALUES (10,'ACCOUNTING','MONTREAL');

  INSERT INTO dept
  VALUES (20,'INFORMATIQUE','OTTAWA');

  INSERT INTO emp(empno, ename)
  VALUES(1000,'Bao Anh');

  INSERT INTO emp
  VALUES(1002,'Antonio','F.B.I',10);

CREATE TABLE test1(id NUMBER);
ROLLBACK;
SELECT * FROM dept;
SELECT * FROM emp;

-- We can set SAVEPOINT in order to Rollback back to a particular position.

  Example 6: Re-do example 2 , 3 and set a SAVEPOINT between the 2 examples then rollback
only the example 3

    -- example 2
  UPDATE  dept
  SET   loc = 'TORONTO'
  WHERE deptno = 10;

    -- set savepoint
  SAVEPOINT A;

    -- example 3
  DELETE FROM  emp
  WHERE  empno = 1000;

    -- cancel example3
  ROLLBACK TO A;
----------------------------------- After BREAK ---- SEQUENCES   

Example 7: Can we auto-generate the values for the Primary Key and Foreign key?
If yes, write the command to insert 2 more department with 3 employees working in
each department.  (hint: use SEQUENCE)

  -- Syntax of SEQUENCE
   --  CREATE SEQUENCE  name_of_sequence
        -- START WITH
        -- INCREMENT BY
        -- MAXVALUE/MINVALUE
        -- CYCLE/NOCYCLE
        -- CACHESIZE/NOCACHE  ;
  -- The default value are:  START WITH 1, CACHESIZE 20, INCREMENT BY 1
    --  , NOMAX, NOMIN
        

CREATE SEQUENCE dept_sequence START WITH 22 INCREMENT BY 2;
CREATE SEQUENCE emp_sequence START WITH 1005 NOCACHE;

-- syntax to get a new number and display on SQL*Plus :
--   SELECT name_of_sequence.NEXTVAL FROM dual;

SELECT emp_sequence.NEXTVAL FROM dual;
/
-- syntax to get THE CURRENT number and display on SQL*Plus :
--   SELECT name_of_sequence.CURRVAL FROM dual;

SELECT emp_sequence.CURRVAL FROM dual;
/

--  insert a new department with the value of the deptno auto-generated

INSERT INTO dept(deptno, loc, dname)
VALUES(dept_sequence.NEXTVAL,'LAVAL','MARKETING');

INSERT INTO emp(empno,ename,deptno)
VALUES(emp_sequence.NEXTVAL, 'Employee 1', dept_sequence.CURRVAL);

INSERT INTO emp(empno,ename,deptno)
VALUES(emp_sequence.NEXTVAL, 'Employee 2', dept_sequence.CURRVAL);

INSERT INTO emp(empno,ename,deptno)
VALUES(emp_sequence.NEXTVAL, 'Employee 3', dept_sequence.CURRVAL);

INSERT INTO dept(deptno, loc, dname)
VALUES(dept_sequence.NEXTVAL,'QUEBEC','COOKING');

INSERT INTO emp(empno,ename,deptno)
VALUES(emp_sequence.NEXTVAL, 'Employee 4', dept_sequence.CURRVAL);

INSERT INTO emp(empno,ename,deptno)
VALUES(emp_sequence.NEXTVAL, 'Employee 5', dept_sequence.CURRVAL);

INSERT INTO emp(empno,ename,deptno)
VALUES(emp_sequence.NEXTVAL, 'Employee 6', dept_sequence.CURRVAL);

SELECT sequence_name, increment_by, cache_size, last_number FROM user_sequences;

DESC user_sequences 




































