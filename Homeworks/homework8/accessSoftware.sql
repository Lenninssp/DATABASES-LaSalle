/ as sysdba

DROP USER c##nora04 CASCADE;
CREATE USER c##nora04 IDENTIFIED BY password;
GRANT CONNECT, RESOURCE, CREATE VIEW TO c##nora04;

SPOOL C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\homework8\SPOOLSOFT.txt;


start C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\homework8\7Software.sql;


CREATE OR REPLACE VIEW Project_Consultant_View AS
SELECT p.project_name, c.c_first
FROM project_consultant pc
JOIN project p ON pc.p_id = p.p_id
JOIN consultant c ON pc.c_id = c.c_id;

GRANT SELECT, INSERT, DELETE, UPDATE ON Project_Consultant_View TO c##nora04;

CONNECT c##nora04/password;

SELECT * FROM c##des04.Project_Consultant_View;

SPOOL OFF;