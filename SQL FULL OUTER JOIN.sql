/*  
SQL TASK
List customer ID, first name, order ID, quantity. Include everything All customers and All orders.
*/
SELECT c.customerid,
       c.firstname,
	   o.orderid,
       o.quantity
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid
UNION
SELECT c.customerid,
       c.firstname,
       o.orderid,
       o.quantity
FROM customers c
RIGHT JOIN orders o
ON c.customerid = o.customerid;  