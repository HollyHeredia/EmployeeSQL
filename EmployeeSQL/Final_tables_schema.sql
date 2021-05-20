-- Challenges to create views!

/* #1. Emp_Salaries = employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
	Merge employees and salaries on emp_no*/

create view emp_salaries as(
	Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
	From employees 
	Inner join salaries on
	employees.emp_no=salaries.emp_no);
	
select * from emp_salaries;

/* 2. hire_1986 = employees.first_name, employees.last_name, employees.hire_date
	Note: only for employees hired in the year 1986*/
	
Create view hire_1986 as 
	 select employees.first_name, employees.last_name, employees.hire_date
	 from employees;

select * from hire_1986;

select * from hire_1986
	where hire_date between '1986-01-01' and '1986-12-31';
	
/* 3. managers = dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name 
	Notes: joining dept_manager, departments, and employees*/
	
create view managers as
	select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name 
	from dept_manager
	join departments on
		(dept_manager.dept_no=departments.dept_no)
	join employees on
		(employees.emp_no=dept_manager.emp_no);
		
select * from managers;	

/* 4. emp_dept = employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	Notes: common columns - employees.emp_no JOIN dept_emp.emp_no, departments.dept_no JOIN dept_emp.dept_no*/
	
Create view emp_dept as
	select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	from dept_emp
		join employees 
		on (dept_emp.emp_no=employees.emp_no)
		join departments
		on (dept_emp.dept_no=departments.dept_no);
		
select * from emp_dept;

/* 5. hercules_b = employees.first_name, employees.last_name, employees.sex
	Notes: first_name = hercules, last_name = b% */
	
create view hercules_b as
	select employees.first_name, employees.last_name, employees.sex
	from employees
	where employees.first_name = 'Hercules' 
	and employees.last_name like 'B%';
	
select * from hercules_b;

/* 6. sales_dept = employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	notes: employees.emp_no JOIN dept_emp.emp_no; dept_emp.dept_no JOIN departments.dept_no
	departments.dept_name = sales*/
	
create view sales_dept as
	select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	from dept_emp
	join employees 
		on (dept_emp.emp_no=employees.emp_no)
	join departments
		on (dept_emp.dept_no=departments.dept_no);
	
select * from sales_dept	
	where dept_name='Sales';
	
/* 7. sales_dev = employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	notes: employees.emp_no JOIN dept_emp.emp_no; dept_emp.dept_no JOIN departments.dept_no
	departments.dept_name = sales and development*/
	
create view sales_dev as
	select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	from dept_emp
	join employees 
	on (dept_emp.emp_no=employees.emp_no)
	join departments
	on (dept_emp.dept_no=departments.dept_no);

SELECT *
FROM sales_dev
WHERE dept_name IN
(
  SELECT dept_name
  FROM sales_dev
  WHERE dept_name IN ('Sales', 'Development')
	);
	
/* 8. count_last_name = Count of employees.last_name
	note: list in decending order*/
	
create view count_last_name as
	select last_name, count(last_name) as count_last_name
	from employees
	group by last_name
	order by count_last_name desc;
	
select * from count_last_name;

