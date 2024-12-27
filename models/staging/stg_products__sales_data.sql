{{ config(materialized = 'view') }}

WITH base_data AS (
    SELECT 
            CONCAT('t-sales-data-', UUID_STRING()) AS unique_raw_id
        ,   order_id AS product_id
        ,   INITCAP(product::string) AS product_name
        ,   initcap(category::string) AS category
        ,   turn_over::double AS price
        ,   marging::integer AS number_of_items
        ,   '' AS vendor
        ,   CONCAT(REPLACE(purchase_address, '"', ''), ',', quantity_ordered)::string AS vendor_address
        ,   quantity_ordered::string AS vendor_city
        ,   '' AS description
    FROM {{ source('E_COMMERCE', 'T_SALES_DATA') }}
) 

SELECT *
FROM base_data