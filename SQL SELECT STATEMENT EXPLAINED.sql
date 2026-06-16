/* SQL SELECT STATEMENT EXPLAINED */
USE salesdb;

/* SQL TASK
   Retrieve all data and columns from customers
   NOTE: * means ALL - Retrieve ALL Columns
*/
SELECT *
FROM customers;

/* Note: In SQL the order of clauses is very important. */

/* Fetch all the data from the orders. */
SELECT *
FROM orders;

/* Retrieve ONLY first name and country of all customers. 

the way database implement our query :-
database starts from table name
then which columns do we need.
*/
SELECT firstname, 
	   country
FROM customers;










