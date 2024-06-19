# Fintech-Employees-and-Projects-Analysis-with-SQL
This repository contains a dataset and project files related to employees, projects, and departmental responsibilities within a fintech organization. The repository can be used for data analysis, project management, and resource allocation purposes within the organization.

## Dataset Information

This dataset represents information about employees, projects, and departmental responsibilities within a fictitious financial technology (fintech) organization.

The organization is involved in developing and deploying various innovative solutions and services related to financial services, such as mobile payment platforms, fraud detection systems, robo-advisors, digital wallets, and regulatory compliance solutions.
The dataset contains information about employees, projects, and the departments responsible for each project within the organization. It consists of three tables: `employees`, `projects`, and `project_departments`.


###Table 1: employees

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


###Table 2: projects

The `projects` table contains information about the various projects undertaken by the organization.

- `project_id`: Unique identifier for each project.
- `employee_id`: Identifier of the employee assigned to the project.
- `start_date`: Date when the project started.
- `end_date`: Date when the project is expected to end (or has ended).
- `project_status`: Current status of the project (e.g., Ongoing, Completed).
- `department`: Department to which the project is associated.


###Table 3: project_departments

The `project_departments` table maps each project to its respective lead or primary department within the organization.

- `project_id`: Unique identifier for each project.
- `project_name`: Name of the project.
- `lead_department`: Department that is primarily responsible for or associated with the project.

The dataset aims to provide insights into the organization's workforce, project management, and departmental responsibilities. It can be used for various analyses, such as identifying high-performing employees, tracking project progress, analyzing departmental workloads, and optimizing resource allocation.
