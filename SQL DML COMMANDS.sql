/* SQL DML(Data Manipulation Language) COMMANDS */
USE mydatabase;

/* 1. INSERT 
CAUTION: Columns and values must be in the same order.
*/
INSERT INTO customers (id, first_name, country, score)
VALUES (6, 'Anna', 'USA', NULL),
	   (7, 'Sam', NULL, 100);
       
INSERT INTO customers
VALUES (8, 'USA', 'Max', NULL);
       
INSERT INTO customers
VALUES (9, 'Andreas', 'Germany', NULL);

INSERT INTO customers (id, first_name)
VALUES (10, 'Sahra');

SELECT * FROM customers;

/* INSERT Using SELECT */
CREATE TABLE persons (
   id INT NOT NULL,
   person_name VARCHAR(50) NOT NULL,
   birth_date DATE,
   phone VARCHAR(15) NOT NULL,
   CONSTRAINT pk_persons PRIMARY KEY (id)
);

DESC persons;
SELECT * FROM persons;

/* Insert data from 'customers' into 'persons' */
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT id, 
       first_name, 
       NULL, 
	   'Unknown'
FROM customers;

SELECT * FROM persons;

/* Data Manipulation Language - UPDATE */
/* Change the score of customer 6 to 0 
CAUTION: Without a WHERE, all rows will be updated.
*/
UPDATE customers
SET score = 0
WHERE id = 6;

SELECT *
FROM customers
WHERE id = 6;

/* SQL TASK
   Change the score of customer with ID 10 to 0 and update the country to 'UK'
*/
UPDATE customers 
SET score = 0,
    country = 'UK'
WHERE id = 10;

SELECT * 
FROM customers
WHERE id = 10;

/*
SQL TASK
Update all customers with a NULL score by setting their score to 0
*/
SET SQL_SAFE_UPDATES = 0;

UPDATE customers
SET score = 0
WHERE score IS NULL;

SELECT *
FROM customers;

/* Update NULL values of country from customers to 'Unknown' */
UPDATE customers
SET country = 'Uknown'
WHERE country IS NULL;

SELECT *
FROM customers;

/* Data Manipulation Language (DML) */
/* DELETE COMMAND */

/* SQL TASK 
   Delete all customers with an ID greater than 5.
   
   CAUTION: Without a WHERE, all rows will be updated!
   BEST PRACTICE: 
   Check with SELECT before running DELETE to avoid deleting the wrong data.
*/
SELECT *
FROM customers
WHERE id > 5;

DELETE FROM customers
WHERE id > 5;

SELECT *
FROM customers;

/*
  SQL TASK 
  Delete all data from the persons table.
  TRUNCATE: Clears the whole table at once without checking or logging.
*/
-- DELETE FROM persons;

TRUNCATE TABLE persons;

SELECT *
FROM persons;









