with leads as (
    select * from {{ref('leads')}}
),

leadsource_Week as(
select EXTRACT(week from converted_at) as week_num, COUNT(source) as sourcecount, source
from leads
group by source, week_num
ORDER by week_num ASC
)

select * from leadsource_Week

