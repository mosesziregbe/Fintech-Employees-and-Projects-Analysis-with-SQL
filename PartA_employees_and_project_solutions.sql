-- 1. Find the names of employees who are currently working on 
-- projects in the IT department.


SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees e
JOIN projects p
ON e.employee_id = p.employee_id
WHERE p.project_status = 'Ongoing'
AND e.department = 'IT';



-- 2. List the project names and the corresponding start dates 
-- for all projects that are currently ongoing.



SELECT DISTINCT pd.project_name, p.start_date, 
p.project_status FROM project_departments pd
LEFT JOIN projects p
ON pd.project_id = p.project_id
WHERE p.project_status = 'Ongoing';


-- 3. Retrieve the names and ages of employees who have 
-- resigned after working for more than 3 years.



SELECT employee_id, first_name, last_name, date_joined, date_resigned, 
DATEDIFF(YEAR, date_joined, date_resigned) AS years_with_company
FROM employees
WHERE DATEDIFF(YEAR, date_joined, date_resigned) > 3  -- ensures they have worked more than 3 years
AND date_resigned < GETDATE();  -- ensures they have resigned




-- 4. Find the total salary paid to (active) employees in the 'Finance' department.


SELECT SUM(salary) AS total_finance_dept_salary
FROM employees
WHERE department = 'Finance'
AND date_resigned > GETDATE();




-- 5. List the project names and employee names for projects that started in 2024.


SELECT pd.project_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM project_departments pd
JOIN projects p
ON pd.project_id = p.project_id
JOIN employees e
ON p.employee_id = e.employee_id
WHERE p.start_date >= '2024-01-01';




-- 6. Find the names of employees who have worked on more than 
-- one project, along with the count of distinct projects 
-- they have been involved in.


SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name,
	   STRING_AGG(pd.project_name, '  |  ') AS projects_worked_on,
	   COUNT(p.project_id) AS no_of_projects
FROM employees e
JOIN projects p
ON e.employee_id = p.employee_id
JOIN project_departments pd
ON p.project_id = pd.project_id
GROUP BY e.first_name, e.last_name
HAVING COUNT(p.project_id) > 1
ORDER BY no_of_projects DESC;




-- 7. Find the (active) employees who are currently working in 
-- the 'Operations' department and have a performance level of 'Exceeds'.



SELECT *
FROM employees
WHERE department = 'Operations' 
AND performance_level = 'Exceeds'
AND date_resigned > GETDATE();



-- 8. Retrieve the names of employees who joined 
-- before 2023 and are working on ongoing projects.


SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name,
e.date_joined,
p.project_status
FROM employees e
JOIN projects p
ON e.employee_id = p.employee_id
JOIN project_departments pd
ON p.project_id = pd.project_id
WHERE p.project_status = 'Ongoing'
AND date_joined < '2023-01-01';



-- 9. Retrieve the names of employees who share the 
-- same last name as another employee, along with their respective departments.



SELECT DISTINCT e1.first_name, e1.last_name
FROM employees e1
JOIN employees e2
ON e1.last_name = e2.last_name
GROUP BY e1.first_name, e1.last_name, e2.first_name
HAVING COUNT(DISTINCT CASE WHEN e1.employee_id <> e2.employee_id THEN e2.employee_id END) > 0;




-- 10. Write an SQL query to find (active) employees whose 
-- performance level is higher than the average performance level 
-- in their respective departments.  


-- Step 1: Calculate the numerical representation of performance levels
WITH performance_rank AS (
    SELECT 
        employee_id, 
		first_name, 
		last_name,
        department, 
		date_resigned,
        CASE performance_level
            WHEN 'Outstanding' THEN 5
            WHEN 'Exceeds' THEN 4
            WHEN 'Meets' THEN 3
            WHEN 'Needs Improvement' THEN 2
            WHEN 'Below' THEN 1
        END AS performance_Score
    FROM employees
    WHERE date_resigned > GETDATE()  -- retrieves the active employees
),
-- Step 2: Calculate the average performance score per department
avg_department_performance AS (
    SELECT 
        department, 
        AVG(performance_score) AS avg_performance_score
    FROM performance_rank
    GROUP BY department
)
-- Step 3: Find employees whose performance is higher than the average in their department
SELECT 
    pr.employee_id, 
    pr.first_name, 
    pr.last_name, 
    pr.department, 
    pr.performance_score, 
    adp.avg_performance_score
FROM performance_rank pr
JOIN avg_department_performance adp
    ON pr.department = adp.department
WHERE pr.performance_score > adp.avg_performance_score;



-- 11. Write an SQL query to find the top 3 departments 
-- with the highest average salary (for active employees). 
-- Return the department and the average salary, rounded to 2 decimal places.


SELECT TOP 3 department, AVG(salary) AS average_salary
FROM employees
WHERE date_resigned > GETDATE()
GROUP BY department
ORDER BY average_salary DESC;



-- 12. Write an SQL query to find the project names and 
-- the total number of employees who have joined before the 
-- project start date. Return the project_name and the count of such employees.



SELECT pd.project_name, COUNT(p.employee_id) AS total_no_of_employees
FROM project_departments pd
JOIN projects p
ON pd.project_id = p.project_id
JOIN employees e
ON p.employee_id = e.employee_id
WHERE e.date_joined < p.start_date
GROUP BY pd.project_name, pd.project_name
ORDER BY total_no_of_employees DESC;




-- 13. Write an SQL query to find the employees who have not been 
-- assigned to any project but not retired. 
-- Return the employee_id, first_name, last_name, and department. 

-- LEFT JOIN employees with projects table 
-- all employees not assigned to projects will have project_id as NULL
-- then filter for not retired employees


SELECT e.employee_id, e.first_name, e.last_name, e.department, e.date_resigned
FROM employees e
LEFT JOIN projects p
ON e.employee_id = p.employee_id
LEFT JOIN project_departments pd
ON p.project_id = pd.project_id
WHERE pd.project_id IS NULL 
AND date_resigned > GETDATE();



-- 14. Write an SQL query to find the names of employees who have been assigned to projects that are in 
-- 'Finance' and 'IT' lead departments but not in 'Customer Service'. 
-- Return the employee_id, first_name, and last_name. 


SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
JOIN projects p
ON e.employee_id = p.employee_id
JOIN project_departments pd
ON p.project_id = pd.project_id
WHERE pd.lead_department IN ('Finance', 'IT')
AND e.department != 'Customer Service';



-- 15. Write an SQL query to find the average salary of employees 
-- for each project, rounded to 2 decimal places. 
-- Return the project_id, project_name, and average salary. 


WITH salary_cte
AS
(
SELECT pd.project_id, pd.project_name, e.salary AS salary
FROM project_departments pd
LEFT JOIN projects p
ON pd.project_id = p.project_id
JOIN employees e
ON p.employee_id = e.employee_id
GROUP BY pd.project_name, pd.project_id, pd.project_name, e.salary
)
SELECT project_id, project_name, AVG(salary) AS average_salary
FROM salary_cte
GROUP BY project_id, project_name
ORDER BY average_salary DESC;




