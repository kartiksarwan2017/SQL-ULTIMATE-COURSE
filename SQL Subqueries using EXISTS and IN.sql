/*
SQL TASK
Find all orders placed from customers whose score higher than 500 using the customer ID
*/
/* Manual Steps: we have to run other query to get IDs */
SELECT *
FROM orders
WHERE customerid IN (2, 3, 6);

SELECT *
FROM customers
WHERE score > 500;

SELECT *
FROM orders
WHERE customerid IN (
		SELECT customerid
		FROM customers
		WHERE score > 500
);

SELECT * 
FROM orders AS o 
WHERE EXISTS (
      SELECT 1 
      FROM customers AS c
      WHERE c.customerid = o.customerid
      AND score > 500
);

