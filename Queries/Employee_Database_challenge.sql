--finding retiring titles and placing them in a table
select e.emp_no,
	e.first_name,
	e.laast_name,
	t.title,
	t.from_date,
	t.to_date
into retirement_titles
from employees as e
	left join titles as t
		on (e.emp_no = t.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.laast_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- get count of titles
SELECT count(ut.title),
	ut.title
into retiring_titles
from unique_titles as ut
group by ut.title
order by count desc;

--mentorship eligibility table
select distinct on (e.emp_no) e.emp_no,
	e.first_name,
	e.laast_name,
	t.title,
	e.birth_date,
	de.from_date,
	de.to_date
into mentorship_eligibility
from employees as e
	left join dept_emp as de
	on (e.emp_no = de.emp_no)
	left join titles as t
	on (e.emp_no = t.emp_no)
where (de.to_date = '9999-01-01') and (e.birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no
