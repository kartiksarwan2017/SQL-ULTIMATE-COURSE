/*
SQL TASK
Create new SQL table called Persons with 4 columns: 
ID, person name, birth date, and phone.
*/
CREATE TABLE mydatabase.persons (
   id INT PRIMARY KEY AUTO_INCREMENT, 
   person_name VARCHAR(50) NOT NULL,
   birth_date DATE,
   phone VARCHAR(15) NOT NULL UNIQUE
);

DESCRIBE persons;

SELECT * 
FROM persons;





