--1. List the following details of each employee: employee number, last name, 
-----first name, sex, and salary.

SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no
;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name,
employees.last_name,
employees.hire_date
From employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no
;

--3. List the manager of each department with the following information: department number, 
-----department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no,
departments.dept_name,
dept_manager.emp_no,
employees.last_name,
employees.first_name
from dept_manager
Left Join departments
On dept_manager.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no
ORDER BY emp_no
;

--4. List the department of each employee with the following information: employee number, 
-----last name, first name, and department name.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
order by emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" 
-----and last names begin with "B."
SELECT employees.first_name,
employees.last_name,
employees.sex
From employees
Where employees.first_name = 'Hercules' And employees.last_name like 'B%'
Order by employees.last_name
;

--6. List all employees in the Sales department, including their employee number, 
-----last name, first name, and department name.
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
departments.dept_name
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales'
Order by emp_no
;

--7. List all employees in the Sales and Development departments, including their 
-----employee number, last name, first name, and department name.
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
departments.dept_name
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales' Or departments.dept_name='Development' 
Order by emp_no
;

--8. In descending order, list the frequency count of employee last names, 
-----i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC
;





