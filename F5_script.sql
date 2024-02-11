-- Menu du jour
-- Review Oracle -- create user, script file,...
-- Add PRIMARY KEY, FOREIGN KEY -- After table creation time
				-- At table creationg time
-- BREAK
-- Continue with your Project Part 3

connect sys/sys as sysdba
SPOOL C:\HuuCon\bd1\7070\f5_spool.txt
SELECT to_char(sysdate,'DD MM YYYY Year Month Day HH:MI:SS Am') 
FROM DUAL;
DROP USER c##daniel_f5 CASCADE;
CREATE USER c##daniel_f5 IDENTIFIED BY 123;
GRANT connect, resource TO c##daniel_f5;
ALTER USER c##daniel_f5 QUOTA 100M on users;
connect c##daniel_f5/123
-- Example 1: Create the tables of the design below using datatype
-- number for ID, VARCHAR2 for text, and date for DATE.

  -- RENTAL(MID,VID,rent_date, return_date)
--  MEMBER(MID,name)
--  VIDEO (VID, title, rating)

CREATE TABLE rental(MID NUMBER, VID NUMBER, rent_date DATE, 
return_date DATE);
CREATE TABLE member(MID NUMBER, name VARCHAR2(50));
CREATE TABLE video(VID NUMBER, title VARCHAR2(50), rating VARCHAR2(50));
SELECT table_name FROM user_tables;
DESC rental

-- Exampl2: Modify table member by adding column phone of type NUMBER,
-- remove column rating from table video , and drop table rental - re
-- create table rental without the column return_date.

   -- syntax:  ALTER TABLE name_of_table
   --          ADD (name_of_column DATATYPE, ...);

ALTER TABLE member
ADD (phone NUMBER);

   -- syntax:  ALTER TABLE name_of_table
   --          DROP COLUMN name_of_column;

ALTER TABLE video
DROP column rating;

   --  syntax: DROP TABLE name_of_table CASCADE;
DROP TABLE rental;

CREATE TABLE rental(MID NUMBER, VID NUMBER, rent_date DATE);   

-- Example 3: Add PRIMARY KEY to all tables of example 1, using the E.R.D
-- below, add all needed FOREIGN KEY to join all the tables together

     --  MEMBER   ---E  RENTAL  3--- VIDEO
-- (note that the attributes in UPPER CASE are the PK)

  --  syntax: ALTER TABLE name_of_table 
--      ADD CONSTRAINT name_of_constraint PRIMARY KEY (name_of_column);


ALTER TABLE member
ADD CONSTRAINT member_mid_PK PRIMARY KEY(mid);

ALTER TABLE video
ADD CONSTRAINT video_vid_PK PRIMARY KEY(vid);
ALTER TABLE rental
ADD CONSTRAINT rental_mid_vid_PK PRIMARY KEY(mid,vid);

-- syntax: ALTER TABLE name_of_table
--         ADD CONSTRAINT  name_of_constraint FOREIGN KEY (name_of_column)
--         REFERENCES name_of_parent_table(name_of_unique_column)

ALTER TABLE rental
ADD CONSTRAINT rental_mid_FK FOREIGN KEY (mid)
REFERENCES member(mid);

ALTER TABLE rental
ADD CONSTRAINT rental_vid_FK FOREIGN KEY (vid)
REFERENCES video(vid);

INSERT INTO video(vid, title)
VALUES(10,'Avatar');

--INSERT INTO rental
--VALUES(2,10,sysdate);

-- Add PK AND FK at table creation time. 

--  Example 4:  Create an user named c##f5 and re-create all tables of
-- example 1,2,3 with all the keys created at table creation time

connect sys/sys as sysdba
DROP USER c##f5 CASCADE;
CREATE USER c##f5 IDENTIFIED BY 123;
GRANT connect, resource TO c##f5;
ALTER USER c##f5 QUOTA 100M on users;
connect c##f5/123

-- create table and keys at the same time
--  keys can be at    -- column level
--                 OR -- table level
--  PRIMARY KEY can be at both level.  Composit PK MUST BE at table level.
--  FOREING KEY MUST BE at table level
--  create table member with PK at column level
  
CREATE TABLE member (mid NUMBER CONSTRAINT member_mid_PK PRIMARY KEY,
              name VARCHAR2(50), phone NUMBER);

-- create table video with PK at table level
CREATE TABLE video (vid NUMBER, title VARCHAR2(50) ,
                    CONSTRAINT video_vid_PK PRIMARY KEY(vid) );

-- create table rental with composit PK at column level
--CREATE TABLE rental (mid NUMBER CONSTRAINT rental_mid_PK PRIMARY KEY,
            -- vid NUMBER CONSTRAINT rental_vid_PK PRIMARY KEY,
            --   rent_date DATE);

CREATE TABLE rental (mid NUMBER,vid NUMBER, rent_date DATE,
              CONSTRAINT rental_mid_vid_PK PRIMARY KEY(mid,vid),
        CONSTRAINT rental_mid_FK FOREIGN KEY (mid)
        REFERENCES  member(mid),
        CONSTRAINT rental_vid_FK FOREIGN KEY (vid)
        REFERENCES  video(vid) );

CREATE TABLE student (sid NUMBER  PRIMARY  KEY, last_name VARCHAR2(20));

-- to display  info of constraints do:
SELECT constraint_name, table_name, constraint_type
FROM    user_constraints;


-- save spool file
SPOOL OFF;
