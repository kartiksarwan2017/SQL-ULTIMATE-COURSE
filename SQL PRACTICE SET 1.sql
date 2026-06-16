/* Part 1: SELECT (10 Questions) */
/* 1. Show all columns from customers. */
SELECT *
FROM customers;

/* 2. Show firstname and lastname from customers. */
SELECT firstname, lastname
FROM customers;

/* 3. Show customer full name as full_name. */
SELECT CONCAT(firstname, " ", lastname) AS full_name
FROM customers;

/* 4. Show all unique countries from customers. */
SELECT DISTINCT country
FROM customers;

/* 5. Show all employees first names in alphabetical order. */
SELECT firstname
FROM employees
ORDER BY firstname ASC;

/* 6. Show employees sorted by salary (highest first). */
SELECT *
FROM employees
ORDER BY salary DESC;


/* 7. Show products sorted by price (lowest to highest). */
SELECT *
FROM products
ORDER BY price ASC;

/* 8. Show top 5 rows from orders. */
SELECT *
FROM orders
LIMIT 5;

/* 9. Show orderid and sales as total_sales. */
SELECT orderid,
       sales AS total_sales
FROM orders;

/* 10. Show unique order statuses. */
SELECT DISTINCT orderstatus
FROM orders;

/*************************   PART 2: WHERE Conditions (20 Questions)   *********************************/
/** Basic Filtering  **/
/* 1. Customers from USA */
SELECT *
FROM customers
WHERE country = 'USA';


/* 2. Customers from Germany */
SELECT *
FROM customers
WHERE country = 'Germany';


/* 3. Employees with salary > 60000 */
SELECT *
FROM employees
WHERE salary > 60000;

/* 4. Empoyees with salary < 70000 */
SELECT *
FROM employees
WHERE salary < 70000;


/* 5. Employees with salary = 55000 */
SELECT *
FROM employees
WHERE salary = 55000;

/* 6. Employees with salary != 55000 */
SELECT *
FROM employees
WHERE salary != 55000;

-- Alternative way
SELECT *
FROM employees
WHERE salary <> 55000;


/* NULL Handling (VERY IMPORTANT) */
/* 7. Customers where lastname is NULL */
SELECT *
FROM customers
WHERE lastname IS NULL;

/* 8. Customers where score is NOT NULL */
SELECT *
FROM customers 
WHERE score IS NOT NULL;

/* 9. Orders where shipaddress is NULL */
SELECT *
FROM orders
WHERE shipaddress IS NULL;


/* 10. Orders where billaddress is NOT NULL */
SELECT *
FROM orders
WHERE billaddress IS NOT NULL;


/*********    BETWEEN / IN   *************/
/* 11. Employees with salary between 50000 and 80000 */
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 80000;


SELECT *
FROM employees
WHERE salary >= 50000 AND salary <= 80000;


/* 12. Customers from USA or Germany */
SELECT *
FROM customers
WHERE country = 'USA' OR country = 'Germany';

SELECT *
FROM customers
WHERE country IN ('USA', 'Germany');


/* 13. Orders with orderid IN (1, 3, 5) */
SELECT *
FROM orders
WHERE orderid IN (1, 3, 5);


/* 14. Employees NOT in Marketing department */
SELECT *
FROM employees
WHERE department = 'Marketing';


/*******   LIKE (Pattern)    *********/
/* 15. Customers whose firstname starts with 'M' */
SELECT *
FROM customers
WHERE firstname LIKE 'M%';

/* 16. Employees whose lastname ends with 'n' */
SELECT *
FROM employees
WHERE lastname LIKE '%n';


/* 17. Products containing 'o' in name */
SELECT *
FROM products
WHERE product LIKE '%o%';


/* 18. Customers with exactly 5-letter firstname */
SELECT *
FROM customers
WHERE firstname LIKE '_____';


/****************  Combined Conditions  *******************/
/* 19. Employees from Sales with salary > 60000 */
SELECT *
FROM employees
WHERE salary > 60000;

/* 20. Orders with sales > 20 AND status = 'Delivered' */
SELECT *
FROM orders
WHERE sales > 20 AND orderstatus = 'Delivered';


/********************  PART 3: DML (10 Questions)  ****************************/
/* 1. Insert a new customer into customers table. */
INSERT INTO customers 
VALUES (6, 'Shri', 'Krishna', 'Vaikunth', 1000);

SELECT *
FROM customers;


/* 2. Insert 2 new employees */
INSERT INTO employees
VALUES (6, 'Kartik', 'Sarwan', 'IT', '1999-10-27', 'M', 54000, 5);

DESC employees;

SELECT *
FROM employees;

/* 3. Insert a new product. */
INSERT INTO products
VALUES (106, 'Bhagavad Gita', 'Book', 250);

SELECT *
FROM products;

/* 4. Update salary of employee with id = 1 to 60000  */
UPDATE employees
SET salary = 60000
WHERE employeeid = 1;

