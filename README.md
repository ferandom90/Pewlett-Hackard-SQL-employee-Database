# sql-challenge

This Module 9 challenge consists of three parts: data modeling, data engineering, and data analysis.

In the data modeling phase, you have to examine the CSV files and create an Entity Relationship Diagram (ERD) that is attached on the repository  using a tool like QuickDBD. This diagram will represent the tables and their relationships.

Moving on to data engineering, you designed a table schema for each of the six CSV files provided; departments, dept_employee, dept_manager, employees, salary and title, hence you specify the appropriate data types, primary keys, foreign keys, and any other constraints necessary.

For primary keys, if they are not unique, you create and combine two primary keys to uniquely identify a row. It is very important to create the tables in the correct order to handle the foreign keys properly. Finally, you import each CSV file into its corresponding SQL table.

In the data analysis phase, several queries need to be performed on the data. These include listing the employee number, last name, first name, sex, and salary of each employee, as well as listing the first name, last name, and hire date of employees hired in 1986. 
Additionally, you should list the manager of each department along with their department number, department name, employee number, last name, and first name. 

Another query involves listing the department number for each employee along with their employee number, last name, first name, and department name. Furthermore, you are required to list the first name, last name, and sex of employees named Hercules whose last name begins with the letter B. You should also list each employee in the Sales department, including their employee number, last name, and first name, as well as employees in the Sales and Development departments, including their employee number, last name, first name, and department name. Lastly, you need to provide the frequency counts, in descending order, of all employee last names, indicating how many employees share each last name.
