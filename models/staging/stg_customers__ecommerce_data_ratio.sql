{{ config(materialized = 'view') }}

WITH base_data AS (
    SELECT 
        DISTINCT
            MD5(
                CONCAT(
                        SPLIT(customer_name, ' ')[0], 
                        SPLIT(customer_name, ' ')[1], 
                        gender, 
                        RANDOM(),
                        CURRENT_TIMESTAMP()
            )) AS unique_raw_id
        ,   customer_id
        ,   initcap(SPLIT(customer_name, ' ')[0]::string) AS first_name
        ,   initcap(SPLIT(customer_name, ' ')[1]::string) AS last_name
        ,   initcap(customer_name, ' ') AS full_name
        ,   CASE
                WHEN gender::string = 'Male' THEN 'M'
                WHEN gender::string = 'Female' THEN 'F'
                WHEN COALESCE(gender::string, '') = '' THEN 'UNKNOWN'
            END AS gender
        , DATEADD(YEAR, -customer_age, CURRENT_DATE) AS birthdate
    FROM {{ source('E_COMMERCE', 'T_ECOMMERCE_CUSTOMER_DATA_CUSTOM_RATIOS') }}
) 

SELECT *
FROM base_data