
-- Identify projects that are at risk for going overbudget. A project is considered to be overbudget
-- if the cost of all employees assigned to the project is greater than the budget of the project.

-- You'll need to prorate the cost of the employees to the duration of the project. For example,
-- if the budget for a project that takes half a year to complete is $10K, then the total half-year 
-- salary of all employees assigned to the project should not exceed $10K. Salary is defined on a 
-- yearly basis, so be careful how to calculate salaries for the projects that last less or more than one year.

-- Output a list of projects that are overbudget with their project name, project budget, and prorated
-- total employee expense (rounded to the next dollar amount).

-- HINT: to make it simpler, consider that all years have 365 days. You don't need to think about the leap years.


with cte as (
    select r.project_id, sum(salary)/365 total_employee_salary_per_year
    from linkedin_emp_projects r join linkedin_employees e on r.emp_id = e.id
    group by r.project_id
)
select p.title,
        p.budget,
        ceil(datediff(p.end_date, p.start_date) * total_employee_salary_per_year) as prorate_total_employee_expense
from linkedin_projects p join cte r on p.id = r.project_id
where datediff(p.end_date, p.start_date) * total_employee_salary_per_year > p.budget;