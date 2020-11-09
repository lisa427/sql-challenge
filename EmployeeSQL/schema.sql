-- import csv files after creating the tables in the same order 
-- that the tables were created.

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR
     );

CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id VARCHAR,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
    sex CHAR(1),
    hire_date DATE
    );

CREATE TABLE salaries (
    emp_no INTEGER PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary INTEGER
    );

CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR
    );

CREATE TABLE dept_emp (
    emp_no INTEGER,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no VARCHAR,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
    );

CREATE TABLE dept_manager (
    dept_no VARCHAR,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no INTEGER,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no, emp_no)
    );
