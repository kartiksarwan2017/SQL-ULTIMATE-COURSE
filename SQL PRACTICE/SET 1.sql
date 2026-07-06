/* Table: Employees */
-- 1. Display all employee details
SELECT *
FROM employees;

-- 2. Display only first name and last name.
SELECT firstname, lastname
FROM employees;

-- 3. Display first name, department, and salary.
SELECT firstname, department, salary
FROM employees;

-- 4. Display all employee IDs and departments.
SELECT employeeid, department
FROM employees;


/************ DISTINCT Questions ***************/
-- 5. Show all unique departments.
SELECT DISTINCT department
FROM employees;

-- 6. Show all unique genders.
SELECT DISTINCT gender
FROM employees;

-- 7. Show all unique salaries.
SELECT DISTINCT salary
FROM employees;

-- 8. Show unique department-gender combinations.
SELECT DISTINCT department, gender
FROM employees;

/**************** WHERE + Comparision Operators **********************/
-- 9. Find employees whose salary is greater than 60000.
SELECT *
FROM employees
WHERE salary > 60000;

-- 10. Find employees whose salary is less than 55000.
SELECT *
FROM employees
WHERE salary < 55000;

-- 11. Find employees whose department is IT.
SELECT *
FROM employees 
WHERE department = 'IT';

-- 12. Find employees whose gender is F.
SELECT *
FROM employees
WHERE gender = 'F';

-- 13. Find employees whose salary is greater than or equal to 60000.
SELECT *
FROM employees
WHERE salary >= 60000;

-- 14. Find employees whose salary is not equal to 60000.
SELECT *
FROM employees
WHERE salary != 60000;

SELECT *
FROM employees
WHERE salary <> 60000;


/************* AND Operator ***************/
-- 15 Find IT employees whose salary is greater than 55000
SELECT *
FROM employees
WHERE department = 'IT' 
AND salary > 55000;

-- 16 Find HR employees whose salary is less than 50000
SELECT *
FROM employees
WHERE department = 'HR' AND salary < 50000;

-- 17 Find Female employees in Finance
SELECT *
FROM employees
WHERE gender = 'F' AND department = 'Finance';

-- 18 Find male employees in IT whose salary is greater than 65000
SELECT *
FROM employees
WHERE gender = 'M' AND department = 'IT' AND salary > 65000;

/********************* SELECT *****************************/
/* 1. Display all employee details. */
SELECT *
FROM employees;

-- Display only firstname and lastname
SELECT firstname, lastname
FROM employees;

-- Display firstname, department and salary
SELECT firstname, department, salary
FROM employees;

-- Display all employees managerid
SELECT managerid
FROM employees;


/******************* DISTINCT *********************/
-- Show all unique departments
SELECT DISTINCT department
FROM employees;

-- Show all unique genders.
SELECT DISTINCT gender
FROM employees;

-- Show all unique manager IDs.
SELECT DISTINCT managerid
FROM employees;

-- Show unique department-gender combinations.
SELECT DISTINCT department, gender
FROM employees;


/********************** WHERE + Comparison Operators ****************************/
-- Find employees whose salary is greater than 50000.
SELECT *
FROM employees
WHERE salary > 50000;

-- Find employees whose salary is less than 70000.
SELECT *
FROM employees
WHERE salary < 70000;

-- Find employees in the IT department.
SELECT *
FROM employees
WHERE department = 'IT';

-- Find female employees.
SELECT *
FROM employees
WHERE gender = 'F';

-- Find employees whose salary is not equal to 60000.
SELECT *
FROM employees
WHERE salary <> 60000;

-- Find employees whose manager ID is 201.
SELECT *
FROM employees
WHERE managerid = 201;

/************** AND Operator ***************/
-- Find IT employees whose salary is greater than 60000.
SELECT *
FROM employees
WHERE department = 'IT' AND
salary > 60000;

-- Find female employees in HR.
SELECT *
FROM employees
WHERE gender = 'F'
AND department = 'HR';

-- Find employees managed by 201 and earning more than 50000.
SELECT *
FROM employees
WHERE managerid = 201 AND salary > 50000;

-- Find male employees in Finance.
SELECT *
FROM employees
WHERE gender = 'M'
AND department = 'Finance';


/************* OR Operator ****************/
-- Find employees in IT or HR.
SELECT *
FROM employees
WHERE department IN ('IT', 'HR');

SELECT *
FROM employees
WHERE department = 'IT'
OR department = 'HR';

-- Find employees earning more than 70000 or belonging to Finance.
SELECT *
FROM employees
WHERE salary > 70000
OR department = 'Finance';

-- Find female employees or employees managed by 201.
SELECT *
FROM employees
WHERE gender = 'F'
OR managerid = 201;

