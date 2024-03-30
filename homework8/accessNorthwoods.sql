/ as sysdba

DROP USER c##nora03 CASCADE;
CREATE USER c##nora03 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE, CREATE VIEW TO c##nora03;

SPOOL C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\homework8\SPOOLNORTH.txt;

start C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\homework8\7Northwoods.sql;

CREATE VIEW student_faculty_1 AS
SELECT s_last, s_first, s_dob
FROM Student
WHERE f_id IN (1, 2);

GRANT SELECT, INSERT, DELETE, UPDATE ON student_faculty_1 TO c##nora03;

CONNECT c##nora03/123;

SELECT * FROM c##des03.student_faculty_1;

SPOOL OFF;