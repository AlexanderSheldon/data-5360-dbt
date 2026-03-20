{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

/*
This fact will contain keys from the following dimensions:
    dim_date
    dim_employee
This fact will contain the following metrics:
    certification_name
    certification_cost
*/

with employee_source as (
    SELECT employee_id as employee_key,
    employee_id,
    email,
    position,
    hire_date,
    last_name,
    first_name,
    phone_number
    FROM {{ref('oliver_dim_employee')}}
)