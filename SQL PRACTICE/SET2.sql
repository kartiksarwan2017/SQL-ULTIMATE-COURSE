/******************* PART A - INNER JOIN (Revision) ******************/
/* Q1 Display all customers who have placed orders. 
      Output:
		customerid
		firstname
		orderid
*/
SELECT c.customerid,
       c.firstname AS customer_firstname,
	   o.orderid
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid;  

/* Q2 Display each order along with its product name. */
SELECT o.orderid, 
       p.product AS product_name
FROM orders o
INNER JOIN products p
ON o.productid = p.productid;

/* Q3 Display customer name, product name, and sales amount. */
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       p.product AS product_name,
       o.sales
FROM orders o
INNER JOIN customers c
ON c.customerid = o.customerid
INNER JOIN products p
ON p.productid = o.productid;

/* Q4 Display salesperson name, customer name, and order status. */
SELECT e.firstname AS salesperson_firstname,
       e.lastname AS salesperson_lastname,
       c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       o.orderstatus 
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
INNER JOIN employees e
ON e.employeeid = o.salespersonid;

/* Q5 Display all delivered orders with customer and product names. */
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       p.product AS product_name,
       o.orderstatus
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
INNER JOIN products p
ON o.productid = p.productid
WHERE o.orderstatus = 'Delivered';

/************* Part B – LEFT JOIN *****************/
/* 
Q6 Display all customers along with their orders, including customers who have never placed an order. 
*/
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       o.orderid
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid;


/* 
Q7
Display all products along with their orders, including products that have never been ordered.
*/
SELECT p.product AS product_name,
       o.orderid 
FROM products p
LEFT JOIN orders o
ON p.productid = o.productid;


/* 
Q8
Display all employees along with the orders they handled, including employees who handled no orders.
*/
SELECT e.firstname AS employee_firstname,
       e.lastname AS employee_lastname,
       o.orderid
FROM employees e
LEFT JOIN orders o
ON e.employeeid = o.salespersonid;


/* 
Q9
Display customer names and order dates. Include customers without orders.
*/
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       o.orderdate 
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid;


/* 
Q10
Display every product with its total ordered quantity. Include products that were never ordered.

The question asked for the total ordered quantity, not each individual order's quantity.
*/
SELECT p.product AS product_name,
       o.quantity AS total_ordered_quantity
FROM products p
LEFT JOIN orders o
ON p.productid = o.productid;


-- CORRECT QUERY
SELECT p.product AS product_name,
	   COALESCE(SUM(o.quantity), 0) AS total_ordered_quantity
FROM products p
LEFT JOIN orders o
ON p.productid = o.productid
GROUP BY p.product;


/************* Part C – RIGHT JOIN ***************/
/* Q11 Display all orders and their customers. Include every order even if customer information is missing. */
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       o.orderid 
FROM customers c
RIGHT JOIN orders o
ON c.customerid = o.customerid;


/* Q12  Display all orders with product names using RIGHT JOIN. */
SELECT p.product AS product_name,
       o.orderid
FROM products p
RIGHT JOIN orders o
ON p.productid = o.productid;

/* Q13 Display all orders with salesperson names using RIGHT JOIN. */
SELECT e.firstname AS salesperson_firstname,
       e.lastname AS salesperson_lastname,
       o.orderid
FROM employees e
RIGHT JOIN orders o
ON e.employeeid = o.salespersonid;


/* Q14 Display all customers and their sales using RIGHT JOIN. */
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       o.sales 
FROM orders o
RIGHT JOIN customers c
ON o.customerid = c.customerid;


/* Q15 Display all products and order IDs using RIGHT JOIN. */
SELECT p.product AS product_name,
       o.orderid
FROM orders o
RIGHT JOIN products p
ON o.productid = o.productid;

/**************************  Part D - FULL JOIN  (MySQL)  *********************************/
/* Q16 Display all customers and orders using FULL JOIN. */
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       o.orderid 
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid
UNION
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       o.orderid
FROM customers c
RIGHT JOIN orders o
ON c.customerid = o.customerid;

/* Q17 Display all products and orders using FULL JOIN. */
SELECT p.product AS product_name,
       o.orderid
FROM products p
LEFT JOIN orders o
ON p.productid = o.productid
UNION
SELECT p.product AS product_name,
       o.orderid
FROM products p
RIGHT JOIN orders o
ON p.productid = o.productid;
       
/* Q18 Display all employees and handled orders using FULL JOIN. */
SELECT e.firstname AS employee_firstname,
       e.lastname AS employee_lastname,
       o.orderid
FROM employees e
LEFT JOIN orders o
ON e.employeeid = o.salespersonid
UNION
SELECT e.firstname AS employee_firstname,
	   e.lastname AS employee_lastname,
       o.orderid
FROM employees e
RIGHT JOIN orders o
ON e.employeeid = o.salespersonid;

/* Q19 Display all customers and their sales. Include customers without orders and orders without customers. */
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       o.sales
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid
UNION
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       o.sales
FROM customers c
RIGHT JOIN orders o
ON c.customerid = o.customerid;

/* Q20 Display all products and quantities. Include products without orders. */
SELECT p.product AS product_name,
	   o.quantity 
FROM products p
LEFT JOIN orders o
ON p.productid = o.productid
UNION
SELECT p.product AS product_name,
       o.quantity 
FROM products p
RIGHT JOIN orders o
ON p.productid = o.productid;

