-- Find employees in IT or employees earning less than 50000.
SELECT *
FROM employees
WHERE department = 'IT'
OR salary < 50000; 


/************* NOT Operator **************/
-- Find employees not in IT.
SELECT *
FROM employees
WHERE NOT department = 'IT';

-- Find employees who are not female.
SELECT *
FROM employees
WHERE NOT gender = 'F';

-- Find employees not managed by 201.
SELECT *
FROM employees
WHERE NOT managerid = 201;

-- Find employees whose salary is not greater than 60000.
SELECT *
FROM employees
WHERE NOT salary > 60000;


/************* ORDER BY *****************/
-- Display all employees ordered by salary ascending.
SELECT *
FROM employees
ORDER BY salary;

-- Display all employees ordered by salary descending.
SELECT *
FROM employees
ORDER BY salary DESC;

-- Display employees ordered by first name.
SELECT *
FROM employees
ORDER BY firstname;

-- Display employees ordered by department and then salary.
SELECT *
FROM employees
ORDER BY department, salary;


/********************* LIKE (Beginner) ***********************/
-- Find employees whose first name starts with 'A'.
SELECT *
FROM employees
WHERE firstname LIKE 'A%';

-- Find employees whose first name starts with 'P'.
SELECT *
FROM employees
WHERE firstname LIKE 'P%';

-- Find employees whose last name starts with 'S'.
SELECT *
FROM employees
WHERE lastname LIKE 'S%';

-- Find employees whose department starts with 'F'.
SELECT *
FROM employees
WHERE department LIKE 'F%';

/*****************  LIKE (Intermediate)  **********************/
-- Find employees whose first name ends with 'a'.
SELECT *
FROM employees
WHERE firstname LIKE '%a';

-- Find employees whose last name ends with 'h'.
SELECT *
FROM employees
WHERE lastname LIKE '%h';

-- Find employees whose department contains 'T'.
SELECT *
FROM employees 
WHERE department LIKE '%T%';

-- Find employees whose first name contains 'ar'.
SELECT *
FROM employees
WHERE firstname LIKE '%ar%';

/******** LIKE (Pattern Matching) ****************/
-- Find employees whose first name has exactly 5 characters.
SELECT *
FROM employees
WHERE firstname LIKE '_____';

-- Find employees whose first name starts with 'A' and ends with 't'.
SELECT *
FROM employees
WHERE firstname LIKE 'A%t';

-- Find employees whose last name's second last character is 'h'.
SELECT *
FROM employees
WHERE lastname LIKE '%h_';

-- Find employees whose last name's second character is 'h'.
SELECT *
FROM employees
WHERE lastname LIKE '_h%';

-- Find employees whose first name contains the letter 'n'.
SELECT *
FROM employees
WHERE firstname LIKE '%n%';


/**********************  Mixed Questions   ***************************/
-- Find female employees whose first name starts with 'P'.
SELECT *
FROM employees
WHERE gender = 'F' 
AND firstname LIKE 'P%';

-- Find IT employees whose first name contains 'a'.
SELECT *
FROM employees
WHERE department = 'IT'
AND firstname LIKE '%a%';


-- Find employees earning more than 50000 and whose last name starts with 'S'.
SELECT *
FROM employees
WHERE salary > 50000
AND lastname LIKE 'S%';


-- Find employees not in HR and whose first name ends with 'a'.
SELECT *
FROM employees
WHERE NOT department = 'HR'
AND firstname LIKE '%a';

-- Find employees in IT or Finance ordered by salary descending.
SELECT *
FROM employees
WHERE department IN ('IT', 'Finance')
ORDER BY salary DESC;

-- Find unique departments where salary is greater than 60000.
SELECT DISTINCT department
FROM employees
WHERE salary > 60000;


-- Find employees managed by 201 whose first name starts with 'R'.
SELECT *
FROM employees
WHERE managerid = 201 
AND firstname LIKE 'R%';


-- Find employees whose first name contains 'a' and salary is greater than 50000.
SELECT *
FROM employees
WHERE firstname LIKE '%a%'
AND salary > 50000;


/******************* SQL JOINS (INNER JOIN) ***************************/
/* Level 1: Basic INNER JOIN */
/* Q1 Display all orders along with customer first names. */
SELECT o.orderid, c.firstname
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid;

/* Q2 Display orderid, firstname, lastname for all orders. */
SELECT c.firstname, c.lastname, o.orderid
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid;

/* Q3 Display order ID and product name. */
SELECT o.orderid, p.product
FROM orders o
INNER JOIN products p
ON o.productid = p.productid;

/* Q4 Display all orders with customer names and product names. */  
SELECT o.orderid, c.firstname, p.product
FROM orders o 
INNER JOIN customers c
ON c.customerid = o.customerid
INNER JOIN products p
ON p.productid = o.productid;

