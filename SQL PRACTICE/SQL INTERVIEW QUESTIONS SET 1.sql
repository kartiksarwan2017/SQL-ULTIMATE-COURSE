/************************ ROUND 1 - Easy (Warm up) *****************************/
/* Q1 Display all customers from the USA ordered by score in descending order. */
SELECT *
FROM customers
WHERE country = 'USA'
ORDER BY score DESC;

/* Q2 Display the first name and salary of employees earning more than 60,000. */
SELECT firstname AS employee_firstname, 
       salary
FROM employees
WHERE salary > 60000;

/* Q3 Display all products whose category starts with 'C'. */
SELECT *
FROM products
WHERE category LIKE 'C%';

/* Q4 Display unique order statuses. */
SELECT DISTINCT orderstatus
FROM orders;

/* Q5 Find the total number of delivered orders. */
SELECT COUNT(*) AS total_delivered_orders
FROM orders
WHERE orderstatus = 'Delivered';

/* Q6 Find the average sales amount. */
SELECT AVG(sales) AS avg_sales
FROM orders;

/* Q7 Display all customers whose first name contains 'a'. */
SELECT *
FROM customers 
WHERE firstname LIKE '%a%';

/* Q8 Display all employees ordered by salary from highest to lowest. */
SELECT *
FROM employees
ORDER BY salary DESC;

/* Q9 Display products priced between 15 and 30.
(Use comparison operators only if you haven't learned BETWEEN.)
*/
SELECT *
FROM products
WHERE price BETWEEN 15 AND 30;

SELECT *
FROM products 
WHERE price >= 15 AND price <= 30;

/* Q10 Find the highest customer score. */
SELECT MAX(score) AS highest_score
FROM customers;

/*******************  Round 2 – JOINs  ************************/
/*
Q11
Display:

Order ID
Customer Name
Product Name

*/
SELECT o.orderid,
       c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       p.product AS product_name
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
INNER JOIN products p
ON o.productid = p.productid;

/*
Q12
Display:
Customer Name
Salesperson Name
Order Status
*/
SELECT c.firstname AS customer_firstname,
	   c.lastname AS customer_lastname,
       e.firstname AS salesperson_firstname,
       e.lastname AS salesperson_lastname,
       o.orderstatus
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
INNER JOIN employees e 
ON o.salespersonid = e.employeeid;


/* Q13 Display all customers, including those without orders. */
SELECT c.firstname,
       c.lastname,
       o.orderid
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid;

/* Q14 Display all products, including products that have never been ordered. */
SELECT p.product,
	   o.orderid
FROM products p
LEFT JOIN orders o
ON p.productid = o.productid;

/* Q15 Display all employees and the orders they handled. */
SELECT e.firstname,
       e.lastname,
       o.orderid
FROM employees e
LEFT JOIN orders o
ON e.employeeid = o.salespersonid
WHERE o.salespersonid IS NOT NULL;

/* Q16 Display all customers and orders using a FULL JOIN (UNION). */
SELECT c.firstname,
       c.lastname,
       o.orderid
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid
UNION
SELECT c.firstname,
       c.lastname,
       o.orderid
FROM customers c
RIGHT JOIN orders o
ON c.customerid = o.customerid;

/* Q17 Display all products and quantities ordered. */
SELECT p.product,
       SUM(o.quantity) AS total_quantity
FROM products p
LEFT JOIN orders o
ON p.productid = o.productid
GROUP BY p.product;

-- BETTER WAY
SELECT p.product,
       COALESCE(SUM(o.quantity), 0) AS total_quantity
FROM products p
LEFT JOIN orders o
ON p.productid = o.productid
GROUP BY p.product;

/* Q18 Display customer names and order dates ordered by the latest order first. */
SELECT c.firstname,
       c.lastname,
       o.orderdate
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
ORDER BY o.orderdate DESC;

/* Q19 Display all delivered orders with customer and product names. */
SELECT c.firstname,
	   c.lastname,
	   p.product,
       o.orderstatus 
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
INNER JOIN products p
ON o.productid = p.productid
WHERE orderstatus = 'Delivered';


/* Q20 Display salesperson names along with the sales amount for every order. */
SELECT e.firstname,
       e.lastname,
       o.orderid,
       o.sales
FROM employees e
INNER JOIN orders o
ON e.employeeid = o.salespersonid;


/***********************  Round 3 – Aggregate + JOIN  ***************************/
/*  
Q21 Count the number of orders placed by each customer.
		Expected Output
		Customer Name | Total Orders
*/
SELECT c.firstname AS customer_firstname, 
       c.lastname As customer_lastname,
       COUNT(o.orderid) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
GROUP BY c.customerid;

        
/* Q22 Calculate the total sales made by each customer. */
SELECT c.firstname,
       c.lastname,
       SUM(o.sales) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
GROUP BY c.customerid;

