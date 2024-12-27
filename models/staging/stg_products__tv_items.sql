{{ config(materialized = 'view') }}

WITH base_data AS (
    SELECT 
            CONCAT('t-tv-', UUID_STRING()) AS unique_raw_id
        ,   order_id AS product_id
        ,   INITCAP(brand::string) AS product_name
        ,   initcap(resolution::string) AS category
        ,   selling_price::double AS price
        ,   "size"::integer AS number_of_items
        ,   '' AS vendor
        ,   '' AS vendor_address
        ,   '' AS vendor_city
        ,   operating_system::string AS description
    FROM {{ source('E_COMMERCE', 'T_TV_DATASET') }}
) 

SELECT *
FROM base_data