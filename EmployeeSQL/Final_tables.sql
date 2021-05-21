CREATE TABLE "departments" (
    "id" serial   NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar   NOT NULL
);

CREATE TABLE "dept_emp" (
    "id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" varchar(10)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "id" serial   NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "employees" (
    "id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(10)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" char(1)   NOT NULL,
    "hire_date" date   NOT NULL
);

CREATE TABLE "salaries" (
    "id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "id" serial   NOT NULL,
    "title_id" varchar(5)   NOT NULL,
    "title" varchar(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- adding in primary keys as ids after the tables were created
alter table departments
add primary key (dept_no);
																								
ALTER TABLE employees
add primary key (emp_no);

ALTER TABLE titles
add primary key (title_id);

--adding foreign keys
ALTER TABLE dept_emp 
ADD FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);

ALTER TABLE dept_emp 
ADD FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager
ADD FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager
ADD FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);

ALTER TABLE salaries
ADD FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);

