{{
    config(
        materialized = 'incremental',
        increment_strategy = 'insert_overwrite',
        on_schema_change = 'append_new_columns',
        partition_by = {
            'field': 'trip_date',
            'data_type': 'date',
            'granularity': 'day',
            'copy_partitions': true
        }
    )
}}


{% set trip_status = ["open", "flown", "cancelled"] %}

select

trip_date,
origin_city,
destination_city,
count(distinct trip_id) as total_trips,
sum(max_seats) as total_max_seats,
sum(booked_seats) as total_booked_seats,
sum(total_booked_price) as total_booked_revenue,
count(distinct airplane_id) as total_booked_airplane,

{% for status in trip_statue %}
count(distinct case when trip_status ='{{status}}' then trip_id else null end) as total_{{status}}_trips
{% endfor %}

from  mrt__trip_details
group by 1,2,3