{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)
}}

SELECT ORDER_DATE as date_key,
ORDER_DATE as date,
year(ORDER_DATE) as year,
month(ORDER_DATE) as month,
day(ORDER_DATE) as day
FROM {{source('oliver_landing', 'orders')}}