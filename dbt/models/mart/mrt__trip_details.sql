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




select
trip.id as trip_id,
trip.trip_date as trip_date,
trip.est_start_timestamp as trip_start_timestamp,
trip.origin_city as origin_city,
trip.destination_city as destination_city,
trip.category as trip_category,
trip.airplane_id as airplane_id,
airplane.model as airplane_model,
airplane.category as airplane_category,
airplane.max_seats as airplane_max_seats,
operator.id as operator_id,
operator.name as operator_name,
trip.booked_seats as booked_seats,
plane_trip_availability_update.total_booked_price,


from trip 
left join airplane on trip.airplane_id = airplane.id
left join operator on airplane.operator_id = operator.id
left join plane_trip_availability_update on trip.id = plane_trip_availability_update.trip_id