create table if not exists trip as

(
    id STRING NOT NULL,
    trip_date DATE NOT NULL,
    origin_city STRING NOT NULL,
    destination_city STRING NOT NULL,
    distance_km FLOAT64 NOT NULL,
    category STRING NOT NULL,
    airplane_id STRING NOT NULL,
    est_start_timestamp TIMESTAMP NOT NULL,
    est_end_timestamp TIMESTAMP NOT NULL,
    act_start_timestamp TIMESTAMP NOT NULL,
    act_end_timestamp TIMESTAMP NOT NULL,
    update_timestamp TIMESTAMP NOT NULL,
    booked_seats INT64 NOT NULL,
    status STRING NOT NULL
)


select * from trip