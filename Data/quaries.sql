--Retirement eligibility

SELECT first_name, last_name

FROM employees

WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	 
SELECT COUNT(first_name)

FROM employees

WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name

INTO retirement_info

FROM employees

WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

DROP Table retirement_info;

-- Create new table for retiring employees

SELECT emp_no, first_name, last_name

INTO retirement_info

FROM employees

WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table

SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables

SELECT d.dept_name,

     dm.emp_no,
	 
     dm.from_date,
	 
     dm.to_date
	 
FROM departments as d

INNER JOIN dept_manager as dm

ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables

SELECT retirement_info.emp_no,

    retirement_info.first_name,
	
retirement_info.last_name,

    dept_emp.to_date

From retirement_info

LEFT JOIN dept_emp

ON retirement_info.emp_no = dept_emp.emp_no;

--using alias for table above

SELECT ri.emp_no,

    ri.first_name,
	
ri.last_name,

    de.to_date

From retirement_info as ri

LEFT JOIN dept_emp as de

ON ri.emp_no = de.emp_no;

--left joing for retirement_info and dept_emp tables to a new table we create

SELECT ri.emp_no,
	ri.first_name,
	
	ri.last_name,
	
de.to_date

INTO current_emp

FROM retirement_info as ri

LEFT JOIN dept_emp as de

ON ri.emp_no= de.emp_no

WHERE de.to_date= ('9999-01-01');

--check table

Select * From current_emp;

-- Employee count by department number

SELECT COUNT(ce.emp_no), de.dept_no

INTO count_retirement

FROM current_emp as ce

LEFT JOIN dept_emp as de

ON ce.emp_no = de.emp_no

GROUP BY de.dept_no

ORDER BY de.dept_no;

SELECT * FROM salaries

ORDER BY to_date DESC;

--code for employee information table to be made

SELECT e.emp_no, 

	e.first_name, 
	
	e.last_name, 
	
	e.gender,
	
	s.salary,
	
	de.to_date
	
INTO emp_info

FROM employees as e

inner join salaries as s

ON (e.emp_no=s.emp_no)

Inner Join dept_emp as de

ON (e.emp_no= de.emp_no)

WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')

AND (de.to_date= '9999-01-01');

--List of managers per department

SELECT  dm.dept_no,

        d.dept_name,
		
        dm.emp_no,
		
        ce.last_name,
		
        ce.first_name,
		
        dm.from_date,
		
        dm.to_date
		
INTO manager_info

FROM dept_manager AS dm

    INNER JOIN departments AS d
	
        ON (dm.dept_no = d.dept_no)
		
    INNER JOIN current_emp AS ce
	
        ON (dm.emp_no = ce.emp_no);
		
--list three

SELECT ce.emp_no,

ce.first_name,

ce.last_name,

d.dept_name

INTO dept_info

FROM current_emp as ce

INNER JOIN dept_emp AS de

ON (ce.emp_no = de.emp_no)

INNER JOIN departments AS d

ON (de.dept_no = d.dept_no);

select * from dept_info;

--sales retirement info

SELECT ri.emp_no,

ri.first_name,

ri.last_name,

d.dept_name

INTO sales_info

FROM retirement_info as ri

INNER JOIN dept_emp AS de

ON (ri.emp_no = de.emp_no)

INNER JOIN departments AS d

ON (de.dept_no = d.dept_no)

WHERE d.dept_name= ('Sales');

select * from retirement_info;
