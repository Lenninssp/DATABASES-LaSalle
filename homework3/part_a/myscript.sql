/ as sysdba

DROP USER c##user1  CASCADE;

CREATE USER c##user1 IDENTIFIED BY 123;

GRANT CONNECT, RESOURCE, DBA TO c##user1;


c##user1/123

SPOOL C:\Users\lenni\Documentos\lasalle\DATABASES\user1.txt;

SELECT to_char(sysdate,'DD MM YYYY Year Month Day HH:MI:SS Am') FROM dual;


CREATE TABLE CUSTOMER (
    CustID NUMBER  ,
    CustName VARCHAR2(100),
    Phone VARCHAR2(20)
);

CREATE TABLE ORDERS (
    OID NUMBER  ,
    Odate DATE,
    CustID NUMBER
);

CREATE TABLE PRODUCT (
    ProductID NUMBER  ,
    Description VARCHAR2(200),
    Price NUMBER
);

CREATE TABLE ORDER_LINE (
    ProductID NUMBER,
    OID NUMBER,
    Quantity NUMBER);


DESCRIBE CUSTOMER;
DESCRIBE ORDERS;
DESCRIBE PRODUCT;
DESCRIBE ORDER_LINE;

SPOOL OFF;


