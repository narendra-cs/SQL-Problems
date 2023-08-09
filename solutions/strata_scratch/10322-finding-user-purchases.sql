
-- Write a query that'll identify returning active users. A returning active user is a user
-- that has made a second purchase within 7 days of any other of their purchases. Output a
-- list of user_ids of these returning active users.


with cte as (
select *, lag(created_at) over(partition by user_id order by created_at) last_created_at
from amazon_transactions)
select distinct user_id
from cte
where datediff(created_at, last_created_at) <=7;
