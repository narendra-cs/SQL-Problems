
-- Compare each employee's salary with the average salary of the corresponding department.
-- Output the department, first name, and salary of employees along with the average salary of that department.

-- Table:  employee

/* Schema
id:int
first_name:varchar
last_name:varchar
age:int
sex:varchar
employee_title:varchar
department:varchar
salary:int
target:int
bonus:int
email:varchar
city:varchar
address:varchar
manager_id:int
*/

-- Solution 1
with avg_salary_by_dept as (
select department, avg(salary) as avg_dept_salary
from employee
group by department
)
select e.department, e.first_name, e.salary, asd.avg_dept_salary
from employee e left join avg_salary_by_dept asd
    on e.department = asd.department
;


-- Solution 2
select department, first_name, salary, avg(salary) over(partition by department) as avg_dept_salary
from employee;