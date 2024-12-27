{% macro generate_uuid() %}
    {{ return(uuid.hex) }}
{% endmacro %}
