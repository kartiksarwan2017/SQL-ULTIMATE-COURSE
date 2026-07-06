/********************** Round 1 – Easy (5 Questions) ***********************/
/* Q1
Display all customers from the USA who have placed at least one order. Show:
Customer Full Name
Order ID
Sales
*/
SELECT CONCAT(c.firstname, " ", c.lastname) AS customer_fullname,
	   COUNT(o.orderid) AS num_orders, 
       SUM(o.sales) AS total_sales
FROM customers c 
INNER JOIN orders o 
ON c.customerid = o.customerid
WHERE c.country = 'USA'
GROUP BY c.customerid
HAVING COUNT(o.orderid) > 1;

-- CORRECT QUERY
SELECT CONCAT(c.firstname, ' ', c.lastname) AS customer_fullname,
       o.orderid,
       o.sales
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
WHERE c.country = 'USA';


/*
Q2
Display products costing more than 20 along with the total quantity sold.
*/
SELECT p.product,
       SUM(p.price) AS product_costing,
       SUM(o.quantity) AS total_quantity_sold
FROM products p 
INNER JOIN orders o 
ON o.productid = p.productid
GROUP BY p.product
HAVING SUM(p.price) > 20;

-- CORRECT QUERY
SELECT p.product,
       p.price,
       SUM(o.quantity) AS total_quantity_sold
FROM products p
INNER JOIN orders o
ON p.productid = o.productid
WHERE p.price > 20
GROUP BY p.productid, p.product, p.price;

/*
Q3
Display employees whose first name starts with M and who handled at least one order.
*/
SELECT e.firstname,
       e.lastname,
	   COUNT(o.orderid) AS num_orders
FROM employees e 
INNER JOIN orders o 
ON e.employeeid = o.salespersonid
WHERE e.firstname LIKE 'M%'
GROUP BY e.employeeid, e.firstname, e.lastname
HAVING COUNT(o.orderid) > 1;

-- CORRECT QUERY
/* Should be
SQL
HAVING COUNT(...) >= 1

or simply remove the HAVING because the INNER JOIN already guarantees at least one matching order. */
SELECT e.firstname,
       e.lastname,
	   COUNT(o.orderid) AS num_orders
FROM employees e 
INNER JOIN orders o 
ON e.employeeid = o.salespersonid
WHERE e.firstname LIKE 'M%'
GROUP BY e.employeeid, e.firstname, e.lastname
HAVING COUNT(o.orderid) >= 1;

/*
Q4
Display each order with:
Customer Name
Product Name
Salesperson Name
Order by orderdate descending.
*/
SELECT o.orderid,
       o.orderdate,
       c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       p.product,
       e.firstname AS employee_firstname,
       e.lastname AS employee_lastname
FROM orders o 
INNER JOIN customers c 
ON c.customerid = o.customerid 
INNER JOIN products p 
ON p.productid = o.productid
INNER JOIN employees e
ON e.employeeid = o.salespersonid
ORDER BY o.orderdate DESC;


/*
Q5
Find the average salary for each department where the average salary is greater than 60,000.
*/
SELECT department,
       AVG(salary) AS avg_salary
FROM employees 
GROUP BY department
HAVING AVG(salary) > 60000;


/************************  Round 2 – Medium (5 Questions)  ******************************/
/* 
Q6
Display each customer with:
Total Orders
Total Sales
Average Sale
Sort by Total Sales descending.
*/
SELECT c.firstname,
       c.lastname,
       SUM(o.orderid) AS total_orders,
       SUM(o.sales) AS total_sales,
       AVG(o.sales) AS avg_sales
FROM customers c 
INNER JOIN orders o 
ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname
ORDER BY SUM(o.sales) DESC;

-- CORRECT QUERY
SELECT c.firstname,
       c.lastname,
       COUNT(o.orderid) AS total_orders,
       SUM(o.sales) AS total_sales,
       AVG(o.sales) AS average_sale
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname
ORDER BY total_sales DESC;


/* 
Q7
Find all products that have never been ordered.
*/
SELECT p.product
FROM products p 
LEFT JOIN orders o 
ON p.productid = o.productid
WHERE o.orderid IS NULL;

