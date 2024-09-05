## SALES_DATA_PROCESSING

### Setup Environnement deps
- python3 -m venv venv
- source venv/bin/activate
- pip install -r requirements.txt

### Try running the following commands:
- dbt test
- dbt debug
- dbt run
- dbt run --select dbt_model_example : `To run a models separately`
- dbt run --select my_model+ : `Run model with its deps`

### Config
- nano ~/.dbt/profiles.yml

### Environnement Variables to set
- SNOWFLAKE_ACCOUNT
- SNOWFLAKE_USER
- SNOWFLAKE_PASSWORD
- SNOWFLAKE_ROLE
- SNOWFLAKE_DATABASE
- SNOWFLAKE_WAREHOUSE
- SNOWFLAKE_SCHEMA
