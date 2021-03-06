--- DATA ANALYSIS
--- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
	 	e.emp_no
	   ,e.last_name
	   ,e.first_name
	   ,e.sex
	   ,s.salary
FROM employees e

INNER JOIN salaries s ON
	   e.emp_no = s.emp_no;

---2. List first name, last name, and hire date for employees who were hired in 1986. 

SELECT 
	    e.last_name as "Last Name"
	   ,e.first_name as "First Name"
	   ,e.hire_date as "Hire Date"
FROM employees e
		WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';


---3.  List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT
	 d.dept_no AS "Department #"
	,d.dept_name AS "Department Name "
	,dm.emp_no AS "Manager Employee Num"
	,e.last_name AS "Last Name"
	,e.first_name AS "First Name"

FROM 
	dept_manager dm
	
INNER JOIN departments d  ON 
		   d.dept_no = dm.dept_no
INNER JOIN employees e ON
			e.emp_no = dm.emp_no

---4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
	 	e.emp_no AS "Employee Number"
	   ,e.last_name AS "Last Name"
	   ,e.first_name AS "First Name"
	   ,d.dept_name as "Department Name"
FROM employees e

INNER JOIN "Dept_emp" de  ON
	   de.emp_no = e.emp_no
INNER JOIN departments d ON
		d.dept_no = de.dept_no;


---5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT
	e.last_name AS "Last Name"
	,e.first_name AS "First Name"
	,e.sex AS "Gender"
FROM 
	employees e
WHERE e.first_name = 'Hercules' AND upper(e.last_name) LIKE 'B%';


---6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
	 e.emp_no AS "Employee Number"
	 ,e.last_name AS "Last Name"
	 ,e.first_name AS "First Name"
	 ,d.dept_name AS "Department"

FROM employees e

	INNER JOIN "Dept_emp" de ON
	 	de.emp_no = e.emp_no

	INNER JOIN departments d ON
		d.dept_no = de.dept_no 
		AND d.dept_name = 'Sales';


---7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	 e.emp_no AS "Employee Number"
	 ,e.last_name AS "Last Name"
	 ,e.first_name AS "First Name"
	 ,d.dept_name AS "Department"

FROM employees e

	INNER JOIN "Dept_emp" de ON
	 	de.emp_no = e.emp_no

	INNER JOIN departments d ON
		d.dept_no = de.dept_no 
		AND d.dept_name IN ('Sales','Development');

---8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

Select last_name AS "Last Name"
	,COUNT(last_name) AS "Count Frequency"
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;



