create table if not exists airplane as

(
    id STRING NOT NULL,
    model STRING NOT NULL,
    operator STRING NOT NULL,
    manufacturer STRING NOT NULL,
    max_seats INT64 NOT NULL,
    max_weight FLOAT64,
    engine_type STRING
)


select * from airplane
