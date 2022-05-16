--Create a custom view with the extracted Conversions
with leads as (
    select * from {{ref('leads')}}
),
leadconversions as (
select EXTRACT(month from converted_at) as leads_month,
EXTRACT(DAY from converted_at) as leads_day,
EXTRACT(week from converted_at) as leads_week
from leads
group by leads_month, leads_day, leads_week
),


--Count of leads per day
leadcount as (
select DISTINCT COUNT(leads_day) AS leadcount, leads_day from leadconversions
group by leads_day order by leads_day ASC
)

select * from leadcount