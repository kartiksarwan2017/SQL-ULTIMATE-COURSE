/* 
SQL TASK
Find the total number of customers
*/
SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(customerid) AS total_customers
FROM customers;

/* 
SQL TASK
Find the total quantity of all orders
*/
SELECT SUM(quantity) AS total_quantity
FROM orders;

/*
SQL TASK
Find the average score of all customers
*/
SELECT AVG(score) AS avg_score
FROM customers;

/*
SQL TASK
Find the highest score of all customers
*/
SELECT MAX(score) AS max_score
FROM customers;

/* 
SQL TASK
Find the lowest score of all customers
*/
SELECT MIN(score) AS min_score
FROM customers;

/* SQL TASK
    Find the earliest and latest order dates.
*/
SELECT MIN(orderdate) AS min_orderdate,
	   MAX(orderdate) AS max_orderdate
FROM orders;

/******************** Level 1 – COUNT() ***********************/
/* Q1 Count the total number of customers */
SELECT COUNT(*) AS total_customers
FROM customers;

/* Q2 Count the total number of employees. */
SELECT COUNT(*) AS total_employees
FROM employees;

/* Q3 Count the total number of products. */
SELECT COUNT(*) AS total_products
FROM products;

/* Q4 Count the total number of orders. */
SELECT COUNT(*) AS total_orders
FROM orders;

/* Q5 Count the number of customers whose score is not NULL. */
SELECT COUNT(*) AS number_of_customers
FROM customers
WHERE score IS NOT NULL;

SELECT COUNT(score)
FROM customers;
 
/* Q6 Count the number of customers whose last name is NULL.  */
SELECT COUNT(*) AS num_of_customers
FROM customers
WHERE lastname IS NULL;

/* Q7 Count the number of delivered orders. */
SELECT COUNT(*) AS count_delivered_orders
FROM orders
WHERE orderstatus = 'Delivered';

/* Q8 Count the number of shipped orders. */
SELECT COUNT(*) AS count_shipped_orders
FROM orders
WHERE orderstatus = 'Shipped';

/***************************  Level 2 – SUM()  ********************************/
/* Q9 Calculate the total sales. */
SELECT SUM(sales) AS total_sales
FROM orders;

/* Q10 Calculate the total quantity ordered.  */
SELECT SUM(quantity) AS total_quantity
FROM orders;

/* Q11 Calculate the total salaries of all employees.  */
SELECT SUM(salary) AS total_salary
FROM employees;

/* Q12 Calculate the total price of all products.  */
SELECT SUM(price) AS total_price
FROM products;

/* Q13 Calculate the total sales for delivered orders only. */
SELECT SUM(sales) AS total_sales
FROM orders
WHERE orderstatus = 'Delivered';

/* Q14 Calculate the total sales for shipped orders only.  */
SELECT SUM(sales) AS total_sales
FROM orders
WHERE orderstatus = 'Shipped';


/***********  Level 3 – AVG()  **************/
/* Q15 Find the average salary of employees. */
SELECT AVG(salary) AS avg_salary
FROM employees;

/* Q16 Find the average product price. */
SELECT AVG(price) AS avg_product_price
FROM products;

/* Q17 Find the average customer score. */
SELECT AVG(score) AS avg_customer_score
FROM customers;

/* Q18 Find the average sales amount. */
SELECT AVG(sales) AS avg_sales 
FROM orders;

/* Q19 Find the average quantity ordered. */
SELECT AVG(quantity) AS avg_quantity
FROM orders;

/********* Interview-Level Questions for You **********/
/* Q20 Find the highest employee salary. */
SELECT MAX(salary) AS highest_salary
FROM employees;

/* Q21 Find the cheapest product. */
SELECT MIN(price) AS cheapest_product_price
FROM products;

/* Q22 Find the earliest order date. */
SELECT MIN(orderdate) AS earliest_order_date
FROM orders;

/* Q23 Find the latest ship date. */
SELECT MAX(shipdate) AS latest_ship_date
FROM orders;

/* Q24 Find the difference between the highest and lowest employee salary. */
SELECT (MAX(salary) - MIN(salary)) AS salary_difference
FROM employees;

/* Q25 Find the average sales of delivered orders. */
SELECT AVG(sales) AS avg_sales
FROM orders
WHERE orderstatus = 'Delivered';

/* Q26 Count how many orders have quantity = 0. */
SELECT COUNT(*) AS num_orders
FROM orders
WHERE quantity = 0;

/* Q27 Find the total sales of orders placed after '2025-02-01'. */
SELECT SUM(sales) AS total_sales
FROM orders
WHERE orderdate > '2025-02-01';

/* Q28 Find the highest customer score from the USA. */
SELECT MAX(score) AS max_score
FROM customers
WHERE country = 'USA';

/* Q29 Find the minimum salary among female employees. */
SELECT MIN(salary) AS min_salary
FROM employees
WHERE gender = 'F';

/*
Q30 (Interview Favorite)
Write a query that returns all five aggregate values in a single row:

Total Orders
Total Sales
Average Sales
Maximum Sale
Minimum Sale
using only the orders table.
*/
SELECT COUNT(*) AS total_orders, 
       SUM(sales) AS total_sales,
       AVG(sales) AS avg_sales,
       MAX(sales) AS maximum_sale,
       MIN(sales) AS minimum_sale
FROM orders;












