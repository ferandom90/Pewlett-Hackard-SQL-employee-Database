-- List the employee number, last name, first name, sex, and salary of each employee (2 points)
/*

-- Seleccionamos el numero de empleado, primer nombre, segundo nombre y salario de las tablas empleados y salario 

(SE SELECCIONAN LAS DOS TABLAS PARA DE LA TABLA DE EMPLEADOS TRAER SUS DATOS Y DE LA TABLA DE SALARIO OBTENER EL SALARIO DEL EMPLEADO

EN BASE A LA RELACION DE LLAVE FORANEA DONDE LA TABLA SALARY TIENE COMO LLAVE FORANEA EMP_NO QUE SE RELACIONA CON LA TABLA EMPLEADOS DE SU LLAVE PRIMARIA EMP_NO

*/

SELECT employees.emp_no, first_name, last_name, sex, salary FROM employees, salary WHERE employees.emp_no=salary.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)

/*

-- Seleccionamos el numero de empleado, primer nombre, segundo nombre y salario de las tablas empleados y salario 

(SE SELECCIONAN LAS DOS TABLAS PARA DE LA TABLA DE EMPLEADOS TRAER SUS DATOS Y DE LA TABLA DE SALARIO OBTENER EL SALARIO DEL EMPLEADO

EN BASE A LA RELACION DE LLAVE FORANEA DONDE LA TABLA SALARY TIENE COMO LLAVE FORANEA EMP_NO QUE SE RELACIONA CON LA TABLA EMPLEADOS DE SU LLAVE PRIMARIA EMP_NO

*/

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