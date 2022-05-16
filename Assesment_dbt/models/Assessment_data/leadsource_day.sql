with leads as (
    select * from {{ref('leads')}}
),

leadsource_day as(
select EXTRACT(day from converted_at) as day_num, COUNT(source) as sourcecount, source, fleet_size
from leads
group by source, day_num, fleet_size
ORDER by day_num ASC
)

select * from leadsource_day

