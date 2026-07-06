/* ALTER TABLE */
-- ADD COLUMN
ALTER TABLE persons
ADD city VARCHAR(50);

ALTER TABLE persons
ADD email VARCHAR(120);

SELECT *
FROM persons;

-- DROP COLUMN
ALTER TABLE persons
DROP COLUMN city;

SELECT *
FROM persons;

-- RENAME COLUMN
ALTER TABLE persons
RENAME COLUMN phone TO contact_number;

SELECT *
FROM persons;


-- MODIFY DataType
/*
ALTER TABLE table_name
MODIFY column_name new_datatype constraint;
*/
ALTER TABLE persons
MODIFY email VARCHAR(100) NOT NULL;

SELECT *
FROM persons;

DESC persons;

/* ALTER TABLE ADD CONSTRAINT 
ALTER TABLE table_name
ADD CONSTRAINT constraint_name constraint_definition;

ALTER TABLE persons
ADD CONSTRAINT CHK_Age CHECK (age >= 18);

*/

/* 
ALTER TABLE - Rename TABLE
ALTER TABLE table_name
RENAME TO new_table_name;

*/
ALTER TABLE persons
ADD dateofbirth date;

ALTER TABLE persons
MODIFY COLUMN dateofbirth year;

ALTER TABLE persons
DROP COLUMN dateofbirth;


/* SQL TASK
   Add new column called email to the table Persons.
*/
ALTER TABLE persons
ADD email VARCHAR(100) NOT NULL;

SELECT *
FROM persons;

DESCRIBE persons;











