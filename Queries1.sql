-- List the employee number, last name, first name, sex, and salary of each employee (2 points)

SELECT employees.emp_no, first_name, last_name, sex, salary FROM employees, salary WHERE employees.emp_no=salary.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)


SELECT first_name, last_name, hire_date FROM employees WHERE EXTRACT(YEAR FROM hire_date)=1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)

SELECT dept_manager.dept_no,dept_name, dept_manager.emp_no, last_name, first_name FROM dept_manager, employees, departments WHERE dept_manager.dept_no=departments.dept_no AND dept_manager.emp_no=employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)

SELECT dept_employee.dept_no, dept_employee.emp_no, last_name, first_name, dept_name FROM dept_employee, departments, employees WHERE dept_employee.emp_no=employees.emp_no AND dept_employee.dept_no=departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)

SELECT first_name, last_name, sex FROM employees WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name (2 points)

SELECT dept_name, dept_employee.emp_no, last_name, first_name FROM dept_employee, departments, employees WHERE dept_name='Sales' AND dept_employee.emp_no=employees.emp_no AND dept_employee.dept_no=departments.dept_no; 

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

SELECT dept_employee.emp_no, last_name, first_name, dept_name FROM dept_employee, departments, employees WHERE (dept_name='Sales' OR dept_name='Development') AND dept_employee.emp_no=employees.emp_no AND dept_employee.dept_no=departments.dept_no; 

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)

SELECT last_name, COUNT(*) AS frequency FROM Employees GROUP BY last_name ORDER BY frequency DESC;



TABLAS

---------------


CREATE TABLE Title(Title_Id VARCHAR(10) PRIMARY KEY, Title VARCHAR(80) NOT NULL UNIQUE));

CREATE TABLE Employees(Emp_no Integer PRIMARY KEY, Emp_title_id VARCHAR(10) NOT NULL, Birth_date DATE NOT NULL, First_name VARCHAR(50) NOT NULL, Last_name VARCHAR(50) NOT NULL, Sex CHAR(1) NOT NULL, Hire_date DATE NOT NULL, FOREIGN KEY (Emp_title_id) REFERENCES Title(Title_Id));


CREATE TABLE Salary(Emp_no Integer NOT NULL UNIQUE, Salary Integer NOT NULL, FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no));


CREATE TABLE Departments(Dept_no VARCHAR(10) PRIMARY KEY, Dept_name VARCHAR(50) NOT NULL UNIQUE);

CREATE TABLE Dept_manager(Dept_no VARCHAR(10) NOT NULL, Emp_no Integer NOT NULL UNIQUE, FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no), FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no));


CREATE TABLE Dept_employee(Emp_no Integer NOT NULL, Dept_no VARCHAR(10) NOT NULL, FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no), FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no));



Submission
Before submitting your Challenge assignment, make sure that you’ve done the following:

Create an image file of your ERD.

Create a .sql file of your table schemata.

Create a .sql file of your queries.

(Optional) Create a Jupyter notebook of the bonus analysis. (Note: there will be no extra points for completing this.)

Ensure that your repository has regular commits and a thorough README.md file

To submit your Challenge assignment, click Submit, and then provide the URL of your GitHub repository for grading.


COMMANDS
-----------


docker run --name postgres-container -p 5432:5432 -e POSTGRES_PASSWORD=postgres -v C:\Users\Guest Mode\Desktop\Dockerized 
postgresql:/var/lib/postgresql/data -d postgres

----RUN POSTGRESQL CONTAINER WITH VOLUME FOR PERSISTENT DATA

docker run --name postgres-container -p 5432:5432 -e POSTGRES_PASSWORD=postgres -v "C:/Users/Guest Mode/Desktop/dockerized_postgres/data":/var/lib/postgresql/data -d postgres


docker run -d --name postgres-container -p 5432:4532 -v pgdata:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres postgres






----SQL COMMANDS ON DOCKER

docker exec -it <container_id_or_name> psql -U postgres -d <database_name> -c "<sql_command>"

-----DOCKER PGMYADMIN INTIALIZE CONTAINER

docker run --name my-pgadmin -p 8083:80 -e 'PGADMIN_DEFAULT_EMAIL=enriquehernandez.pereyra@gmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=postgres' -d dpage/pgadmin4

----DOCKER CONTAINER IP Address

docker exec <container_id_or_name> hostname -i

----CONNECT TO DATABASE INSIDE CONTAINER 

psql -U postgres -d <database_name>

----COPY CSV FILE TO DOCKER CONTAINER

docker cp data.csv my-postgres:/data/data.csv

----COPY CSV FILE DATA TO TABLE OF POSTGRESQL

COPY <table_name> FROM '<container_file_path>' DELIMITER ',' CSV HEADER;

----MAKE BACKUP OF .SQL FILE 

docker exec postgres-container pg_dump -U postgres -d postgres -f /home/user/backups/schema.sql

docker cp postgres-container:/home/schema.sql "C:/Users/Guest Mode/Desktop/dockerized_postgres/schema.sql"



