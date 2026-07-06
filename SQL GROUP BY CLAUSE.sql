/*  
SQL TASK
Find the total number of customers for each country. sorted in ascending orders 
*/
SELECT country, 
	   COUNT(*) AS total_customers
FROM customers
GROUP BY country
ORDER BY COUNT(*) ASC;

/*
SQL TASK
Find the highest score of customers for each country.
*/
SELECT country,
	   MAX(score) AS highest_score
FROM customers
GROUP BY country;