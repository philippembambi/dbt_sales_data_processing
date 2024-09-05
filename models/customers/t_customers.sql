{{ config(materialized = 'table') }}

WITH base_data AS (
    -- Extraire les colonnes name, surname et gender de la table existante
    SELECT 
        -- Générer un identifiant unique pour chaque ligne
        md5(
            concat(name, surname, current_timestamp())
        ) AS unique_raw_id,
        customer_id,
        name AS first_name,
        surname AS lastname,
        gender,
        birthdate
    FROM {{ source('E_COMMERCE', 'T_SAMPLE_DATASET') }}
) 

-- Créer la nouvelle table T_CUSTOMERS avec les colonnes sélectionnées
SELECT *
FROM base_data