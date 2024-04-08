/ as sysdba

connect c##des04/tiger;

SPOOL C:\Users\lenni\Escritorio\SPOOL.txt;

SELECT s.skill_description
FROM skill s
INNER JOIN consultant_skill cs ON s.skill_id = cs.skill_id
WHERE cs.c_id = 100;

SELECT s.skill_description
FROM skill s
INNER JOIN consultant_skill cs ON s.skill_id = cs.skill_id
WHERE cs.c_id = 102 AND cs.certification = 'Certified';

SELECT p.project_name
FROM project p
INNER JOIN project_consultant pc ON p.p_id = pc.p_id
WHERE pc.c_id = 1 AND pc.roll_off_date IS NULL;

SELECT s.skill_description, c.c_first, c.c_last
FROM skill s
INNER JOIN consultant_skill cs ON s.skill_id = cs.skill_id
INNER JOIN consultant c ON cs.c_id = c.c_id
WHERE cs.certification = 'Certified';

SELECT p.project_name
FROM project p
INNER JOIN project_consultant pc ON p.p_id = pc.p_id
INNER JOIN consultant c ON pc.c_id = c.c_id
WHERE c.c_first = 'Mark' AND c.c_last = 'Myer';

SELECT p.project_name, c.c_first, c.c_last
FROM project p
INNER JOIN consultant c ON p.mgr_id = c.c_id;

SELECT p.project_name, parent.project_name AS parent_project_name
FROM project p
LEFT JOIN project parent ON p.parent_p_id = parent.p_id;

SELECT p.project_name, parent.project_name AS parent_project_name
FROM project p
LEFT JOIN project parent ON p.parent_p_id = parent.p_id OR (p.parent_p_id IS NULL AND parent.p_id IS NULL);

SPOOL OFF;