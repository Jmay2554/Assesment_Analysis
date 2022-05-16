with opps as (select * from {{ref('opportunities')}}
),
closedopps as(
    select closed_at,is_closed,is_won,id from opps
    where is_closed <> false
)

-- contacts as (
--     select id, lead_id from {{ref('contacts')}}
-- ),

-- final as (
--     select co.closed_at,co.is_closed,co.is_won, co.id, contacts.
--     from closedopps co left join leadsource  on co.id = leadsource.id
    
-- )

select * from closedopps