SELECT *
FROM employees;

/* 5. Increase salary of all Sales employees by 10% */
SELECT ((salary * 10)/100) AS increased_salary
FROM employees;


/* 6. Update country of all customers from 'USA' to 'United States' */
UPDATE customers
SET country = 'United States'
WHERE country = 'USA';

/* 7. Delete customer with id = 5 */
DELETE FROM customers
WHERE customerid = 5;

SELECT *
FROM customers;

/* 8. Delete orders where quantity = 0 */
DELETE FROM orders
WHERE quantity = 0;

/* 9. Delete all records from orders_archive (but keep table) */
TRUNCATE TABLE orders_archive;

SELECT *
FROM orders_archive;

/* 10. Insert a new order with NULL shipaddress. */
INSERT INTO orders (orderid, productid, customerid, salespersonid, orderdate, shipdate, orderstatus, shipaddress, billaddress, quantity, sales, creationtime)
VALUES (11, 103, 5, 7, '2026-04-15', '2026-04-12', 'Shipped', 'F-3 Shree Guru Ram Krishna Hou Soc Pashan', 'Pashan', 20, 100, '2026-04-16 11:40:00');

SELECT  *
FROM orders;

/************   Part 4: DDL (Data Definition Language) 10 questions  **************/
/* 1. Create a new table suppliers (supplier_id, name, country) */
CREATE TABLE suppliers (
    supplier_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    CONSTRAINT supplier_id PRIMARY KEY(supplier_id)
);

DESC suppliers;

SELECT *
FROM suppliers;

/* 2. Add column email to suppliers */
ALTER TABLE suppliers
ADD COLUMN email VARCHAR(100);

SELECT *
FROM suppliers;

/* 3. Modify name to VARCHAR(100) */
ALTER TABLE suppliers
MODIFY COLUMN name VARCHAR(100);

DESC suppliers;
SELECT * FROM suppliers;

/* 4. Rename column name to supplier_name */
ALTER TABLE suppliers
RENAME COLUMN name TO supplier_name;

SELECT *
FROM suppliers;

/* 5. Drop column email */
ALTER TABLE suppliers
DROP COLUMN email;

SELECT *
FROM suppliers;


/* 6. Rename table suppliers to vendors */
RENAME TABLE suppliers 
TO vendors;

SELECT *
FROM vendors;

/* 7. Drop table vendors */
DROP TABLE vendors;


/* 8. Add NOT NULL contraint to product name */
ALTER TABLE products
MODIFY product VARCHAR(50) NOT NULL;

SELECT *
FROM products;


/* 9. Add CHECK contraint: price > 0 */
ALTER TABLE products
ADD CHECK (price > 0);

DESC products;

SELECT *
FROM products;


/* 10. Create a table payments with: 
       payment_id (PK)
       order_id
       amount
 */
CREATE TABLE payments (
     payment_id INT NOT NULL PRIMARY KEY,
     order_id INT NOT NULL,
     amount INT
);

DESC payments;

SELECT *
FROM payments;

/***********************  Phase 1: Filtering & Sorting  ******************************/
/* 1. The WHERE Clause 
	  Select the firstname, lastname, and score of all customers from the USA who have a score greater than 800. 
*/
SELECT firstname, lastname, score
FROM customers
WHERE country = 'USA' 
AND score > 800;

/* 2. The ORDER BY Clause
      List of products from the products table. Display the product name and price, and sort them by price in descending order.
*/
SELECT product, price
FROM products
ORDER BY price DESC;


/* 3. The DISTINCT Keyword
      Write a query to find all unique countries represented in the customers table. (No duplicates should appear in your results).
 */
SELECT DISTINCT country
FROM customers;


/* 4. The LIKE Operator
      Find all employees whose lastname starts with the letter 'B'. 
*/
SELECT *
FROM employees
WHERE lastname LIKE 'B%';


/* 5. The BETWEEN & AND Operators
      Select all orders from the orders table where the orderdate is between '2025-01-01' and '2025-01-31'. 
*/
SELECT *
FROM orders
WHERE orderdate 
BETWEEN '2025-01-01' AND '2025-01-31';


/*************************  Phase 2: Aggregating & Grouping (The Logic)  *******************************/
/*
6. The GROUP BY Clause
Count how many customers you have in each country. Your output should show the country and the total_customers
*/
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;


/*
7. Aggregate Functions (SUM & AVG)
Calculate the total sales and the average quantity sold across all entries in the orders table.
*/
SELECT SUM(sales) AS total_sales, 
       AVG(quantity) AS avg_quantity
FROM orders;

/*
8. The HAVING Clause
Find the departments in the employees table that have an average salary higher than 60,000. (Note: You must use GROUP BY and HAVING for this).
*/
SELECT department
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

/*
9. The LIMIT Clause
   Select the top 3 highest-paid employees from the employees table.
*/
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;

