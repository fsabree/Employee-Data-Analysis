--List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp.emp_no, emp.last_name,emp.first_name, emp.gender,sal.salary
from employees emp
join salaries sal
on emp.emp_no = sal.emp_no
order by 1;

--List first name, last name, and hire date for employees who were hired in 1986.
select emp.first_name, emp.last_name, emp.hire_date
from employees emp
where date_part('year',emp.hire_date) = '1986';

/*List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name.
*/
select deptm.dept_no,dept.dept_name,deptm.emp_no as manager_emp_no,
emp.last_name as manager_last_name,
emp.first_name as manager_first_name
from dept_manager deptm
join departments dept
on deptm.dept_no = dept.dept_no
join employees emp
on emp.emp_no = deptm.emp_no
order by 1,4;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp.emp_no,emp.last_name,emp.first_name,dept.dept_name
from employees emp
join dept_emp depte
on emp.emp_no = depte.emp_no
join departments dept
on depte.dept_no = dept.dept_no
order by dept.dept_name,emp.last_name

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name,last_name,gender
from employees
where first_name = 'Hercules'
and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp.emp_no,emp.last_name,emp.first_name,dept.dept_name
from employees emp
join dept_emp depte
on emp.emp_no = depte.emp_no
join departments dept
on depte.dept_no = dept.dept_no
where dept.dept_name = 'Sales'
order by dept.dept_name,emp.last_name

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no,emp.last_name,emp.first_name,dept.dept_name
from employees emp
join dept_emp depte
on emp.emp_no = depte.emp_no
join departments dept
on depte.dept_no = dept.dept_no
where dept.dept_name in ('Sales','Development')
order by dept.dept_name,emp.last_name

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select count(*),last_name
from employees
group by 2
order by 1 desc