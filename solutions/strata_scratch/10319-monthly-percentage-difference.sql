
-- Given a table of purchases by date, calculate the month-over-month percentage change in revenue.
-- The output should include the year-month date (YYYY-MM) and percentage change, rounded to the
-- 2nd decimal point, and sorted from the beginning of the year to the end of the year. The percentage
-- change column will be populated from the 2nd month forward and can be calculated as 
-- ((this month's revenue - last month's revenue) / last month's revenue)*100.


with cte as (
select created_at, date_format(created_at, '%Y-%m') month, sum(value) total_revenue
from sf_transactions
group by date_format(created_at, '%Y-%m')),
revenue_details as (
select month, total_revenue, lag(total_revenue,1) over(order by created_at) last_month_revenue
from cte
)
select month, round((total_revenue- coalesce(last_month_revenue,0))/last_month_revenue * 100,2) MoM_change
from revenue_details