/*
10. Handling NULLs (IS NULL)
    Identify all customers who do not have a score assigned (where the score is NULL).
*/
SELECT *
FROM customers
WHERE score IS NULL;


/* 
Retrieve all data for customers and orders in two different results.
*/
SELECT *
FROM customers;

SELECT *
FROM orders;

/* 
   BASIC SELECT Queries 
   Assume table: Employees
*/
/*
  Questions
  1. Select all employees
*/
SELECT *
FROM employees;

/* Part 1 - SELECT Basics */
/* 1. Show all columns from customers */
SELECT *
FROM customers;

/* 2. Show only firstname and country from customers. */
SELECT firstname, country
FROM customers;

/* 3. Display all records from products */
SELECT *
FROM products;

/* 4. Show product name and price from products. */
SELECT product, price
FROM products;

/* 5. Display all employees */
SELECT *
FROM employees;

/* Part 2 - WHERE Clause */
/* 6. Show customers from USA */
SELECT *
FROM customers
WHERE country = 'USA';

/* 7. Show employees whose salary is greater than 60000 */
SELECT *
FROM employees
WHERE salary > 60000;

/* 8. Display products whose category is Clothing. */
SELECT *
FROM products
WHERE category = 'Clothing';

/* 9. Show orders where quantity = 2 */
SELECT *
FROM orders
WHERE quantity = 2;

/* 10. Display employees whose department is Sales */
SELECT *
FROM employees
WHERE department = 'Sales';

/* PART 3 Comparison Operators */
/* 11. Show customers whose score is less than 800. */
SELECT *
FROM customers
WHERE score < 800;

/* 12. Display products whose price is greater than or equal to 20. */
SELECT *
FROM products
WHERE price >= 20;

/* 13. Show employees whose salary is not equal to 55000. */
SELECT *
FROM employees
WHERE salary != 55000;

/* 14. Display orders where sales > 30 */
SELECT *
FROM orders 
WHERE sales > 30;


/* PART 4 - AND / OR */
/* 15. Show employees working in Sales AND salary > 70000 */
SELECT *
FROM employees
WHERE department = 'Sales' 
AND salary > 70000;

/* 16. Show customers from Germany OR USA */
SELECT *
FROM customers 
WHERE country = 'Germany' OR 'USA';

/* 17. Show products where category is Clothing AND price > 20 */
SELECT *
FROM products
WHERE category = 'Clothing'
AND price > 20;

/* 18. Display orders where status is Delivered OR Shipped */
SELECT *
FROM orders
WHERE status = 'Delivered' OR status = 'Shipped';

SELECT *
FROM orders
WHERE orderstatus IN ('Delivered', 'Shipped');

/* PART 5 - IN / NOT IN */
/* 19. Show employees whose department is IN ('Sales', 'Marketing') */
SELECT *
FROM employees
WHERE department IN ('Sales', 'Marketing');

/* 20. Show customers whose country is NOT IN ('USA') */
SELECT *
FROM customers 
WHERE country NOT IN ('USA');

/* 21. Display products whose category is IN ('Accessories', 'Clothing') */
SELECT *
FROM products
WHERE category IN ('Accessories', 'Clothing');

/* PART 6 - BETWEEN */
/* 22. Show employees whose salary is between 55000 and 80000 */
SELECT *
FROM employees
WHERE salary BETWEEN 55000 AND 80000;

/* 23. Display products whose price is between 10 and 25 */
SELECT *
FROM products 
WHERE price BETWEEN 10 AND 25;

/* 24. Show customers whose score is NOT BETWEEN 300 and 800 */
SELECT *
FROM customers
WHERE score NOT BETWEEN 300 AND 800;

/* PART 7 - LIKE */
/* 25. Show customers whose first name starts with 'M' */
SELECT *
FROM customers
WHERE firstname LIKE 'M%';

/* 26. Show employees whose last name ends with 'r'. */
SELECT *
FROM employees
WHERE lastname LIKE '%r';

/* 27. Display products whose product name contains 'o' */
SELECT *
FROM products
WHERE product = '%o%';

/* 28. Show customers whose first name has exactly 5 characters. */
SELECT *
FROM customers 
WHERE firstname LIKE '_____';

/* PART 8 - Aggregate Functions */
/* 29. Count total customers */
SELECT COUNT(*) AS total_customers
FROM customers;

/* 30. Find maximum salary from employees */
SELECT MAX(salary) AS max_salary
FROM employees;


/* 31. Find minimum product price */
SELECT MIN(price) AS min_product_price
FROM products;

/* 32. Find average customers score */
SELECT AVG(score) AS avg_score
FROM customers;  

/* 33. Find total sales from orders. */
SELECT SUM(sales) AS total_sales
FROM orders;

/* PART 9 - GROUP BY (Beginner) */
/* 34 Count employees in each department */
SELECT COUNT(*) AS num_employees
FROM department;








