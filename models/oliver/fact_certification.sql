{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

SELECT {{ dbt_utils.generate_surrogate_key(['e.employee_key', 'd.date_key','c.certification_name']) }} as certification_key, 
    e.employee_key,
    d.date_key,
    c.certification_name,
    c.certification_cost
FROM {{ref('stg_employee_certifications')}} c
    JOIN {{ref('oliver_dim_date')}} d ON d.date = c.certification_awarded_date 
    JOIN {{ref('oliver_dim_employee')}} e ON c.employee_id = e.employee_id