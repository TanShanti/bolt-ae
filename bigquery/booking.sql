create table if not exists booking as

(
    id STRING NOT NULL,
    booking_date DATE NOT NULL,
    booking_timestamp TIMESTAMP NOT NULL,
    trip_id STRING NOT NULL,
    contact_customer_id STRING NOT NULL,
    airplane_id STRING NOT NULL,
    pax INT64 NOT NULL,
    price_eu FLOAT64 NOT NULL,
    price_per_seat_eu FLOAT64,
    status STRING NOT NULL

)


select * from booking
