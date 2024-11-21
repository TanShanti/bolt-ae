create table if not exists order as

(
    id STRING NOT NULL,
    order_date  DATE NOT NULL,
    order_timestamp TIMESTAMP NOT NULL,
    customer_id STRING NOT NULL,
    trip_id STRING NOT NULL,
    booking_id STRING NOT NULL,
    price_per_seat_eu FLOAT64 NOT NULL,
    seat_no STRING NOR NULL,
    booking_status STRING NOT NULL

)


select * from order