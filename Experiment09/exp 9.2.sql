

-- Problem Statement:

-- Create an Employee Payroll Management System in PostgreSQL using row-level and statement-level triggers.

-- Create an employee table containing the following attributes:

-- emp_id

-- emp_name

-- per_hour_salary

-- working_hours

-- payable_amount

-- Implement the following requirements:

-- Row-level trigger: Automatically calculates payable_amount using per_hour_salary × working_hours whenever an employee is inserted or updated.

-- Amount check: The row-level trigger must check whether the calculated payable_amount is greater than 25,000.

-- If it is greater than 25,000, reject the operation using RAISE EXCEPTION.

-- Otherwise, allow the operation.

-- Statement-level trigger: Create a statement-level trigger that executes after an INSERT or UPDATE statement and displays the message: "Rows Updated Successfully".

-- Demonstration: Demonstrate the working of both triggers using suitable INSERT and UPDATE statements, including at least one case where the payable amount exceeds 25,000.











CREATE TABLE tran_employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC(10,2)
);

INSERT INTO tran_employees VALUES
(1, 'Amit', 30000),
(2, 'Ravi', 40000),
(3, 'Neha', 50000);

select * from tran_employees


BEGIN;


UPDATE tran_employees
SET salary = salary + 5000
WHERE emp_id = 1;

SAVEPOINT salary_update;

UPDATE tran_employees
SET salary = -20000
WHERE emp_id = 2;

ROLLBACK TO SAVEPOINT salary_update;

COMMIT;


SELECT * FROM tran_employees;
