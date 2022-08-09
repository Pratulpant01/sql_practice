DROP TABLE student;
CREATE TABLE student(
    student_id INT PRIMARY KEY,
    name VARCHAR(30),
    company VARCHAR(30)
);
DROP TABLE student;


-- DESCRIBE student; 

-- ALTER TABLE student ADD GPA DECIMAL(3, 2);

SELECT * FROM student;

-- Inserting values in database table

INSERT INTO student(student_id, name) VALUES(4, 'Rahul');
INSERT INTO student VALUES(3, 'Doobey', 'Nalli');
INSERT INTO student VALUES(5, 'PP', 'Engineer');
INSERT INTO student VALUES(6, 'Robin', 'Doctor');


-- Updating values in database table
UPDATE student
SET company = 'Eng'
WHERE company = 'Engineer';

-- Delete values from database table
DELETE from student
WHERE student_id = 3;


SELECT *
FROM student
ORDER BY name
LIMIT 2;

-- Filtering in Database

SELECT *
FROM student
WHERE student_id = 5
