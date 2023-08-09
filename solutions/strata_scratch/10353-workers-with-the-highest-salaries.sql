
-- You have been asked to find the job titles of the highest-paid employees.
-- Your output should include the highest-paid title or multiple titles with the same salary.

select worker_title
from title t join worker w on t.worker_ref_id = w.worker_id
where w.salary = (select max(salary) from worker);