/* 
Q8
Display every product category with:
Total Orders
Total Quantity
Total Revenue
*/
SELECT p.category,
       COUNT(o.orderid) AS total_orders,
       SUM(o.quantity) AS total_quantity,
       SUM(o.sales) AS total_revenue
FROM products p 
INNER JOIN orders o 
ON p.productid = o.productid
GROUP BY p.category;

/* 
Q9
Find salespersons who handled more than 2 orders and generated total sales greater than 100.
*/
SELECT e.firstname,
       e.lastname,
       COUNT(o.orderid) AS total_orders,
	   SUM(o.sales) AS total_sales
FROM employees e 
INNER JOIN orders o 
ON e.employeeid = o.salespersonid
GROUP BY e.employeeid, e.firstname, e.lastname
HAVING COUNT(o.orderid) > 1 AND SUM(o.sales) > 100;

-- CORRECT QUERY
SELECT e.firstname,
       e.lastname,
       COUNT(o.orderid) AS total_orders,
	   SUM(o.sales) AS total_sales
FROM employees e 
INNER JOIN orders o 
ON e.employeeid = o.salespersonid
GROUP BY e.employeeid, e.firstname, e.lastname
HAVING COUNT(o.orderid) > 2 AND SUM(o.sales) > 100;


/* 
Q10
Display customers whose total quantity ordered is above the average quantity ordered by all customers.
(Hint: Subquery)
*/
SELECT c.firstname,
       c.lastname,
       SUM(o.quantity) AS total_quantity
FROM customers c 
INNER JOIN orders o 
ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname
HAVING SUM(o.quantity) > (
	   SELECT AVG(quantity)
       FROM orders
);


/************** Round 3 – String Functions + Aggregates (5 Questions) *********************/
/* 
Q11
Display customer initials and total sales.
Example:
JB   250
MB   180
*/
SELECT CONCAT(SUBSTRING(c.firstname, 1, 1), SUBSTRING(c.lastname, 1, 1)) AS customer_initials,
       SUM(o.sales) AS total_sales
FROM customers c 
INNER JOIN orders o 
ON c.customerid = o.customerid
GROUP BY c.customerid;


/* 
Q12
Display product names in uppercase with total revenue.
*/
SELECT UPPER(p.product) AS product_name,
       SUM(o.sales) AS total_revenue
FROM products p 
INNER JOIN orders o 
ON p.productid = o.productid
GROUP BY p.product;

/* 
Q13
Display departments using only the first three characters and show employee count.

our query works.

However

SQL
GROUP BY department
after aliasing can be confusing.
Better:
SQL
GROUP BY employees.department
or
SQL
GROUP BY department
using the original column name consistently.
Minor point.
*/
SELECT SUBSTRING(department, 1, 3) AS department,
	   COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- CORRECT QUERY
SELECT SUBSTRING(department, 1, 3) AS department,
	   COUNT(*) AS employee_count
FROM employees
GROUP BY employees.department;

/* 
Q14
Display employees whose first name length is greater than 5.
*/
SELECT *
FROM employees
WHERE LENGTH(firstname) > 5;

/* 
Q15
Display customer full names in lowercase and total orders.
*/
SELECT LOWER(CONCAT(c.firstname, " ", c.lastname)) AS customer_fullname,
       COUNT(o.orderid) AS total_orders
FROM customers c
INNER JOIN orders o 
ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname;

/**********************  Round 4 – JOIN + HAVING + WHERE (5 Questions)  *****************************/
/*
Q16
Display German customers whose total sales exceed 30.
*/
SELECT c.firstname, 
	   c.lastname,
       SUM(o.sales) AS total_sales
FROM customers c
INNER JOIN orders o 
ON c.customerid = o.customerid 
WHERE c.country = 'Germany'
GROUP BY c.customerid, c.firstname, c.lastname
HAVING SUM(o.sales) > 30;

/*
Q17
Display Clothing products whose average sales exceed 25.
*/
SELECT p.product,
       AVG(o.sales) AS avg_sales
