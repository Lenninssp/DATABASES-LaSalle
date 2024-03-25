/ as sysdba

GRANT  create view TO c##des02;
DROP USER c##nora02 CASCADE;
CREATE USER c##nora02 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE, CREATE VIEW TO c##nora02;

CONNECT c##nora02/123;

start C:\Users\lenni\Developer\lasalle\DATABASES-LaSalle\homework8\7clearwater.sql;

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
