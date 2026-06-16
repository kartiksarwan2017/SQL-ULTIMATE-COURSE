/* SQL ORDER BY SORT YOUR RESULTS 
NOTE: As default SELECT doesn't sort the result in any order. 

ORDER BY 
sorts the result in a particular order.
*/

/* 
SQL TASK
Retrieve all customers where the result is sorted by score (smallest first)
*/
SELECT *
FROM customers
ORDER BY score ASC;

/* Retrieve all customers where the result is sorted by score (highest first) */
SELECT * 
FROM customers 
ORDER BY score DESC;

/* Retrieve all customers, sorting the result by country (alphabetically) and then 
   by score (highest first)
*/
SELECT *
FROM customers
ORDER BY country ASC, score DESC;













