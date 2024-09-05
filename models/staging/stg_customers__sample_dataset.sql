{{ config(materialized = 'view') }}

WITH base_data AS (
    SELECT 
        DISTINCT
            md5(
                CONCAT(
                        name, 
                        surname, 
                        gender, 
                        birthdate, 
                        RANDOM(),
                        CURRENT_TIMESTAMP())
            ) AS unique_raw_id
        ,   customer_id
        ,   initcap(name::string) AS first_name
        ,   initcap(surname::string) AS last_name
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