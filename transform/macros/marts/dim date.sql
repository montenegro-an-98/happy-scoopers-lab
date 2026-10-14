-- models/marts/dim_date.sql
{{ config(materialized='table') }}

with fechas as (
    Select generate_series(
        '2020-01-31': :date,
        '2030-12-31': :date,
        '1 day': :interval
    ) ::date as full_date
)

Select
    -- llave unica en formato YYYYMMDD (ej. 20250118)
    extract(year from full_date): : int * 10000
    + extract(month from full_date): : int * 100
    + extract(day from full_date): : int  as date_key ,
    full_date
    from fechas 
    
    cd /opt/happy-scoopers
    git pull origin main    # trae tu archivo


    cd transform
    dbt deps                # instala las dependencias del proyecto (obligatorio)
    dbt run --Select dim_date    # construye la tabla


    -- models/marts/dim_date.sql
    {{ config(materialized='table')  }}

    with fechas as (
        Select generate_series(
            '2020-01-01': :date,
            '2030-12-31': :date,
            '1 day': :interval
           ): :date as full_date
    ),

    calendario as (
        Select
        extract (year from full_date): : int * 10000
         + extract (month from full_date): : *100
         + extract (day from full_date): :        as date_key,
         full_date,
         extract (year   from full_date): : int   as year_number,
         extract (quarter from full_date): : int  as quarter_number,
         'Q' || extract(quarter from full_date): : int as quarter_name,
         extract(month from full_date): : int as month_number,
         trim(to_char(full_date, 'month'))    as month_name
         trim(to_char(full_date, 'mon'))      as month_name_short,
         extract(day   from full_date): : int as day_of_month,
         extract(isodow  from full_date): : int as day_of_week_iso,
         trim( to_char(full_date, 'Day'))     as day_name,
         extract(week  from full_date): : int as week_of_year,
         to_char(full_date, 'YYY_MM')     as year_month,
         case when extract(isodow from full_date) in (6,7)
          then 'Fin de semana '       

    )

