
/ as sysdba
SELECT to_char(sysdate,'DD MM YYYY Year Month Day HH:MI:SS Am') FROM dual;
DROP USER c##lennin_L4Q1 CASCADE;
CREATE USER c##lennin_L4Q1 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE, DBA TO c##lennin_L4Q1;
ALTER USER c##lennin_L4Q1 QUOTA 100M on users;
CONNECT c##lennin_L4Q1/123;

SPOOL C:\Users\lenni\Documentos\lasalle\DATABASES\HOMEWORK4\partC\SPOOL.txt;

CREATE TABLE LOCATION (
    LID NUMBER,
    Building VARCHAR2(50),
    RegID NUMBER,
    CONSTRAINT LID_PK PRIMARY KEY(LID)
);

CREATE TABLE REGION (
    RegID NUMBER,
    RegionName VARCHAR2(50),
    CONSTRAINT RegID_PK PRIMARY KEY(RegID)
);

CREATE TABLE DEPARTMENT (
    DID NUMBER,
    Dept VARCHAR2(50),
    LID NUMBER,
    CONSTRAINT DID_PK PRIMARY KEY(DID),
    CONSTRAINT LID_FK FOREIGN KEY (LID) REFERENCES LOCATION(LID)
);

CREATE TABLE EMPLOYEE (
    EID NUMBER,
    Name VARCHAR2(50),
    Hiredate DATE,
    DID NUMBER,
    CONSTRAINT EID_PK PRIMARY KEY(EID),
    CONSTRAINT DID_FK FOREIGN KEY (DID) REFERENCES DEPARTMENT(DID)
);

CREATE TABLE JOB (
    JID NUMBER,
    Descr VARCHAR2(50),
    Skill_Required VARCHAR2(100),
    CONSTRAINT JID_PK PRIMARY KEY(JID)
);

CREATE TABLE EMP_JOB (
    EID NUMBER,
    JID NUMBER,
    Date_assigned DATE,
    CONSTRAINT EID_JID_PK PRIMARY KEY(EID, JID),
    CONSTRAINT EID_FK FOREIGN KEY (EID) REFERENCES EMPLOYEE(EID),
    CONSTRAINT JID_FK FOREIGN KEY (JID) REFERENCES JOB(JID)
);


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
