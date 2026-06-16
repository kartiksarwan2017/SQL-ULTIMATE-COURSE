SELECT *
FROM customers
WHERE country = "Germany";

SELECT *
FROM customers 
WHERE score > 500;

SELECT *
FROM customers
WHERE score < 500;

SELECT *
FROM customers
WHERE score <= 500;

SELECT *
FROM customers
WHERE score >= 500;

SELECT *
FROM customers
WHERE country != 'Germany';

SELECT *
FROM customers
WHERE country <> 'Germany';

-- Find all customers who come from Germany AND whose score is less than 400
SELECT *
FROM customers
WHERE country = 'Germany'
AND score < 400;

-- Find all customers who come from Germany OR whose score is less than 400
SELECT *
FROM customers
WHERE country = "Germany" OR score < 400;

-- Find all customers whose score is NOT Less than 400
SELECT *
FROM customers
WHERE NOT score < 500;

-- Find all customers whose score falls in the range between 100 and 500.
SELECT *
FROM customers
WHERE score BETWEEN 100 and 500;

SELECT *
FROM customers
WHERE score >= 100 AND score <= 500;

-- Find all customers whose ID is equal to 1, 2 or 5.
SELECT *
FROM customers
WHERE customerid IN (1, 2, 5);

SELECT *
FROM customers
WHERE customerid = 1
OR customerid = 2
OR customerid = 5;

-- Find all customers whose firstname starts with M
SELECT *
FROM customers 
WHERE firstname LIKE 'M%';

-- Find all customers whose first name ends with n
SELECT *
FROM customers
WHERE firstname LIKE '%n';

-- Find all customers whose first name contains r
SELECT *
FROM customers
WHERE firstname LIKE '%r%';

-- Find all customers whose first name contains r in 3rd position
SELECT *
FROM customers
WHERE firstname LIKE '__r%';










 
