/* Q23 Calculate the total quantity sold for each product. */
SELECT p.product,
       SUM(o.quantity) AS total_quantity
FROM products p
INNER JOIN orders o
ON p.productid = o.productid
GROUP BY p.productid;

/* Q24 Calculate the average sales amount for each salesperson. */
SELECT e.firstname,
       e.lastname,
       AVG(o.sales) AS avg_sales_amount
FROM employees e
INNER JOIN orders o
ON e.employeeid = o.salespersonid
GROUP BY e.employeeid;

/* Q25 Find the maximum sales handled by each salesperson. */
SELECT e.firstname,
       e.lastname,
       MAX(o.sales) AS max_sales
FROM employees e
INNER JOIN orders o
ON e.employeeid = o.salespersonid
GROUP BY e.employeeid;

/* Q26 Find the minimum sales for every customer. */
SELECT c.firstname,
       c.lastname,
	   MIN(o.sales) AS min_sales
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
GROUP BY c.customerid;

/* Q27 Count the number of delivered orders for each customer. */
SELECT c.firstname,
       c.lastname,
       COUNT(o.orderid) AS num_orders,
       o.orderstatus
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
WHERE o.orderstatus = 'Delivered'
GROUP BY c.customerid;

-- CLEANER VERSION
SELECT c.firstname,
       c.lastname,
       COUNT(o.orderid) AS delivered_orders
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
WHERE o.orderstatus = 'Delivered'
GROUP BY c.customerid;

/* Q28 Find the average quantity ordered for every product. */
SELECT p.product,
       AVG(o.quantity) AS avg_quantity
FROM products p
INNER JOIN orders o
ON p.productid = o.productid
GROUP BY p.productid;

/* Q29 Calculate the total revenue generated by each product. */
SELECT p.product,
       SUM(o.sales) AS total_revenue
FROM products p
INNER JOIN orders o
ON p.productid = o.productid
GROUP BY p.productid;

/* Q30 Find the highest sale for every customer. */
SELECT c.firstname,
       c.lastname,
       MAX(o.sales) AS max_sales
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
GROUP BY c.customerid;


/********************** Round 4 – Filtering + JOIN ****************************/
/* Q31 Display USA customers who placed delivered orders. */
SELECT c.firstname,
	   c.lastname,
       o.orderid
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
WHERE c.country = 'USA' AND o.orderstatus = 'Delivered';

/* Q32 Display Clothing products that were sold more than once. */
SELECT p.product,
       SUM(o.quantity) AS quantity_sold
FROM products p
INNER JOIN orders o
ON p.productid = o.productid
WHERE p.category = 'Clothing'
GROUP BY p.productid
HAVING SUM(o.quantity) > 1;


/* Q33 Display all Sales employees who handled orders. */
SELECT e.firstname,
	   e.lastname,
       o.orderid
FROM employees e
INNER JOIN orders o
ON e.employeeid = o.salespersonid
WHERE e.department = 'Sales';

/* Q34 Display orders where sales are greater than 30 along with customer names. */
SELECT c.firstname,
       c.lastname,
       o.orderid
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
WHERE o.sales > 30;

/* Q35 Display German customers whose score is greater than 400. */
SELECT firstname,
       lastname
FROM customers c
WHERE country = 'Germany' AND score > 400;

/* Q36 Display products costing more than 20 that were ordered. */
SELECT p.product
FROM products p
INNER JOIN orders o 
ON o.productid = p.productid
WHERE p.price > 20;

/* Q37 Display customers whose names start with 'M' and have placed orders. */
SELECT c.firstname,
       c.lastname
FROM customers c
INNER JOIN orders o 
ON c.customerid = o.customerid
WHERE c.firstname LIKE 'M%';

/* Q38 Display all shipped orders handled by employee Mary. */
SELECT o.orderid
FROM orders o
INNER JOIN employees e 
ON e.employeeid = o.salespersonid
WHERE o.orderstatus = 'Shipped' AND e.firstname = 'Mary';

/* Q39 Display orders placed after '2025-02-01' with customer names. */
SELECT o.orderid,
       c.firstname,
	   c.lastname
FROM orders o 
INNER JOIN customers c 
ON c.customerid = o.customerid
WHERE o.orderdate > '2025-02-01';

/* Q40 Display orders whose quantity is 0. */
SELECT *
FROM orders 
WHERE quantity = 0;


/************* Round 5 – Mixed Interview Questions ***************/
/* Q41 Find the customer with the highest score. */
SELECT firstname,
       lastname,
       score
FROM customers
ORDER BY score DESC
LIMIT 1;


/* Q42 Find the product with the highest price. */
SELECT product, 
	   price
FROM products
ORDER BY price DESC
LIMIT 1;


/* Q43 Calculate total sales of delivered orders. */
SELECT SUM(sales) AS total_sales
FROM orders 
WHERE orderstatus = 'Delivered';

