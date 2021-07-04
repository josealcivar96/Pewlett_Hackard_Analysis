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
