/*
SQL TASK
Change the country of customer ID 7 to Germany.
*/
UPDATE customers 
SET country = 'Germany'
WHERE customerid = 7;

SELECT *
FROM customers;

/*
SQL TASK
Change the score of the customer Anna to 100 and change her country from UK to USA.
*/
UPDATE customers
SET score = 100, 
    country = 'USA'
WHERE customerid = 5;

SELECT *
FROM customers;

