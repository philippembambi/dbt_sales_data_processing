{{ config(materialized = 'table') }}

SELECT * FROM {{ ref('stg_products__sales_data') }}
UNION ALL
SELECT * FROM {{ ref('stg_products__tv_items') }}