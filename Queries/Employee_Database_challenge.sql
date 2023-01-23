--Deliverable 1: The number of Retiring Employees by Title

--Retrieve the emp_no, first_name, and last_name coluns from the employees table
--Retrieve the title, from_date and to_date from Titles table

SELECT e.emp_no,
		
	   e.first_name, 
	   
	   e.last_name,
	   
	   t.title,
	   
	   t.from_date,
	   
	   t.to_date
	  
INTO retirement_titles

FROM employees as e

INNER JOIN titles as t

ON e.emp_no= t.emp_no

WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

ORDER BY e.emp_no; 

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no,

first_name,

last_name,

title

INTO unique_titles

FROM retirement_titles 

WHERE retirement_titles.to_date= ('9999-01-01')

ORDER BY emp_no, to_date DESC;

--retrieve the number of employees by their most recent job title who are about to retire

SELECT COUNT(ut.emp_no),

ut.title

INTO retiring_titles

FROM unique_titles as ut

GROUP BY title 

ORDER BY COUNT(title) DESC;

--Deliverable 2 Employees Eligible for mentorship program

SELECT DISTINCT ON (e.emp_no) e.emp_no,
		
	   e.first_name, 
	   
	   e.last_name,
	   
	   e.birth_date,
	   
	   de.from_date,
	   
	   de.to_date,
	   
	   t.title
	   
INTO mentorship_eligibility

FROM employees as e

INNER JOIN dept_emp as de
	
ON (e.emp_no= de.emp_no)
	
INNER JOIN titles as t
	
ON (e.emp_no= t.emp_no)

WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')

AND de.to_date= ('9999-01-01')

ORDER BY e.emp_no; 