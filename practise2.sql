CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    birth_day DATE,
    sex VARCHAR(5),
    salary INT,
    super_id INT,
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) on DELETE CASCADE
);

CREATE TABLE branch(
    branch_id INT PRIMARY KEY, 
    branch_name VARCHAR(20),
    mgr_id INT,
    mgr_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);


-- ADD branch id as foreign key in employee table
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client(
    client_id INT PRIMARY KEY,
    client_name VARCHAR(50),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with(
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


DROP TABLE client;

SELECT * FROM employee;

-- Insert values inside the table
INSERT INTO employee VALUES(100, 'Robin', 'Dsuza', '1995-02-15', "M", 250000, NULL, NULL);
INSERT INTO branch VALUES(1, "Corporate", 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinsion', '1961-05-11', 'M', 360000, 100, 1);

DELETE FROM employee
WHERE emp_id = 101;

INSERT INTO employee VALUES(102, 'Angela', 'Martin', '1971-06-15', 'F', 63000, 102, NULL);
INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id= 102;

INSERT INTO employee VALUES(103, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 180000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 55000, 102, 2);


INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NUll);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1987-02-13', 'F', 128390, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpret', '1978-12-01', 'F', 71000, 106, 3);

INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni Ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patroit Paper', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Labels', 'Custom');

INSERt INTO client VALUES(400, 'Dunmore High School', 2);
INSERt INTO client VALUES(401, 'Lackawana Country', 2);
INSERt INTO client VALUES(402, 'FedEx', 3);
INSERt INTO client VALUES(403, 'John Daily Law', 3);
INSERt INTO client VALUES(404, 'Scranton White Pages', 2);
INSERt INTO client VALUES(405, 'Times Newspaper', 3);
INSERt INTO client VALUES(406, 'FedEx', 2);

INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 260000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 26700);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 12050);
INSERT INTO works_with VALUES(107, 405, 325000);
INSERT INTO works_with VALUES(102, 406, 13000);
INSERT INTO works_with VALUES(105, 406, 120000);




-- More Basic Queries

-- Get All Employees
SELECT * FROM employee;

-- Find all employees ordered by salary
SELECT * FROM employee
ORDER BY salary; -- You can also add DESC in last for descending order 

-- Find all employees ordered by sex and name

SELECT * FROM employee
ORDER BY sex, first_name;

-- First 5 employee in the table

SELECT * FROM employee
LIMIT 5;
