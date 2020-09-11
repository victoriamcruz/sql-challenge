Select * from departments
Select * from dept_emp
Select * from dept_manager
Select * from employees
Select * from salaries
Select * from titles
--1
select  
employees.emp_no,
employees.last_name,  
employees.first_name, 
employees.sex,
salaries.salary
from employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--2
select employees.emp_no,
	employees.first_name,
	employees.last_name,
	EXTRACT (YEAR FROM hire_date) AS YEAR
from employees
where hire_date > '12/31/1985' and hire_date < '01/01/1987';

--3
select
dept_manager.dept_no,
departments.dept_name,
dept_manager.emp_no,
employees.last_name,  
employees.first_name
from departments
inner join dept_manager on departments.dept_no = dept_manager.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no;

--4
select 
employees.emp_no,
employees.last_name,  
employees.first_name,
departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no;


--5
select employees.first_name,
	employees.last_name,
	employees.sex
from employees
where first_name = 'Hercules' and last_name like 'B%';
	
--6
select 
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

--7
select 
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

--8
select last_name, count (last_name) as name_cnt
from employees
group by last_name