/* Q5 Display order ID, customer first name, and sales amount. */
SELECT c.firstname, o.orderid, o.sales
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid;

/* LEVEL 2: INNER JOIN + WHERE */
/* Q6 Display orders placed by customers from USA */
SELECT o.orderid, c.firstname, c.lastname
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
WHERE c.country = 'USA';

/* Q7 Display order for products belonging to the Clothing Category */
SELECT o.orderid, p.product
FROM orders o
INNER JOIN products p
ON o.productid = p.productid
WHERE category = 'Clothing';

/* Q8 Display orders where customer score is greater than 700. */
SELECT o.orderid
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
WHERE c.score > 700;

/* Q9 Display orders handled by employee Mary. */
SELECT o.orderid, e.firstname
FROM orders o
INNER JOIN employees e
ON o.salespersonid = e.employeeid
WHERE e.firstname = "Mary";


/* Q10 Display all delivered orders along with customer names. */
SELECT o.orderid, c.firstname, c.lastname
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
WHERE o.orderstatus = "Delivered";


/***********  Level 3: Multiple INNER JOINs ***********/
/* Q11 
Display:
orderid
customer name
product name
sales
*/
SELECT o.orderid, 
	   c.firstname AS customer_firstname, 
	   c.lastname AS customer_lastname, 
	   p.product AS product_name, 
	   o.sales
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
INNER JOIN products p 
ON o.productid = p.productid;


/* Q12 Display: customer name, product name, quantity, sales */
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
	   p.product AS product_name,
       o.quantity,
       o.sales
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
INNER JOIN products p
ON o.productid = p.productid;

/* Q13
Display:
customer name
salesperson name
product name */
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       e.firstname AS salesperson_firstname,
       e.lastname AS salesperson_lastname,
       p.product AS product_name
FROM customers c
INNER JOIN orders o
ON o.customerid = c.customerid
INNER JOIN employees e
ON o.salespersonid = e.employeeid
INNER JOIN products p
ON o.productid = p.productid;


/* 
Q14 Display all orders with:
customer name
country
product
category
*/
SELECT c.firstname AS customer_firstname,
	   c.lastname AS customer_lastname,
       c.country,
       p.product AS product_name,
       p.category
FROM customers c
INNER JOIN orders o
ON c.customerid = o.customerid
INNER JOIN products p
ON p.productid = o.productid;
 
/*
Q15 Display:
orderid
customer name
salesperson name
sales
*/ 
SELECT o.orderid,
       c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       e.firstname AS salesperson_firstname,
       e.lastname AS salesperson_lastname,
       o.sales 
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
INNER JOIN employees e
ON o.salespersonid = e.employeeid;

/************ Level 4: INNER JOIN + ORDER BY *****************/
/* Q16 Display all orders with customer names ordered by sales descending. */
SELECT o.orderid,
       c.firstname AS customer_firstname,
	   c.lastname AS customer_lastname,
       o.sales
FROM orders o
INNER JOIN customers c
ON o.customerid = c.customerid
ORDER BY o.sales DESC;

/* Q17 Display customer names and product names ordered by order date. */
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
       p.product AS product_name,
       o.orderdate 
FROM orders o
INNER JOIN customers c
ON c.customerid = o.customerid
INNER JOIN products p
ON p.productid = o.productid
ORDER BY o.orderdate ASC;


/* Q18 Display all salespersons and their handled orders ordered by orderid. */
SELECT o.orderid,
       e.firstname AS salesperson_firstname,
       e.lastname AS salesperson_lastname
FROM orders o
INNER JOIN employees e
ON e.employeeid = o.salespersonid
ORDER BY o.orderid;

/*********** Level 5: Aggregate + INNER JOIN ********************/
/* Q19 Count total orders for each customer.
       expected output: customer_name | total_orders
*/
SELECT c.firstname AS customer_firstname,
       c.lastname AS customer_lastname,
	   COUNT(o.orderid) AS total_orders
FROM orders o
INNER JOIN customers c
ON c.customerid = o.customerid
GROUP BY c.customerid;

/* Q20 Calculate total sales for each customer.
		Expected output:
		customer_name | total_sales 
*/
SELECT c.firstname AS customer_firstname,
	   c.lastname AS customer_lastname,
       SUM(o.sales) AS total_sales
FROM orders o
INNER JOIN customers c
ON c.customerid = o.customerid
GROUP BY c.customerid;


/* Q21 Calculate total quantity sold for each product.
		Expected output:
		product_name | total_quantity 
*/
SELECT p.product AS product_name,
	   SUM(o.quantity) AS total_quantity
FROM orders o
INNER JOIN products p
ON o.productid = p.productid
GROUP BY p.productid;
















