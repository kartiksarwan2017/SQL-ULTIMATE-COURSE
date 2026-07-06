/*
SQL TASK
List customer ID, first name, order ID, quantity. Include the customers who have not placed any orders.
*/
SELECT c.customerId,
       c.firstname,
       o.orderid,
       o.quantity
FROM customers c 
LEFT JOIN orders o
ON c.customerid = o.customerid;

 





