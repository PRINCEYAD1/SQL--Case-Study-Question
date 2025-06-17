---

# 🧑‍💼 HR Data Analysis using SQL

## 📌 Overview

This project provides a structured analysis of an **HR database** using **SQL**. It covers multiple **real-world business scenarios** such as employee insights, departmental analysis, job roles, hiring patterns, and more.

The goal is to showcase **SQL querying skills** and solve business-relevant problems using **joins, filtering, aggregation, subqueries, and date functions**.

---

## 🎯 Objectives

* Analyze employees based on salary, department, and hiring trends.
* Perform joins across HR tables to derive meaningful business insights.
* Explore job and department data to help with HR planning and decision-making.
* Use date-based queries to track employee hiring patterns.

---

## 🗂️ Dataset

This project uses the following standard HR schema tables:

* `employees`
* `departments`
* `jobs`
* `locations`
* `countries`
* `regions`
* `dependents`

> **Note**: Data is assumed to be stored in a MySQL-compatible RDBMS.

---

## 🧠 Business Problems and SQL Solutions

### 1. ✅ Show all records from all tables

```sql
SELECT * FROM countries;
SELECT * FROM departments;
SELECT * FROM dependents;
SELECT * FROM employees;
SELECT * FROM jobs;
SELECT * FROM locations;
SELECT * FROM regions;
```

---

### 2. 🥈 Find the Second Highest Salary

```sql
SELECT MAX(salary) 
FROM employees 
WHERE salary < (SELECT MAX(salary) FROM employees);
```

---

### 3. 🏢 Employees in Department 9 with Salary > 10,000

```sql
SELECT department_id, CONCAT(first_name, ' ', last_name) AS fullname, salary
FROM employees
WHERE department_id = 9 AND salary > 10000;
```

---

### 4. 👨‍💼 Departments where Manager's Name is Michael

```sql
SELECT department_id, CONCAT(first_name, ' ', last_name) AS manager_name
FROM employees
WHERE LOWER(first_name) = 'michael';
```

---

### 5. 💼 Jobs where Min Salary is Less than Salary of Employee 105

```sql
SELECT job_title, min_salary
FROM jobs
WHERE min_salary < (
  SELECT salary FROM employees WHERE employee_id = 105
);
```

---

### 6. 🔁 Employee & Manager Pairing

```sql
SELECT 
  CONCAT(e.first_name, ' ', e.last_name) AS Employee_Name,
  CONCAT(m.first_name, ' ', m.last_name) AS Manager_Name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;
```

---

### 7. 📅 Employees Joined Each Year in Departments 5 or 9

```sql
SELECT 
  YEAR(hire_date) AS year_joined,
  COUNT(*) AS num_employees
FROM employees
WHERE department_id IN (5, 9)
GROUP BY YEAR(hire_date);
```

---

### 8. 💰 Job ID, Department ID, and Total Salary Grouped

```sql
SELECT job_id, department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY job_id, department_id;
```

---

### 9. 📌 Employee Name and Job Title Where Salary is Between Job's Min and Max Salary

```sql
SELECT 
  CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
  j.job_title,
  e.salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary BETWEEN j.min_salary AND j.max_salary;
```

---

### 10. 📆 Employees Hired on June 17

```sql
SELECT first_name, job_title, department_name, hire_date
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE DATE_FORMAT(hire_date, '%m-%d') = '06-17';
```

---

### 11. 🅰️ Employees Whose First or Last Name Starts with 'S'

```sql
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'S%' OR last_name LIKE 'S%';
```

---

### 12. 🎉 Employees Hired in May

```sql
SELECT CONCAT(first_name, ' ', last_name) AS employee, hire_date
FROM employees
WHERE MONTH(hire_date) = 5;
```

---

### 13. 💸 First Salary Date (Assuming End of Hiring Month)

```sql
SELECT first_name, LAST_DAY(hire_date) AS first_salary_date
FROM employees;
```

---

### 14. 📅 Employees Hired in 1997

```sql
SELECT first_name, last_name
FROM employees
WHERE YEAR(hire_date) = 1997;
```

---

### 15. 🔠 First Word of Job Titles

```sql
SELECT job_title, SUBSTRING_INDEX(job_title, ' ', 1) AS first_word
FROM jobs;
```

---

## 🔗 Join-Based Queries

### 1. Show Full Name, Department Number, and Name

```sql
SELECT CONCAT(e.first_name, ' ', e.last_name) AS fullname,
       d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
```

---

### 2. Employees in Department 40 or 80

```sql
SELECT CONCAT(e.first_name, ' ', e.last_name) AS fullname,
       d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IN (40, 80);
```

---

### 3. Employees with 'r' in First Name, with City & State

```sql
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.first_name LIKE '%r%';
```

---

### 4. All Employees With or Without Department

```sql
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;
```

---

### 5. Department Name, Manager Name, and City

```sql
SELECT d.department_name,
       CONCAT(e.first_name, ' ', e.last_name) AS manager,
       l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;
```

---

## 📌 Author

**Prince Yadav**
This project is part of my portfolio to showcase **SQL and Data Analysis** skills.

Feel free to connect with me:

* 🔗 **LinkedIn**: \[Your LinkedIn Profile]
* 📺 **YouTube**: \[Your Channel Name]
* 📷 **Instagram**: \[Your Handle]
* 💬 **Discord**: \[Invite Link or Community Name]

---

## 📄 License

This project is open for learning and collaboration. Please give credits if reused.

---

Would you like me to generate the actual `README.md` file so you can upload it directly to GitHub?
