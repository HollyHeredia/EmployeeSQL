create table departments (
	dept_no float(10) not null,
	dept_name varchar not null);
	
select * from departments;

create table dept_emp (
	id serial primary key,
	emp_no int not null,
	dept_no varchar(10) not null);
		
create table dept_manager (
	id serial primary key,
	dept_no varchar(10) not null,
	emp_no int not null);
	
select * from dept_manager;
	
create table employees (
	id serial,
	emp_no int not null primary key,
	emp_title_id varchar(10) not null,
	birth_date date not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex char(1) not null,
	hire_date date not null);

Alter Table tablename
	Add column salary_id;
	PRIMARY KEY (emp_no),
    FOREIGN KEY (customer_id) REFERENCES customer(id)

create table salaries (
	id serial primary key,
	emp_no int,
	salary int
	);

select * from salaries

create table titles (
	id serial,
	title_id varchar(5) primary key,
	title varchar(30)
	PRIMARY KEY (title_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

select * from titles