/* Q44 Count how many customers belong to each country. */
SELECT country,
       COUNT(*) AS num_customers
FROM customers
GROUP BY country;

/* Q45 Find the total salary paid to employees. */
SELECT firstname, 
       lastname,
       SUM(salary) AS total_salary
FROM employees
GROUP BY employeeid;

-- CORRECT QUERY
SELECT SUM(salary) AS total_salary
FROM employees;

/* Q46 Display all customers without any orders.
    (Use LEFT JOIN.) */
SELECT c.firstname,
       c.lastname
FROM customers c 
LEFT JOIN orders o 
ON c.customerid = o.customerid
WHERE o.orderid IS NULL;

/* Q47 Display all products that were never ordered. */
SELECT p.product 
FROM products p
LEFT JOIN orders o 
ON o.productid = p.productid
WHERE o.orderid IS NULL;

/* Q48 Display all employees who never handled an order. */
SELECT e.firstname,
       e.lastname
FROM employees e 
LEFT JOIN orders o 
ON e.employeeid = o.salespersonid
WHERE o.orderid IS NULL;

/* Q49 Find the earliest order date. */
SELECT MIN(orderdate) AS earliest_order_date
FROM orders;

/*
Q50 Display one report containing:

Order ID
Customer Name
Product Name
Salesperson Name
Quantity
Sales
Order Date
Order Status
*/
SELECT o.orderid, c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       p.product AS product_name,
	   e.firstname AS salesperson_firstname,
       e.lastname AS salesperson_lastname,
       o.quantity,
       o.sales,
       o.orderdate,
       o.orderstatus
FROM orders o
INNER JOIN customers c 
ON o.customerid = c.customerid
INNER JOIN employees e 
ON e.employeeid = o.salespersonid
INNER JOIN products p 
ON p.productid = o.productid;


/**************  Bonus Interview Questions (Slightly Challenging)   ******************/
/* Q51 Display all customers who placed more than one order. */
SELECT c.firstname,
       c.lastname,
       COUNT(o.orderid) AS num_orders
FROM customers c 
INNER JOIN orders o 
ON c.customerid = o.customerid
GROUP BY c.customerid
HAVING COUNT(o.orderid) > 1;

/* Q52 Find customers whose total sales are greater than 50. */
SELECT c.firstname,
       c.lastname,
       SUM(o.sales) AS total_sales
FROM customers c
INNER JOIN orders o 
ON c.customerid = o.customerid
GROUP BY c.customerid
HAVING SUM(o.sales) > 50;

/* Q53 Find the product that generated the highest total sales. */
SELECT p.product,
       SUM(o.sales) AS total_sales
FROM products p
INNER JOIN orders o
ON p.productid = o.productid
GROUP BY p.productid
ORDER BY total_sales DESC
LIMIT 1;


/* Q54 Find the customer who bought the highest quantity. */
SELECT c.firstname,
       c.lastname,
       o.quantity
FROM customers c 
INNER JOIN orders o 
ON c.customerid = o.customerid
ORDER BY o.quantity DESC
LIMIT 1;

-- CORRECT QUERY


/* Q55 Display the top 3 highest sales. 
(If you haven't learned LIMIT, you can skip this for now.) */
SELECT sales AS top_three_highest_sales
FROM orders 
ORDER BY sales DESC
LIMIT 3;

/* Q56 Find the difference between the highest and lowest employee salary. */
SELECT (MAX(salary) - MIN(salary)) AS salary_difference
FROM employees;


/* Q57 Find customers whose score is higher than the average customer score. 
(Save this until you've learned subqueries.) */
SELECT *
FROM customers 
WHERE score > (
      SELECT AVG(score)
      FROM customers
);


/* Q58 Find employees whose salary is above the average salary. 
(Also for after subqueries.) */
SELECT *
FROM employees 
WHERE salary > (
      SELECT AVG(salary)
      FROM employees
);

/* Q59 Find the average sales for delivered and shipped orders separately. */
SELECT AVG(sales) AS avg_sales
FROM orders
WHERE orderstatus = 'Delivered';

SELECT AVG(sales) AS avg_sales
FROM orders
WHERE orderstatus = 'Shipped';

-- CORRECT WAY
SELECT orderstatus,
       AVG(sales) AS avg_sales
FROM orders 
GROUP BY orderstatus;

/* Q60 Create a report showing:
Customer Name
Number of Orders
Total Sales
Average Sales
Highest Sale
Lowest Sale 
*/
SELECT c.firstname,
       c.lastname,
       COUNT(o.orderid) AS num_orders,
       SUM(o.sales) AS total_sales,
       AVG(o.sales) AS avg_sales,
       MAX(o.sales) AS max_sales,
       MIN(o.sales) AS min_sales
FROM customers c 
INNER JOIN orders o 
ON c.customerid = o.customerid
GROUP BY c.customerid;











