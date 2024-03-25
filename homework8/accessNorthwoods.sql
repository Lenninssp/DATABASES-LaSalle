/ as sysdba

DROP USER c##nora03 CASCADE;
CREATE USER c##nora03 IDENTIFIED BY password;
GRANT CONNECT, RESOURCE, CREATE VIEW TO c##nora03;

CONNECT c##nora03/password;

start C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\homework8\7Northwoods.sql;

CREATE VIEW student_faculty_1 AS
SELECT s_last, s_first, s_dob
FROM Students
WHERE faculty_id IN (1, 2);