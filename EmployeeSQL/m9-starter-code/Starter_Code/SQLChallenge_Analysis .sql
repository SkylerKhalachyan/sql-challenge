-- #1
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from Employees as e join salaries as s 
on e.emp_no = s.emp_no;

--#2
select e.first_name, e.last_name, e.hire_date
from employees as e
where Year(e.hire_date) = 1986 ;

--#3
select Distinct(e.first_name, "Departments".dept_no, "Departments".dept_name, e.emp_no, e.last_name, e.first_name)
from employees as e inner join dept_manager on e.emp_no=dept_manager.emp_no 
inner join "Departments" on dept_manager.dept_no="Departments".dept_no 
inner join dept_emp on "Departments".dept_no=dept_emp.dept_no;

--#4
select "Departments".dept_no, e.emp_no, e.last_name, e.first_name, "Departments".dept_name
from employees as e inner join dept_manager on e.emp_no=dept_manager.emp_no 
inner join "Departments" on dept_manager.dept_no="Departments".dept_no 
inner join dept_emp on "Departments".dept_no=dept_emp.dept_no;

--#5
select e.first_name, e.last_name, e.sex
from employees as e 
where e.first_name like 'Hercules%' and e.last_name like 'B%';

--#6
select e.emp_no, e.last_name, e.first_name
from employees as e inner join dept_manager on e.emp_no=dept_manager.emp_no
inner join "Departments" on dept_manager.dept_no="Departments".dept_no
where "Departments".dept_name like 'Sales';

--#7
select e.emp_no, e.last_name, e.first_name, "Departments".dept_name
from employees as e join dept_manager on e.emp_no=dept_manager.emp_no 
join "Departments" on dept_manager.dept_no="Departments".dept_no
where "Departments".dept_name = 'Sales' or "Departments".dept_name = 'Development';

--#8
select e.last_name, count(distinct(e.last_name))
from employees as e
group by e.last_name
order by e.last_name desc;

