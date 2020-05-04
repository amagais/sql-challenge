

--Question #1 
--List the following details of each employee:
--employee number, last name, first name, gender, and salary.   

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;

--Question #2 
--List employees who were hired in 1986.

SELECT *
FROM employees e
WHERE DATE_PART('year',hire_date) = 1986;

--Question #3 
SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name,e.last_name, dt.from_date, dt.to_date

FROM departments AS d
	LEFT JOIN dept_manager AS m
	ON (d.dept_no = m.dept_no)
		INNER JOIN employees AS e
		ON (m.emp_no = e.emp_no)
			INNER JOIN dept_emp AS dt 
			ON (e.emp_no = dt.emp_no ); 

--Question #4 
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name. 
SELECT e.emp_no, e.first_name,e.last_name, d.dept_name

FROM employees AS e
	INNER JOIN dept_manager AS m
	ON (e.emp_no = m.emp_no)
		INNER JOIN departments AS d
		ON (m.dept_no = d.dept_no); 


--Question #5
SELECT * 
FROM employees e
WHERE e.first_name = 'Hercules' AND SUBSTRING(last_name, 1, 1) = 'B';

--Question #6 
--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.first_name,e.last_name,d.dept_name 
FROM employees AS e 
	LEFT JOIN dept_manager AS m 
	ON (e.emp_no = m.emp_no)
		INNER JOIN departments as d 
		ON (m.dept_no = d.dept_no)
		WHERE d.dept_name IN 
			(
			SELECT d.dept_name
			FROM departments
			WHERE d.dept_name = 'Sales'
			)
--QUestion #7 
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT e.emp_no,e.first_name,e.last_name,d.dept_name 
FROM employees AS e 
	LEFT JOIN dept_manager AS m 
	ON (e.emp_no = m.emp_no)
		INNER JOIN departments as d 
		ON (m.dept_no = d.dept_no)
		WHERE d.dept_name IN 
			(
			SELECT d.dept_name
			FROM departments
			WHERE d.dept_name = 'Sales' AND d.dept_name = 'Development'
			)


--Question #8 
--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT e.last_name, COUNT (e.last_name) AS last_count 
FROM employees e
GROUP BY e.last_name
ORDER BY last_count DESC;
