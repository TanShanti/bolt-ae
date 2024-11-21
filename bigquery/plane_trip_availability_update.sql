create table if not exists plane_trip_availability_update as

(
    trip_id STRING NOT NULL,
    availability_date DATE NOT NULL,
    airplane_id STRING NOT NULL,
    airplane_model STRING NOT NULL,
    airplane_manufacturer STRING NOT NULL,
    max_seats INT64 NOT NULL,
    booked_seats INT64 NOT NULL,
    available_seats INT64 NOT NULL,
    update_timestamp TIMESTAMP NOT NULL
)


select * from plane_trip_availability_update