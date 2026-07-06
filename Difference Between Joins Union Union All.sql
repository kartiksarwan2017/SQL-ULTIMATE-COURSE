ALTER TABLE employees
ADD column country VARCHAR(50);

SELECT *
FROM employees;

UPDATE employees
SET country = 'USA'
WHERE employeeid = 1;

UPDATE employees
SET country = 'Russia'
WHERE employeeid = 2;

UPDATE employees
SET country = 'USA'
WHERE employeeid = 3;

UPDATE employees
SET country = 'Russia'
WHERE employeeid = 4;

UPDATE employees
SET country = 'Germany'
WHERE employeeid = 5;

UPDATE employees
SET country = 'India'
WHERE employeeid = 6;

SELECT *
FROM employees;

/*
  SQL TASK
   List first name, last name and country of all persons from customers and employees
*/
/******** UNION ALL **********/
SELECT firstname AS customer_firstname,
       lastname AS customer_lastname,
       country AS customer_country
FROM customers
UNION ALL
SELECT firstname AS employee_firstname,
	   lastname AS employee_lastname,
       country As employee_country
FROM employees;

/******** UNION **********/
SELECT firstname,
       lastname,
       country
FROM customers
UNION
SELECT firstname,
	   lastname,
       country
FROM employees;

