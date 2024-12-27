{{ config(materialized = 'table') }}

SELECT * FROM {{ ref('stg_customers__sample_dataset') }}