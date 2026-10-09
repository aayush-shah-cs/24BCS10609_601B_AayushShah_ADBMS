-- Problem Statement
-- 9.1 :Implement a Row-Level BEFORE UPDATE Trigger on the Salary_Hike table that restricts a salary increase to no more than 15% of the :OLD.salary value; if the increase exceeds this limit, the trigger must raise a custom User-Defined Exception 
--  with a specific message


CREATE OR REPLACE TRIGGER check_salary_hike
BEFORE UPDATE OF salary ON Salary_Hike
FOR EACH ROW
DECLARE
    salary_limit_exceeded EXCEPTION;
BEGIN
    IF :NEW.salary > :OLD.salary * 1.15 THEN
        RAISE salary_limit_exceeded;
    END IF;

EXCEPTION
    WHEN salary_limit_exceeded THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Error: Salary increase cannot exceed 15% of the old salary.'
        );
END;
/