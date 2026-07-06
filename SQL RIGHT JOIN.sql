/* 
SQL TASK
List customer ID, first name, order ID, quanity. Include all orders, regardless of whether there is a
matching customer.
*/
SELECT c.customerId,
	   c.firstname,
	   o.orderid,
       o.quantity
FROM customers AS c
RIGHT JOIN orders o
ON c.customerid = o.customerid;


