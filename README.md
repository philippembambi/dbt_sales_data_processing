## SALES_DATA_PROCESSING

### Setup Environnement deps
- python3 -m venv venv
- source venv/bin/activate
- pip install -r requirements.txt
- dbt deps"

### Try running the following commands:

- dbt deps
- dbt test
- dbt debug
- dbt run
- dbt run --select dbt_model_example : `To run a models separately`
- dbt run --select my_model+ : `Run model with its deps`
- dbt init dbt_app_example --profiles-dir=profiles: `To specify a different profile path`

## make configure


~/.dbt/profiles.yml


dbt test --select int_customers__assembly+

dbt test --select stg_customers__sample_dataset