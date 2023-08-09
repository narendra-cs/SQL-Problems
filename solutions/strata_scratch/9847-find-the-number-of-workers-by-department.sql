
-- Find the number of workers by department who joined in or after April.
-- Output the department name along with the corresponding number of workers.
-- Sort records based on the number of workers in descending order.

select department, count(1) worker_count
from worker
where joining_date >= '2014-04-01'
group by 1
order by worker_count desc;