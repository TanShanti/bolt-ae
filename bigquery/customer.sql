create table if not exists customer as

(
    id STRING NOT NULL,
    name STRING NOT NULL,
    customer_group_id STRING ,
    email STRING NOT NULL,
    phone STRING NOT NULL,
    registration_time TIMESTAMP NOT NULL

)


select * from customer