/ as sysdba
DROP USER c##parent CASCADE;
DROP USER c##child CASCADE;
CREATE USER c##child IDENTIFIED BY 123;
GRANT connect , resource TO c##child;
GRANT create view TO c##child;
CREATE USER c##parent IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE, DBA TO c##parent;
connect c##parent/123;

create table tab1(
    id number,
    name varchar(10),
    last_name varchar(20)
);

INSERT INTO tab1 VALUES (10, 'Lennin', 'Sabogal');