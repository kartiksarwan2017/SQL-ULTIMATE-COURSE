DESCRIBE customers;

/*
SQL TASK
Insert new customers Anna Nixon from UK
*/
-- INSERT INTO customers
-- VALUE (DEFAULT,'Anna', 'Nixon', 'UK', NULL);

INSERT INTO customers
VALUE (5,'Anna', 'Nixon', 'UK', NULL);

INSERT INTO customers (customerid, firstname, lastname)
VALUES (7, 'Max', 'Lang');

SELECT * 
FROM customers;




