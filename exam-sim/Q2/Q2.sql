/ as sysdba
DROP USER c##lennin_Smidterm_Q2 CASCADE;
CREATE USER c##lennin_Smidterm_Q2 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE, DBA TO c##lennin_Smidterm_Q2;
ALTER USER c##lennin_Smidterm_Q2 QUOTA 100M on users;
CONNECT c##lennin_Smidterm_Q2/123;

SPOOL C:\Users\lenni\Escritorio\SPOOLexam2.txt;

CREATE TABLE ADVISOR(
    AdvisorID NUMBER,
    AdvisorName VARCHAR(20) NOT NULL,
    CONSTRAINT AdvisorID_PK PRIMARY KEY(AdvisorID)
);

CREATE TABLE STUDENT(
    StudentID NUMBER,
    StudentName VARCHAR(20) NOT NULL,
    BirthDate DATE,
    AdvisorID NUMBER,
    Gender VARCHAR(1),
    CONSTRAINT StudentID_PK PRIMARY KEY(StudentID),
    CONSTRAINT AdvisorID_FK FOREIGN KEY(AdvisorID) REFERENCES ADVISOR (AdvisorID),
    CONSTRAINT Gender_Check CHECK (Gender IN ('M', 'F', 'm', 'f'))
);

CREATE TABLE COURSE(
    CourseID NUMBER,
    CourseTitle VARCHAR(20),
    Credits NUMBER CHECK(Credits > 0),
    CONSTRAINT CourseID_PK PRIMARY KEY(CourseID),
    CONSTRAINT CourseTitle_UNIQUE UNIQUE (CourseTitle)
);

CREATE TABLE ENROLLMENT(
    StudentID NUMBER,
    CourseID NUMBER,
    Grade NUMBER,
    CONSTRAINT StudentID_FK FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
    CONSTRAINT CourseID_FK FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID)
);

SPOOL OFF;