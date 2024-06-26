
-- verify the new table

SELECT * 
FROM employees_data;


-- create new table for data cleaning and transformations

DROP TABLE IF EXISTS employees;
SELECT *
INTO employees
FROM employees_data;

SELECT * FROM employees;


/* update first_name where last_name contains the fullname*/

UPDATE employees
SET
    first_name = LEFT(last_name, CHARINDEX(' ', last_name) - 1),
    last_name = SUBSTRING(last_name, CHARINDEX(' ', last_name) + 1, LEN(last_name))
WHERE
    first_name IS NULL AND
    CHARINDEX(' ', last_name) > 0;


/* update last_name where first_name contains the fullname*/

UPDATE employees
SET
    first_name = LEFT(first_name, CHARINDEX(' ', first_name) -1),
	last_name = SUBSTRING(first_name, CHARINDEX(' ', first_name) +1, LEN(first_name))
WHERE
    last_name IS NULL AND
    CHARINDEX(' ', first_name) > 0;


-- Capitalize employees first_name and last_name

UPDATE employees
SET first_name = UPPER(LEFT(first_name, 1)) + LOWER(SUBSTRING(first_name, 2, LEN(first_name))),
	last_name = UPPER(LEFT(last_name, 1)) + LOWER(SUBSTRING(last_name, 2, LEN(last_name)));



-- update the Gender column with the appropriate gender(M, F, N/A, Decline to comment)

UPDATE employees
SET Gender = CASE 
    WHEN Gender IN ('Man', 'Male', 'Boy') THEN 'M'
    WHEN Gender IN ('Woman', 'Female', 'Girl') THEN 'F'
    ELSE Gender
END;


-- There seems to be some errors and mispellings in
-- the department column

-- Get the distinct department in the employees table

SELECT DISTINCT Department
FROM employees
ORDER BY Department;


-- Correcting misspellings and standardizing department names

UPDATE employees
SET department = 
    CASE 
        WHEN department = 'Customer Servic' THEN 'Customer Service'
		WHEN department = 'engineeringing' THEN 'Engineering'
		WHEN department = 'Financ' THEN 'Finance'
		WHEN department = 'H' THEN 'HR'
		WHEN department = 'I' THEN 'IT'
		WHEN department = 'marketinging' THEN 'Marketing'
		WHEN department = 'Sale' THEN 'Sales'
        WHEN department = 'Operation' THEN 'Operations' 
        ELSE department
    END;


-- Standardize performance level of employees

UPDATE employees
SET performance_level = CASE
    WHEN performance_level IN ('1', 'Below') THEN 'Below'
    WHEN performance_level IN ('2', 'Needs Improvement') THEN 'Needs Improvement'
    WHEN performance_level IN ('3', 'Meets') THEN 'Meets'
    WHEN performance_level IN ('4', 'Exceeds') THEN 'Exceeds'
    WHEN performance_level IN ('5', 'Outstanding') THEN 'Outstanding'
    ELSE performance_level
END;


-- verifying our tables 

SELECT * FROM employees;

SELECT * FROM projects;

SELECT * FROM project_departments;




