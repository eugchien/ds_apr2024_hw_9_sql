-- Create new tables
CREATE TABLE departments (
  dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
  dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR(50) NOT NULL,
  birth_date DATE,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date DATE
);

CREATE TABLE titles (
  title_id VARCHAR(5) NOT NULL PRIMARY KEY,
  title VARCHAR(50) NOT NULL
);

CREATE TABLE dept_emp (
  emp_no INT references "employees" (emp_no),
  dept_no VARCHAR(5) NOT NULL references "departments" (dept_no)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR(4) NOT NULL references "departments" (dept_no),
  emp_no INT references "employees" (emp_no)
);

CREATE TABLE salaries (
  emp_no INT references "employees" (emp_no),
  salary INT
);

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT  employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries on employees.emp_no=salaries.emp_no
;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT  first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' and '12/31/1986'
;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departments.dept_no, departments.dept_name, employees.emp_no, employees.first_name, employees.last_name
FROM dept_manager
INNER JOIN employees on	dept_manager.emp_no=employees.emp_no
;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

-- List each employee in the Sales department, including their employee number, last name, and first name.

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).