/ as sysdba

DROP USER c##nora04 CASCADE;
CREATE USER c##nora04 IDENTIFIED BY password;
GRANT CONNECT, RESOURCE, CREATE VIEW TO c##nora04;

CONNECT c##nora04/password;

start C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\homework8\7Software.sql;

CREATE VIEW Project_Consultant_View AS
SELECT p.project_name, c.consultant_name
FROM Projects p
JOIN Consultants c ON p.consultant_id = c.consultant_id;
