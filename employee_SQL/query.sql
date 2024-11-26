select * from departments;

select * from title

select * from employees

select * from dept_emp

select * from dept_manager

select * from salaries

select e.emp_no, e.first_name, e.last_name, e.sex, s.salary
from employees e
join salaries s on e.emp_no = s.emp_no;

select e.first_name, e.last_name, e.hire_date
from employees e
where extract(year from e.hire_date) = 1986

select d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
from dept_manager dm
join departments d on dm.dept_no = d.dept_no
join employees e on dm.emp_no = e.emp_no;

select de.dept_no, e.emp_no, e.first_name, e.last_name, d.dept_name
from dept_emp de
join departments d on de.dept_no = d.dept_no
join employees e on de.emp_no = e.emp_no;


select e.first_name, e.last_name, e.sex
from employees e
where e.first_name = 'Hercules' and e.last_name like 'B%'

select e.emp_no, e.first_name, e.last_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_name in ('Sales','Development');

select last_name, COUNT(*) AS ordr
from employees
group by last_name
order by ordr DESC;
