/*
SQL TASK
List all customer names, where the name is combination of first name and last name
*/
SELECT CONCAT(firstname, '-',  lastname) AS customer_name
FROM customers;

/*
SQL TASK
List the first name of all customers in uppercase
*/
SELECT UPPER(firstname) AS upper_first_name
FROM customers;

/*
SQL TASK
List the first name of all customers in lowercase
*/
SELECT LOWER(lastname) AS lower_last_name
FROM customers;

/*
  SQL TASK: 
  List all last name of all customers and remove all the white spaces in the names.
*/
SELECT LTRIM(lastname)
FROM customers;

SELECT RTRIM(lastname)
FROM customers;

SELECT TRIM(lastname)
FROM customers;

/*  
  SQL TASK
  Find the length of last name of all customers
*/
SELECT LENGTH(lastname)
FROM customers;

SELECT lastname,
       TRIM(lastname) As clean_last_name,
       LENGTH(lastname) AS len_last_name,
       LENGTH(TRIM(lastname)) AS clean_len_last_name
FROM customers;

/*
SQL TASK
Subtract 3 characters from the last name of all customers, starting from the 2nd position.
*/
SELECT lastname, 
	   SUBSTRING(lastname, 2, 3) AS sub_last_name
FROM customers;


















