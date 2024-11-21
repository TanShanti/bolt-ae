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




select 

order.order_date,
order.id as order_id,
order.order_timestamp as order_timestamp,
customer.id as customer_id,
customer.name as customer_name,
customer_group.type as customer_group_type,
customer_group.name as customer_group_name,
trip.id as trip_id,
trip.origin_city as trip_origin_city,
trip.destination_city as trip_destination_city,
trip.status as trip_status,
concat(airplane.manufacturer,"-",airplane.model) as airplane_model,
airplane.max_seats as airplane_max_seats,
airplane.operator as airplane_operator,
order.price_per_seat_eu as price_per_seat_eu,
order.booking_status as booking_status


from order
left join trip on trip.id = order.trip_id
left join airplane trip.airplane_id = airplane.id
left join customer on order.customer_id = customer.id
left join customer_group on customer_group.id = customer.group_id