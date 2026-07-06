/*
SQL TASK
Find the total number of customers for each country and only inlcude countries that have more than 1 customer
*/
SELECT country, 
       COUNT(*) AS total_customers
FROM customers
GROUP BY country
HAVING COUNT(*) > 1;

-- filter the result based on country not USA
SELECT country, 
       COUNT(*) AS total_customers
FROM customers
WHERE country != 'USA'
GROUP BY country
HAVING COUNT(*) > 1;
	   
       
       
