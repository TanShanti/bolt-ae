create table if not exists airplane as

(
    id STRING NOT NULL,
    model STRING NOT NULL,
    operator_id STRING NOT NULL,
    manufacturer STRING NOT NULL,
    max_seats INT64 NOT NULL,
    category STRING NOT NULL,
    max_weight FLOAT64,
    engine_type STRING
)


select * from airplane
