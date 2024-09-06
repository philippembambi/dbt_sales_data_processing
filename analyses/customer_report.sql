SELECT 
    gender
    , COUNT(unique_raw_id) AS total_customers
FROM {{ ref('int_customers__assembly') }} 
GROUP BY gender