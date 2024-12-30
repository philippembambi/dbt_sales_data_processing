.PHONY: configure

ACCOUNT ?= ""
USER_NAME ?= ""
PASSWORD ?= ""
ROLE ?= ""
DATABASE ?= ""
WAREHOUSE ?= ""
SCHEMA ?=""
THREADS ?= 4

PROFILES_PATH := ~/.dbt/profiles.yml

configure:
	@echo "Configuration du fichier profiles.yml dans $(PROFILES_PATH)..."
	@mkdir -p ~/.dbt
	@echo "dbt_sales_data_processing:" > $(PROFILES_PATH)
	@echo "  target: dev" >> $(PROFILES_PATH)
	@echo "  outputs:" >> $(PROFILES_PATH)
	@echo "    dev:" >> $(PROFILES_PATH)
	@echo "      type: snowflake" >> $(PROFILES_PATH)
	@echo "      account: \"$(ACCOUNT)\"" >> $(PROFILES_PATH)
	@echo "      user: \"$(USER_NAME)\"" >> $(PROFILES_PATH)
	@echo "      password: \"$(PASSWORD)\"" >> $(PROFILES_PATH)
	@echo "      role: \"$(ROLE)\"" >> $(PROFILES_PATH)
	@echo "      database: \"$(DATABASE)\"" >> $(PROFILES_PATH)
	@echo "      warehouse: \"$(WAREHOUSE)\"" >> $(PROFILES_PATH)
	@echo "      schema: \"$(SCHEMA)\"" >> $(PROFILES_PATH)
	@echo "      threads: $(THREADS)" >> $(PROFILES_PATH)
	@echo "      client_session_keep_alive: false" >> $(PROFILES_PATH)
	@echo "Fichier profiles.yml configuré avec succès !"

