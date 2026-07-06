/*
SQL TASK
Delete both new customers Anna and MAX from our database.
*/
DELETE FROM customers 
WHERE customerid IN (5, 7);

SELECT *
FROM customers;

/* USE TRUNCATE instead of DELETE if you want to delete all rows from a table.
*/
TRUNCATE customers;