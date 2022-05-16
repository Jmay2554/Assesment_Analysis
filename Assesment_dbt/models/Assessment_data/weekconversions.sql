--Create a custom view with the extracted Conversions
with leads as (
select EXTRACT(month from converted_at) as leads_month,
EXTRACT(DAY from converted_at) as leads_day,
EXTRACT(week from converted_at) as leads_week
from {{ ref('leads')}}
group by leads_month, leads_day, leads_week
)
--Count of leads per week
select DISTINCT COUNT(leads_week) AS week_count, leads_week from leads
group by leads_week
