-- Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. Output just the absolute difference in salaries.

select abs(max(case when d.department = 'marketing' then salary else null end) - max(case when d.department = 'engineering' then salary else null end)) salary_difference
from db_employee e inner join db_dept d
    on e.department_id = d.id;