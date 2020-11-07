-- lists employee number, last name, first name, sex, and salary for each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON
e.emp_no = s.emp_no;

-- lists first name, last name, and hire date for each employee hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/86' AND '12/31/86';

-- lists managers in each department, includes dept number, dept name, 
-- manager's employee number, last name, and first name
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments AS d
LEFT JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
LEFT JOIN employees AS e
ON e.emp_no = dm.emp_no;

-- lists employee number, last name, first name, and department name for each employee
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON d.dept_no = de.dept_no;

-- lists first name, last name, and sex for employees with first name of Hercules and a last
-- name that starts with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- lists employee number, last name, first name, and department name for each employee in
-- the Sales department
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

-- lists employee number, last name, first name, and department name for each employee in
-- the Sales and Developement departments
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- counts how many employees have each last name, displays in descending order
SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;