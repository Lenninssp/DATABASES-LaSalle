/ as sysdba

DROP USER c##nora02 CASCADE;
CREATE USER c##nora02 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE, CREATE VIEW TO c##nora02;

SPOOL C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\homework8\SPOOLCLEAR.txt;

start C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\homework8\7clearwater.sql;

CREATE TABLE order_line_archive (
    old_o_id NUMBER(8),
    old_inv_id NUMBER(10),
    old_ol_quantity NUMBER(4),
    CONSTRAINT order_line_archive_pk PRIMARY KEY (old_o_id, old_inv_id),
    CONSTRAINT order_line_archive_fk FOREIGN KEY (old_o_id) REFERENCES orders (o_id),
    CONSTRAINT order_line_archive_inv_fk FOREIGN KEY (old_inv_id) REFERENCES inventory (inv_id)
);

CREATE VIEW OLD_ORDER_DETAIL AS
SELECT
    ola.old_o_id,
    ola.old_inv_id,
    ola.old_ol_quantity,
    o.o_date AS order_date,
    o.o_methpmt AS method_of_payment,
    i.item_desc AS item_description,
    c.c_last AS customer_last_name,
    c.c_first AS customer_first_name
FROM
    order_line_archive ola
JOIN
    orders o ON ola.old_o_id = o.o_id
JOIN
    inventory inv ON ola.old_inv_id = inv.inv_id
JOIN
    item i ON inv.item_id = i.item_id
JOIN
    customer c ON o.c_id = c.c_id;
    
GRANT SELECT, INSERT, DELETE, UPDATE ON OLD_ORDER_DETAIL TO c##nora02;

CONNECT c##nora02/123;

SELECT * FROM c##des02.OLD_ORDER_DETAIL;

SPOOL OFF;