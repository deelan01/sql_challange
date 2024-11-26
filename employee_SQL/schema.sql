-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
ALTER TABLE "dept_manager" DROP CONSTRAINT IF EXISTS "fk_dept_manager_dept_no";
ALTER TABLE "dept_manager" DROP CONSTRAINT IF EXISTS "fk_dept_manager_emp_no";
DROP TABLE IF EXISTS "departments" CASCADE;
DROP TABLE IF EXISTS "title" CASCADE;
DROP TABLE IF EXISTS "employees" CASCADE;
DROP TABLE IF EXISTS "dept_emp" CASCADE;
DROP TABLE IF EXISTS "dept_manager" CASCADE;
DROP TABLE IF EXISTS "salaries" CASCADE;


CREATE TABLE "departments" (
    "dept_no" VARCHAR(10),
	"dept_name" VARCHAR(50) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

CREATE TABLE "title" (
    "title_id" VARCHAR(50) NOT NULL,
    "title" VARCHAR(50),
    CONSTRAINT "pk_title" PRIMARY KEY ("title_id")
);


CREATE TABLE "employees" (
    "emp_no" int NOT NULL,
    "emp_title" VARCHAR(10) NOT NULL,
    "birth_date" date,
    "first_name" VARCHAR(50),
    "last_name" VARCHAR(50),
    "sex" VARCHAR(10),
    "hire_date" date,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);

CREATE TABLE "dept_emp" (
    "emp_no" int,
    "dept_no" VARCHAR(10) NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no","dept_no"),
    CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no"),
	CONSTRAINT "fk_dept_no_dept_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(10) NOT NULL,
	"emp_no" int NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);
CREATE TABLE "salaries" (
    "emp_no" int NOT NULL,
	"salary" DECIMAL, 
    CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no"), 
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
	
);
