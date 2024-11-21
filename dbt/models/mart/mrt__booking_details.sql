{{
    config(
        materialized = 'incremental',
        increment_strategy = 'insert_overwrite',
        on_schema_change = 'append_new_columns',
        partition_by = {
            'field': 'booking_date',
            'data_type': 'date',
            'granularity': 'day',
            'copy_partitions': true
        }
    )
}}



select

booking.id as booking_id,
booking.booking_date as booking_date,
booking.booking_timestamp as booking_timestamp,
booking.pax as pax,
booking.price_eu as booking_price_eu,
trip.id as trip_id,
trip.origin_city as trip_origin_city,
trip.destination_city as trip_destination_city,
trip.category as trip_category,
concat(airplane.manufacturer,"-",airplane.model) as airplane_model,
trip.trip_date as trip_date,
booking.status as booking_status


from booking 
left join trip on booking.trip_id = trip.id
left join airplane on airplane.id = trip.airplane_id