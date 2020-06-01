-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/5vwTe1
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

Select * From departments

CREATE TABLE "titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

Select * From titles

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title" VARCHAR(30)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(5)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

SELECT * FROM employees

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" int   NOT NULL
);

Select * From dept_manager

DROP TABLE IF EXISTS "Dept_emp"
CREATE TABLE "Dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR(10) NOT NULL
);

Select * FROM "Dept_emp"


CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

Select * FROM "salaries"

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");




--- DATA ANALYSIS
--- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
	 	e.emp_no as "Employee Number"
	   ,e.last_name as "Last Name"
	   ,e.first_name as "First Name"
	   ,e.sex as "Sex"
	   ,cast (s.salary as money) as "Salary"
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
	
INNER JOIN dept_manager dm ON 
	d.dept_no = dm.dept_no	









---4. List the department of each employee with the following information: employee number, last name, first name, and department name.

---5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

---6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

---7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

---8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

