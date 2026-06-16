/**************** Comparison Operators *********************/
/* SQL TASK
   Retrieve all customers from Germany
*/
SELECT *
FROM customers 
WHERE country = 'Germany';

/* SQL TASK
   Retrieve all customers who are not from Germany
*/
SELECT *
FROM customers
WHERE country != 'Germany';

SELECT *
FROM customers 
WHERE country <> 'Germany';

/* SQL TASK
   Retrieve all customers with a score greater than 500
*/
SELECT *
FROM customers
WHERE score > 500;

/* SQL TASK
   Retrieve all customers with a score of 500 or more
*/
SELECT *
FROM customers 
WHERE score >= 500;

/* SQL TASK
   Retrieve all customers with a score less than 500
*/
SELECT *
FROM customers
WHERE score < 500;


/* SQL TASK
   Retrieve all customers with a score of 500 or less.
*/
SELECT *
FROM customers
WHERE score <= 500;

/**************** Logical Operators *********************/
/*** AND OPERATOR ***/
/* SQL TASK
   Retrieve all customers who are from the USA AND have a score greater than 500
*/
SELECT *
FROM customers
WHERE country = 'USA'
AND score > 500;

/*** OR OPERATOR ***/
/* SQL TASK
   Retrieve all customers who are either from USA or have a score greater than 500.
*/
SELECT *
FROM customers
WHERE country = 'USA'
OR score > 500;


/*** NOT Operator ***/
/*
   SQL TASK
   Retrieve all customers with a score not letss than 500
*/
SELECT *
FROM customers
WHERE score >= 500;

SELECT *
FROM customers
WHERE NOT score < 500;

/* SQL TASK 
   Retrieve all customers whose score falls in the range between 100 and 500
*/
SELECT *
FROM customers
WHERE score >= 100 AND score <= 500;


SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;

/*
SQL TASK
Retrieve all customers from either Germany or USA
*/
SELECT *
FROM customers
WHERE country = 'Germany' OR country = 'USA';

SELECT *
FROM customers
WHERE country IN ('Germany', 'USA');

/* Tip:
   Use IN instead of OR for multiple values in the same column to simplify SQL
*/
SELECT *
FROM customers
WHERE country = 'Germany'
   OR country = 'USA'
   OR country = 'France'
   OR country = 'Canada';


SELECT *
FROM customers 
WHERE country IN ('Germany', 'USA', 'France', 'Canada');


/* SQL TASK
   Find all customers whose first name starts with 'M'
*/
SELECT *
FROM customers
WHERE first_name LIKE 'M%';


/* SQL TASK
   Find all customers whose first name ends with 'n'
*/
SELECT *
FROM customers 
WHERE first_name LIKE '%n';

/*
  SQL TASK
  Find all customers whose first name contains 'r'
*/
SELECT *
FROM customers 
WHERE first_name LIKE '%r%';


/*
   SQL TASK
   Find all customers whose first name has 'r' in the third position
*/
SELECT *
FROM customers
WHERE first_name LIKE '__r%';


















 


























