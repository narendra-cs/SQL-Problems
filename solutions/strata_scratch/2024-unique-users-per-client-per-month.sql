
-- Write a query that returns the number of unique users per client per month

-- Table: fact_events

/* Schema
id:int
time_id:datetime
user_id:varchar
customer_id:varchar
client_id:varchar
event_type:varchar
event_id:int
*/

-- Solution 1
select client_id, month(time_id) as month, count(distinct user_id) as user_count
from fact_events
group by 1, 2;