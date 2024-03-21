use hr;


show tables;

-- Case Study Question

-- Q1. Show all records from all tables in hr dataset.

select * from countries;
select * from departments;
select * from dependents;
select * from employees;
select * from jobs;
select * from locations;
select * from regions;

 -- Q  write a query  to find second highest salary in the table using basic sql commonds that will run on alll databasics.
SELECT 
    salary
FROM
    employees
ORDER BY salary DESC
LIMIT 1 , 1;



SELECT 
    MAX(salary)
FROM
    employees
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            employees)
LIMIT 1;



-- Q2. Display employees who's department_id is 9 and doing job that has maximum salary more than 10000.


SELECT 
    department_id,
    CONCAT(first_name, ' ', last_name) AS fullname,
    salary
FROM
    employees
WHERE
    department_id = 9 AND salary > 10000;



-- Q3. Display departments where the name of the manager is MICHAEL.


SELECT 
    department_id,
    CONCAT(first_name, ' ', last_name) AS manager_name,
    manager_id
FROM
    employees
WHERE
    LOWER(first_name) = 'michael';


  
-- Q4. Display jobs where the minimum salary is less than salary of employee 105.


SELECT 
    job_title, min_salary
FROM
    jobs
WHERE
    MIN_SALARY < (SELECT 
            Salary
        FROM
            Employees
        WHERE
            Employee_ID = 105);




-- Q5.Display employee name and manager name of the employee.


SELECT 
    CONCAT(E.first_name, ' ', E.last_name) AS Employee_Name,
    CONCAT(M.first_name, ' ', M.last_name) AS Manager_Name
FROM
    Employees AS E
        JOIN
    Employees AS M ON E.MANAGER_ID = M.EMPLOYEE_ID;



-- Q6. Display number of employees joined in each year into department 5 and 9.


SELECT 
    YEAR(hire_date) AS year_joined,
    COUNT(first_name) AS num_employees
FROM
    employees
WHERE
    department_id IN (5 , 9)
GROUP BY YEAR(hire_date)
ORDER BY year_joined;



-- Q7. Display job id, department id and sum of salary by including all possible dimensions.


SELECT 
    job_id, department_id, SUM(salary) AS total_salary
FROM
    employees
GROUP BY job_id , department_id; 





-- Q8. Display employee name and job title of jobs where salary of employee is between minimum and maximum salary for job.

SELECT 
    CONCAT(first_name, ' ', last_name) AS employee_name,
    j.job_title,
    salary
FROM
    employees e
        JOIN
    jobs j ON e.job_id = j.job_id
WHERE
    salary BETWEEN min_salary AND max_salary;



-- Q9. Display first name, job title, department name of employees who joined on 17th June.

SELECT 
    first_name, job_title, department_name, hire_date
FROM
    employees e
        JOIN
    jobs j ON e.job_id = j.job_id
        JOIN
    departments d ON e.department_id = d.department_id
WHERE
    DATE_FORMAT(HIRE_DATE, '%m-%d') = '06-17';


-- Q10. Display employees where the first name or last name starts with S.

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name LIKE 'S%'
        OR last_name LIKE 'S%';



-- Q11. Display employees who joined in the month of May.



SELECT 
    CONCAT(first_name, ' ', last_name) AS employees, hire_date
FROM
    employees
WHERE
    MONTH(hire_date) = 5;



-- Q12. Display first name and date of first salary of the employees.
SELECT 
    first_name, LAST_DAY(hire_date) AS First_Salary_Date
FROM
    employees;




-- Q13. Display first name and last name of employees who joined in 1197.

SELECT 
    first_name, last_name, YEAR(HIRE_DATE) AS YEAR_HIRED
FROM
    employees
WHERE
    YEAR(HIRE_DATE) = 1997;



-- Q14. Display the first word in job title.


SELECT 
    job_title, SUBSTRING_INDEX(job_title, ' ', 1) AS first_word
FROM
    jobs;





SELECT 
    SUBSTRING_INDEX(job_title, ' ', 1) AS first_word
FROM
    jobs;



-- Joins Activity Question

-- Q1. Write a query in SQL to display the first name,last name,department number, and department name for each employee.

SELECT 
    CONCAT(first_name, ' ', last_name) AS fullname,
    D.department_id,
    department_name
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id;


-- Q2. Write a query in SQL to display the first name, last name,department number, and department name for all employees for depatments 80 or 40.



SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS fullname,
    e.phone_number,
    d.department_name
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
        AND d.department_id IN (80 , 40);



-- Q3. Write a query in SQL to display those employees who contain a letter r to their first name and also display 
-- their last name,department,city,and state province.

SELECT 
    first_name, last_name, department_name, city, state_province
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
        JOIN
    locations l ON d.location_id = l.location_id
WHERE
    first_name LIKE '%r%';


-- Q4. Write Query in SQL to display the first name,last name, department number and name, for all employees who have or have not any department. 
-- (Hint: Slove this query using left join).

SELECT 
    first_name, last_name, d.department_id, d.department_name
FROM
    employees e
        LEFT JOIN
    departments d ON e.department_id = d.department_id;



-- Q5. Write a query in SQL to display the department name, full name(first and last name) of manager, and their city.

SELECT 
    CONCAT(first_name, ' ', last_name) AS manager,
    d.department_name,
    l.city
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
        JOIN
    locations l ON d.location_id = l.location_id;