{{ config(materialized = 'table') }}

SELECT * FROM {{ ref('stg_customers__sample_dataset') }} 
    UNION ALL 
SELECT * FROM {{ ref('stg_customers__ecommerce_data_ratio') }}