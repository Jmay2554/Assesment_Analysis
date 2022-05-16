--Create a custom view with the extracted Conversions
with leads as (
select EXTRACT(month from converted_at) as leads_month,
EXTRACT(DAY from converted_at) as leads_day,
EXTRACT(week from converted_at) as leads_week
from {{ ref('leads')}}
group by leads_month, leads_day, leads_week
)

select DISTINCT COUNT(leads_month) AS month_count, leads_month from leads
group by leads_month order by leads_month ASC



