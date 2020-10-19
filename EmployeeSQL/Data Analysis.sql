--1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;

--2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,last_name,hire_date
FROM employees
WHERE EXTRACT(year FROM "hire_date") = 1986;

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no,d.dept_name,m.emp_no,e.last_name,e.first_name
FROM departments d
LEFT JOIN dept_manager m
ON d.dept_no = m.dept_no
LEFT JOIN employees e
ON m.emp_no = e.emp_no;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees e
LEFT JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
LEFT JOIN departments d
ON d.dept_no = dept_emp.dept_no;

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name,sex
FROM employees
WHERE 1=1 
AND first_name = 'Hercules' 
AND last_name LIKE 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees e
LEFT JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
LEFT JOIN departments d
ON d.dept_no = dept_emp.dept_no
WHERE d.dept_name = 'Sales';

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees e
LEFT JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
LEFT JOIN departments d
ON d.dept_no = dept_emp.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;