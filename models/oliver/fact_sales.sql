{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
o.order_id as order_key,
s.store_id as store_key,
d.date as date_key,
c.customer_id as customer_key,
e.employee_id as employee_key,
p.product_id as product_key,
quantity,
ol.unit_price,
total_amount
FROM {{ source('oliver_landing', 'orders') }} o
    JOIN {{ source('oliver_landing', 'orderline') }} ol ON ol.order_id = o.order_id
    JOIN {{ ref('oliver_dim_customer')}} c ON c.customer_id = o.customer_id
    JOIN {{ ref('oliver_dim_date')}} d ON d.date = o.order_date
    JOIN {{ ref('oliver_dim_employee')}} e ON e.employee_id = o.employee_id
    JOIN {{ ref('oliver_dim_product')}} p ON p.product_id = ol.product_id
    JOIN {{ ref('oliver_dim_store')}} s On s.store_id = o.store_id