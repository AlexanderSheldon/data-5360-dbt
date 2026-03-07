{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
o.order_id as order_key,
s.store_id as store_key,
d.date as order_date,
c.customer_id as customer_key,
e.employee_id as employee_key,
quantity,
unti_price,
total_amount
FROM {{ source('oliver_landing', 'orders') }} o
    JOIN {{ source('oliver_landing', 'orderline') }} ol ON ol.order_id = o.order_id
    JOIN {{ ref('oliver_dim_customer')}} c ON c.store_id = o.JOIN o.store_id
    JOIN {{ ref('oliver_dim_date')}} d ON d.date = o.date
    JOIN {{ ref('oliver_dim_employee')}} e.employee_id = o.employee_id
    JOIN {{ ref('oliver_dim_products')}} p ON p.product_id = o.product_id
    JOIN {{ ref('oliver_dim_store')}} s On s.store_id = o.store_id