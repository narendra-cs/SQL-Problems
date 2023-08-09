
-- Find the base pay for Police Captains.
-- Output the employee name along with the corresponding base pay.

-- Table: sf_public_salaries

/* Schema
id:int
employeename:varchar
jobtitle:varchar
basepay:float
overtimepay:float
otherpay:float
benefits:float
totalpay:float
totalpaybenefits:float
year:int
notes:datetime
agency:varchar
status:varchar
*/

-- Solution 1
select employeename, basepay
from sf_public_salaries
where lower(jobtitle) like '%captain%' and lower(jobtitle) like '%police%';

-- Solution 2
select employeename, basepay
from sf_public_salaries
where jobtitle = 'CAPTAIN III (POLICE DEPARTMENT)';