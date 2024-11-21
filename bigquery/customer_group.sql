create table if not exists customer_group as

(
    id STRING NOT NULL,
    type STRING NOT NULL ,
    name STRING NOT NULL,
    registry_number STRING NOT NULL
)


select * from customer_group