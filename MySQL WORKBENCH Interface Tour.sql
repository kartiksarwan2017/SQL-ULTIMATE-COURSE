SELECT * FROM customers;
SELECT * FROM orders;

/* Add new lines for each keyword */
SELECT 
	c.customer_id,
	c.first_name,
	c.last_name,
	o.order_id,
	o.order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.country = 'Germany'
AND o.quantity > 100;






















