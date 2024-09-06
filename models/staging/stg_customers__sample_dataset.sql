{{ config(materialized = 'view') }}

WITH base_data AS (
    SELECT 
            UUID_STRING() AS unique_raw_id
        ,   customer_id
        ,   INITCAP(name::string) AS first_name
        ,   INITCAP(surname::string) AS last_name
        ,   name::string || surname::string AS full_name
        ,   CASE
                WHEN COALESCE(gender::string, '') = '' THEN 'UNKNOWN'
                ELSE gender
            END AS gender
        , TO_CHAR(DATE_TRUNC('day', birthdate::DATE), 'YYYY-MM-DD') AS birthdate
    FROM {{ source('E_COMMERCE', 'T_SAMPLE_DATASET') }}
) 

SELECT *
FROM base_data