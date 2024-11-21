{{
    config(
        materialized = 'incremental',
        increment_strategy = 'insert_overwrite',
        on_schema_change = 'append_new_columns',
        partition_by = {
            'field': 'order_date',
            'data_type': 'date',
            'granularity': 'day',
            'copy_partitions': true
        }
    )
}}




{% set booking_status = ["booked", "cancelled", "finished"] %}
{% set categories = ["short", "medium", "long"] %}

select

order_date,

count(distinct case when pax <=5 then customer_id else null end) as total_order_from_individual,

count(distinct order_id) as total_orders,

{% for status in booking_status %}
count(distinct case when booking_status='{{status}}' then order_id else null end) as total_{{status}}_orders,
{% endfor %}

count(distinct customer_id) as total_customers,
{% for status in booking_status %}
count(distinct case when booking_status='{{status}}' then customer_id else null end) as total_{{status}}_customers,
{% endfor %}

sum( price_per_seat) as total_revenue_eur,
{% for status in booking_status %}
sum( case when booking_status='{{status}}' then price_per_seat else 0 end) as total_{{status}}_revenue_eur,
{% endfor %}

count(distinct order_id) as total_orders,
{% for category in categories %}
count(distinct case when category='{{category}}' then order_id else null end) as total_{{category}}_distance_orders,
{% endfor %}

count(distinct customer_id) as total_customers,
{% for category in categories %}
count(distinct case when category='{{category}}' then customer_id else null end) as total_{{category}}_distance_customers,
{% endfor %}


sum( price_per_seat) as total_revenue_eur,

{% for category in categories %}
sum( case when category='{{category}}' then price_per_seat else 0 end) as total_{{category}}_distance_revenue_eur,
{% endfor %}

from mrt__order_trip_detail
order by 1