FROM products p 
INNER JOIN orders o 
ON p.productid = o.productid
WHERE p.category = 'Clothing'
GROUP BY p.product
HAVING AVG(o.sales) > 25;

/*
Q18
Display employees who never handled any order.
*/
SELECT e.firstname, e.lastname
FROM employees e 
LEFT JOIN orders o 
ON e.employeeid = o.salespersonid
WHERE o.orderid IS NULL;


/*
Q19
Display customers who bought more than 3 items in total.
*/
SELECT c.firstname, 
       c.lastname,
       SUM(o.quantity) AS total_quantity
FROM customers c
INNER JOIN orders o 
ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname
HAVING SUM(o.quantity) > 3;

/*
Q20
Display the salesperson who generated the highest total revenue.
*/
SELECT e.firstname,
       e.lastname,
       SUM(o.sales) AS total_revenue
FROM employees e 
INNER JOIN orders o 
ON e.employeeid = o.salespersonid
GROUP BY e.employeeid, e.firstname, e.lastname
ORDER BY total_revenue DESC
LIMIT 1;

/*********************** Round 5 – Business Report (5 Questions) ***********************/
/*
Q21
Create a product report showing:
Product Name
Category
Orders
Quantity
Revenue
Average Revenue
Highest Sale
Lowest Sale
Sort by Revenue descending.
*/

/*
This is your biggest mistake.
You joined
SQL
ON o.orderid = p.productid
It should be
SQL
ON o.productid = p.productid
This kind of incorrect join key is something interviewers watch for closely.
*/
SELECT p.product, 
       p.category,
	   COUNT(o.orderid) AS total_orders,
	   SUM(o.quantity)  AS total_quantity,
       SUM(sales) AS revenue,
       AVG(o.sales) AS avg_revenue,
       MAX(o.sales) AS highest_sales,
       MIN(o.sales) AS lowest_sales
FROM products p 
INNER JOIN orders o 
ON o.orderid = p.productid
GROUP BY p.category, p.productid, p.product
ORDER BY revenue DESC;

-- CORRECT QUERY
SELECT p.product,
       p.category,
       COUNT(o.orderid) AS total_orders,
       SUM(o.quantity) AS total_quantity,
       SUM(o.sales) AS revenue,
       AVG(o.sales) AS average_revenue,
       MAX(o.sales) AS highest_sale,
       MIN(o.sales) AS lowest_sale
FROM products p
INNER JOIN orders o
ON p.productid = o.productid
GROUP BY p.productid, p.product, p.category
ORDER BY revenue DESC;

/*

Q22
Create a customer report showing:
Customer Name
Country
Orders
Revenue
Average Sale
Sort alphabetically by customer.
*/
SELECT c.firstname,
       c.lastname,
       c.country,
       COUNT(o.orderid) AS total_orders,
       SUM(o.sales) AS total_revenue,
       AVG(o.sales) AS avg_sales
FROM customers c
INNER JOIN orders o 
ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname, c.country
ORDER BY c.firstname ASC, c.lastname ASC;

/*
Q23
Display each department with:
Employee Count
Total Salary
Average Salary
*/
SELECT department,
       COUNT(*) AS total_employees,
       SUM(salary) AS total_salary,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

/*
Q24
Display each country with:
Number of Customers
Highest Score
Lowest Score
Average Score
*/
SELECT country,
       COUNT(*) AS total_customers,
       MAX(score) AS highest_score,
       MIN(score) AS lowest_score,
       AVG(score) AS avg_score
FROM customers
GROUP BY country;

/*
Q25
Display each order with:
Customer Name
Product Name
Salesperson Name
Quantity
Sales
Order Status
*/
SELECT o.orderid,
       c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       p.product,
       e.firstname AS salesperson_firstname,
       e.lastname AS salesperson_lastname,
       SUM(o.quantity) AS total_quantity,
       SUM(o.sales) AS total_sales,
       o.orderstatus
