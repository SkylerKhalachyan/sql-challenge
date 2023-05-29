-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "department_id" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "department_id"
     )
);

CREATE TABLE "dept_emp" (
    "dept_emp_id" INT   NOT NULL,
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "department_id" INT   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "dept_emp_id"
     )
);

CREATE TABLE "dept_manager" (
    "dept_manager_id" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    "department_id" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_manager_id"
     )
);

CREATE TABLE "employees" (
    "employee_id" INT   NOT NULL,
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    "department_id" INT   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_id","department_id"
     )
);

CREATE TABLE "salaries" (
    "salaries_id" INT   NOT NULL,
    "employee_id" INT   NOT NULL,
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "department_id" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "salaries_id","department_id"
     )
);

CREATE TABLE "Titles" (
    "emp_no" INT   NOT NULL,
    "department_id" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "emp_no","department_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_department_id" FOREIGN KEY("department_id")
REFERENCES "Departments" ("department_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_department_id" FOREIGN KEY("department_id")
REFERENCES "Departments" ("department_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_department_id" FOREIGN KEY("department_id")
REFERENCES "Departments" ("department_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_id_department_id" FOREIGN KEY("employee_id", "department_id")
REFERENCES "employees" ("employee_id", "department_id");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_department_id" FOREIGN KEY("department_id")
REFERENCES "Departments" ("department_id");

