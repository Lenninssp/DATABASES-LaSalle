/ as sysdba
SELECT to_char(sysdate,'DD MM YYYY Year Month Day HH:MI:SS Am') FROM dual;
DROP USER c##lennin_L4Q1 CASCADE;
CREATE USER c##lennin_L4Q1 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE, DBA TO c##lennin_L4Q1;
ALTER USER c##lennin_L4Q1 QUOTA 100M on users;
CONNECT c##lennin_L4Q1/123;

SPOOL C:\Users\lenni\Documentos\lasalle\DATABASES\HOMEWORK4\partB\SPOOL.txt;

CREATE TABLE LOCATION(LID NUMBER, Building VARCHAR2(50));
CREATE TABLE REGION(RegID NUMBER, RegionName VARCHAR2(50));
CREATE TABLE DEPARTMENT(DID NUMBER, Dept VARCHAR2(50), LID NUMBER);
CREATE TABLE EMPLOYEE(EID NUMBER, Name VARCHAR2(50), Salary NUMBER, DID NUMBER);
CREATE TABLE JOB(JID NUMBER, Descr VARCHAR2(50));
CREATE TABLE EMP_JOB(EID NUMBER, JID NUMBER, Date_assigned DATE);

ALTER TABLE LOCATION
ADD CONSTRAINT LID_PK PRIMARY KEY(LID);

ALTER TABLE DEPARTMENT
ADD CONSTRAINT DID_PK PRIMARY KEY(DID);

ALTER TABLE EMPLOYEE
ADD CONSTRAINT EID_PK PRIMARY KEY(EID);

ALTER TABLE JOB
ADD CONSTRAINT JID_PK PRIMARY KEY(JID);

ALTER TABLE EMP_JOB
ADD CONSTRAINT EID_JID_PK PRIMARY KEY(EID, JID);

ALTER TABLE REGION
ADD CONSTRAINT REGID_PK PRIMARY KEY(RegID);

ALTER TABLE LOCATION
ADD CONSTRAINT LOCATION_REGID_FK FOREIGN KEY (RegID)
REFERENCES REGION(RegID);
 
ALTER TABLE LOCATION ADD RegID NUMBER;

ALTER TABLE EMPLOYEE ADD Hiredate DATE;

ALTER TABLE JOB ADD Skill_Required VARCHAR2(100);

ALTER TABLE EMPLOYEE DROP COLUMN Salary;

DESC LOCATION
DESC DEPARTMENT
DESC EMPLOYEE
DESC JOB
DESC EMP_JOB
DESC REGION;

SELECT table_name, column_name, data_type, data_length
FROM user_tab_columns;

SELECT constraint_name, constraint_type
FROM user_constraints;

SPOOL OFF;