FROM customers c 
INNER JOIN orders o 
ON c.customerid = o.customerid
INNER JOIN products p
ON p.productid = o.productid
INNER JOIN employees e 
ON e.employeeid = o.salespersonid 
GROUP BY c.customerid, c.firstname, c.lastname, e.employeeid, e.firstname, e.lastname, o.orderid;


/*
The question asked:

Display each order with its details.

You used

SQL

SUM(quantity)

SUM(sales)
Aggregation isn't necessary here because each row already represents one order.

You could simply select quantity and sales directly.

*/

-- CORRECT QUERY 
SELECT o.orderid,
       CONCAT(c.firstname,' ',c.lastname) AS customer_name,
       p.product,
       CONCAT(e.firstname,' ',e.lastname) AS salesperson_name,
       o.quantity,
       o.sales,
       o.orderstatus
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
INNER JOIN products p
ON o.productid = p.productid
INNER JOIN employees e
ON o.salespersonid = e.employeeid;




/**************** Round 6 – Interview Challenge (5 Questions) ****************/

/*
Q26
Find the customer who generated the highest total revenue.
*/
SELECT c.firstname, 
       c.lastname,
       MAX(o.sales) AS highest_total_revenue
FROM customers c 
INNER JOIN orders o 
ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname;

/*
Question

Customer with highest total revenue

You wrote

SQL

MAX(sales)
That returns the customer's highest single sale.

Instead:

SQL
SUM(sales)
then

SQL
ORDER BY SUM(sales) DESC
LIMIT 1
*/
SELECT c.firstname,
       c.lastname,
       SUM(o.sales) AS total_revenue
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname
ORDER BY total_revenue DESC
LIMIT 1;


/*
Q27
Find the product category that generated the highest revenue.
*/
SELECT p.category,
       SUM(o.sales) AS highest_revenue
FROM products p 
INNER JOIN orders o 
ON p.productid = o.productid
GROUP BY p.category
ORDER BY highest_revenue DESC 
LIMIT 1;


/*
Q28
Display the department having the highest average salary.
*/
SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 1;
       

/*
Q29
Find the salesperson with the maximum number of handled orders.
*/
SELECT e.firstname,
	   e.lastname,
       COUNT(o.orderid) AS num_orders
FROM employees e 
INNER JOIN orders o 
ON e.employeeid = o.salespersonid
GROUP BY e.employeeid, e.firstname, e.lastname
ORDER BY num_orders DESC 
LIMIT 1;


/*
Q30
Create a dashboard query showing in one row:
Total Customers
Total Employees
Total Products
Total Orders
Total Revenue
Average Sale
Highest Sale
Lowest Sale
Delivered Orders
Shipped Orders
*/
SELECT COUNT(c.customerid) AS total_customers,
	   COUNT(e.employeeid) AS total_employees,
       COUNT(p.productid) AS total_products,
       COUNT(o.orderid) AS total_orders,
       SUM(o.sales) AS total_revenue,
       AVG(o.sales) AS avg_sales,
       MAX(o.sales) AS highest_Sales,
       MIN(o.sales) AS lowest_Sales,
       o.orderstatus
FROM orders o 
INNER JOIN customers c 
ON c.customerid = o.customerid
INNER JOIN employees e 
ON e.employeeid = o.salespersonid
INNER JOIN products p 
ON p.productid = o.productid
GROUP BY c.customerid, e.employeeid, p.productid, o.orderid;

/*

This is another important one.

The question asked for one dashboard row.

Your query joins four tables and groups by multiple IDs, which produces many rows and inflates the counts because of the joins.

A dashboard query should return a single row. A common approach is to use scalar subqueries, for example:
*/
SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM employees) AS total_employees,
    (SELECT COUNT(*) FROM products) AS total_products,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_revenue,
    AVG(sales) AS average_sale,
    MAX(sales) AS highest_sale,
    MIN(sales) AS lowest_sale,
    SUM(CASE WHEN orderstatus = 'Delivered' THEN 1 ELSE 0 END) AS delivered_orders,
    SUM(CASE WHEN orderstatus = 'Shipped' THEN 1 ELSE 0 END) AS shipped_orders
FROM orders;



