with leads as (
    select * from {{ref('leads')}}
),

leadsource_month as(
select EXTRACT(month from converted_at) as month_num, COUNT(source) as sourcecount, source
from leads
group by source, month_num
ORDER by month_num ASC
)

select * from leadsource_month