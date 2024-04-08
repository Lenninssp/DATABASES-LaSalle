/ as sysdba

start C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\homework9\7Northwoods.sql;

SPOOL C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\homework9\SPOOLNORTH.txt;

--1--
SELECT C_SEC_ID, SEC_NUM, C_SEC_DAY, TO_CHAR(C_SEC_TIME, 'HH:MI AM') AS C_SEC_TIME
FROM course_section
WHERE C_SEC_DAY = 'MWF';

--2--
SELECT S_FIRST, S_LAST, COALESCE(s_mi, 'N/A') AS s_mi
FROM student
WHERE s_mi IS NULL;

--3--
SELECT C_SEC_ID, SEC_NUM, C_SEC_DAY, LTRIM(TO_CHAR(C_SEC_TIME, 'FMHH:MI AM AM')) AS C_SEC_TIME
FROM course_section;

--4--
UPDATE student
SET time_enrolled = time_enrolled + INTERVAL '12-0' YEAR TO MONTH;

UPDATE course_section
SET C_SEC_TIME = C_SEC_TIME + INTERVAL '30' MINUTE;

--5--
SELECT *
FROM enrollment
WHERE grade IS NULL OR grade != 'C';

SPOOL OFF;