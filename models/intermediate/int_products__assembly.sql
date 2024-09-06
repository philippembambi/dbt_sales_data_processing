{{ config(materialized = 'table') }}

SELECT
    unique_raw_id
   , product_name
   , category
   , price
   , vendor
   , description
FROM {{ ref('stg_products__sales_data') }}