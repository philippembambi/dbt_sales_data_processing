{{ config(materialized = 'view') }}

WITH base_data AS (
    SELECT 
            UUID_STRING() AS unique_raw_id
        ,   INITCAP(product::string) AS product_name
        ,   initcap(categorie::string) AS category
        ,   price_each::double AS price
        ,   '' AS vendor
        ,   '' AS description
    FROM {{ source('E_COMMERCE', 'T_SALES_DATA') }}
) 

SELECT *
FROM base_data