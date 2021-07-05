--selecting employees born between 1952 and 1955
select first_name, laast_name
from employees
where birth_date between '1952-01-01' and '1955-12-31';

--selecting employees born in 1952
select first_name, laast_name
from employees
where birth_date between '1952-01-01' and '1952-12-31';

--selecting employees born in 1953
select first_name, laast_name
from employees
where birth_date between '1953-01-01' and '1953-12-31';

--selecting employees born in 1954
select first_name, laast_name
from employees
where birth_date between '1954-01-01' and '1954-12-31';

--selecting employees born in 1955
select first_name, laast_name
from employees
where birth_date between '1955-01-01' and '1955-12-31';

--retirement elegibility
select first_name, laast_name as last_name
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
AND (hire_date between '1985-01-01' and '1988-12-31');

--number of employees retiring
select count(first_name)
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
AND (hire_date between '1985-01-01' and '1988-12-31');

--exporting a retirement table
select first_name, laast_name
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
AND (hire_date between '1985-01-01' and '1988-12-31');

select * from retirement_info
drop table retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, laast_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

--Joining departments and dept_manager tables
select d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
from departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no;

--joining retirement_info and dept_emp tables
select ri.emp_no,
	ri.first_name,
	ri.laast_name,
	de.to_date
into current_emp
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
where de.to_date=('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
into retirement_count
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

--List 1: Employee information
SELECT e.emp_no,
	e.first_name,
	e.laast_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e
inner join salaries as s
on (e.emp_no = s.emp_no)
inner join dept_emp as de
on (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

--List 2: Management
select dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.laast_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
into manager_info
from dept_manager as dm
	inner join departments as d
		on (dm.dept_no = d.dept_no)
	inner join current_emp as ce
		on (dm.emp_no = ce.emp_no);

--List 3: Department Retirees
SELECT ce.emp_no,
	ce.first_name,
	ce.laast_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
	INNER JOIN dept_emp AS de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no);

--info relevant to the sales team
select ce.emp_no,
	ce.first_name,
	ce.laast_name,
	d.dept_name
from current_emp as ce
	inner join dept_emp as de
		on (ce.emp_no = de.emp_no)
	inner join departments as d
		on (de.dept_no = d.dept_no)
where dept_name = 'Sales';

--info relevant to the sales team
select ce.emp_no,
	ce.first_name,
	ce.laast_name,
	d.dept_name
from current_emp as ce
	inner join dept_emp as de
		on (ce.emp_no = de.emp_no)
	inner join departments as d
		on (de.dept_no = d.dept_no)
where dept_name in ('Sales', 'Development');
