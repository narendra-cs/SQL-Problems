
-- Find the number of employees working in the Admin department that joined in April or later.

-- Table:  worker

/* Schema
worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar
*/

-- Solution 1

select count(1) employees
from worker
where department = 'Admin' and joining_date >= '2014-04-01';