
  {{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
c.first_name as customer_first_name,
c.last_name as customer_last_name,
e.first_name as employee_first_name,
e.last_name as employee_last_name,
s.store_name,
f.quantity,
f.unit_price

FROM {{ ref('fact_sales') }} f
LEFT JOIN {{ ref('oliver_dim_customer') }} c
    ON f.customer_key = c.customer_key

LEFT JOIN {{ref('oliver_dim_date')}} d
    ON d.date_key = f.date_key

LEFT JOIN {{ref('oliver_dim_employee')}} e
    ON e.employee_key = f.employee_key

LEFT JOIN {{ref('oliver_dim_product')}} p
    ON p.product_key = f.product_key

LEFT JOIN {{ref('oliver_dim_store')}} s
    ON s.store_key = f.store_key
