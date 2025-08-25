create table transactions (
    txn_id varchar(10),
    txn_date date,
    amount int
);

insert into transactions (txn_id, txn_date, amount) values
('t1', '2025-01-10', 100),
('t2', '2025-01-15', 200),
('t3', '2025-03-05', 300),
('t4', '2025-05-20', 400);


with months as (
    select "2025-01" as month union all
    select "2025-02" union all
    select "2025-03" union all
    select "2025-04" union all
    select "2025-05" union all
    select "2025-06" union all
    select "2025-07" union all
    select "2025-08" union all
    select "2025-09" union all
    select "2025-10" union all
    select "2025-11" union all
    select "2025-12"
),

txn_months as (
    select distinct left(txn_date,7) as month from transactions where txn_date like '2025-%'
)

select m.month as missing_months from months m left join txn_months t on m.month = t.month where t.month is null order by m.month;

-- +---------------+
-- | missing_month |
-- +---------------+
-- | 2025-02       |
-- | 2025-04       |
-- | 2025-06       |
-- | 2025-07       |
-- | 2025-08       |
-- | 2025-09       |
-- | 2025-10       |
-- | 2025-11       |
-- | 2025-12       |
-- +---------------+
