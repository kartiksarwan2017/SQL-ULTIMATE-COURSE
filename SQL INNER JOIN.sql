/* 
List customer ID, first name, order ID, quantity. Exclude the customers who have not placed any orders.
*/
SELECT c.customerid, c.firstname, o.orderid, o.quantity
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid;


