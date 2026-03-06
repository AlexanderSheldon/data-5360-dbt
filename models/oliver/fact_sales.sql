{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)
}}

SELECT
o.order_id as order_id,
s.store_id as store_id,
d.date as order_date,
c.customer_id as customer_id,
e.employee_id as employee_id,
f.total_amount

FROM{{ref('fact_sales')}} f 

LEFT JOIN {{ref('oliver_dim_customer')}} c
    ON f.customer_id = c.customer_id
LEFT JOIN {{ref('oliver_dim_date')}}
    ON f.
LEFT JOIN {{ref('')}}
    ON f.
LEFT JOIN {{ref('')}}
    ON f.
LEFT JOIN {{ref('')}}
    ON f.

LEFT JOIN {{ref('oliver_dim_customer')}} c 
    on f.