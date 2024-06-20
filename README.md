# Fintech-Employees-and-Projects-Analysis-with-SQL
This repository contains a dataset and project files related to employees, projects, and departmental responsibilities within a fintech organization. The repository can be used for data analysis, project management, and resource allocation purposes within the organization.

## Dataset Information

This dataset represents information about employees, projects, and departmental responsibilities within a fictitious financial technology (fintech) organization.

The organization is involved in developing and deploying various innovative solutions and services related to financial services, such as mobile payment platforms, fraud detection systems, robo-advisors, digital wallets, and regulatory compliance solutions.
The dataset contains information about employees, projects, and the departments responsible for each project within the organization. It consists of three tables: `employees`, `projects`, and `project_departments`.


### Table 1: employees

The `employees` table stores information about the employees of the organization, including their personal details, employment status, and performance evaluations.

- `employee_id`: Unique identifier for each employee.
- `first_name`: First name of the employee.
- `last_name`: Last name of the employee.
- `age`: Age of the employee.
- `gender`: Gender of the employee.
- `dob`: Date of birth of the employee.
- `date_joined`: Date when the employee joined the organization.
- `date_resigned`: Date when the employee resigned from the organization
- `department`: Department to which the employee is assigned.
- `salary`: Annual salary of the employee.
- `performance_level`: Performance evaluation level of the employee (e.g., Outstanding, Exceeds, Meets, Below, 1, 2, 3, 4, 5).


### Table 2: projects

The `projects` table contains information about the various projects undertaken by the organization.

- `project_id`: Unique identifier for each project.
- `employee_id`: Identifier of the employee assigned to the project.
- `start_date`: Date when the project started.
- `end_date`: Date when the project is expected to end (or has ended).
- `project_status`: Current status of the project (e.g., Ongoing, Completed).
- `department`: Department to which the project is associated.


### Table 3: project_departments

The `project_departments` table maps each project to its respective lead or primary department within the organization.

- `project_id`: Unique identifier for each project.
- `project_name`: Name of the project.
- `lead_department`: Department that is primarily responsible for or associated with the project.

The dataset aims to provide insights into the organization's workforce, project management, and departmental responsibilities. It can be used for various analyses, such as identifying high-performing employees, tracking project progress, analyzing departmental workloads, and optimizing resource allocation.

## Database and Tools
- Microsoft SQL Server

## Questions Answered

### Part A

- 1. Find the names of employees who are currently working on projects in the IT department.
- 2. List the project names and the corresponding start dates for all projects that are currently ongoing.
- 3. Retrieve the names and ages of employees who have resigned after working for more than 3 years.
- 4. Find the total salary paid to (active) employees in the 'Finance' department.
- 5. List the project names and employee names for projects that started in 2024.
- 6. Find the names of employees who have worked on more than one project, along with the count of distinct projects they have been involved in.
- 7. Find the (active) employees who are currently working in the 'Operations' department and have a performance level of 'Exceeds'.
- 8. Retrieve the names of employees who joined before 2023 and are working on ongoing projects.
- 9. Retrieve the names of employees who share the same last name as another employee, along with their respective departments.
- 10. Write an SQL query to find (active) employees whose performance level is higher than the average performance level in their respective departments.  
- 11. Write an SQL query to find the top 3 departments with the highest average salary (for active employees).  Return the department and the average salary, rounded to 2 decimal places.
- 12. Write an SQL query to find the project names and the total number of employees who have joined before the project start date. Return the project_name and the count of such employees.
- 13. Write an SQL query to find the employees who have not been assigned to any project but not retired. Return the employee_id, first_name, last_name, and department. 
- 14. Write an SQL query to find the names of employees who have been assigned to projects where lead department is 'Finance' and 'IT' departments but employees are not in 'Customer Service' department. Return the employee_id, first_name, and last_name. 
- 15. Write an SQL query to find the average salary of employees for each project. Return the project_id, project_name, and average salary.

[Click here](https://github.com/mosesziregbe/Fintech-Employees-and-Projects-Analysis-with-SQL/blob/main/PartA_employees_and_project_solutions.sql) to see the solutions to Part A.

## Part B

- 1. Write a SQL query to find the average salary of employees who have not resigned, grouped by department and performance level.
- 2. Find the employee(s) who have the longest tenure (the difference between date_joined and date_resigned or the current date if they haven't resigned) in each department.
- 3. Write a query to retrieve the names of employees who have worked on projects that have been completed, along with the project names and their respective departments.
- 4. Find the department(s) with the highest average salary for employees who have not resigned.
- 5. Write a query to retrieve the names of employees who have worked on projects that have a duration (end_date - start_date) longer than a specified number of days (365 days).
- 6. Find the department(s) with the highest number of resigned employees.
- 7. Find the project(s) that have the highest number of employees assigned to them, and return the project details (project_name, start_date, end_date, project_status) along with the count of employees.
- 8. Find the employee(s) who have the highest salary and have not resigned, grouped by department.
- 9. Find the department(s) with the highest average age of employees who have not resigned.
- 10. Find the department(s) that have the highest number of employees who have resigned, and for each of those departments, return the department name, the count of resigned employees, and the average tenure (in days) of those resigned employees.
- 11. Write a SQL query to find the projects that have employees assigned from at least three different departments, and for each of those projects, return the project name, the count of distinct departments represented, and the average age of employees assigned to that project.
- 12. Write a SQL query to find the department(s) that have the highest average salary for employees who have not resigned and have an 'Outstanding' performance level, and return the department name and the average salary rounded to the nearest integer.
- 13. Write a SQL query to find the project(s) that have the highest average age of employees assigned to them, and for each of those projects, return the project name, the average age of employees rounded to the nearest integer, and the count of employees assigned to that project.
- 14. Find the employee(s) who have worked on the most number of projects that have a duration (end_date - start_date) longer than 365 days, and for each of those employees, return their name, the count of projects with duration longer than 365 days, and the average duration (in days) of those projects.
- 15. Find the department(s) with the highest average salary for employees who have worked on completed projects, and return the department name(s) and the corresponding average salary.

