CREATE TABLE transactions (
    user_id INT,
    txn_date DATE,
    amount INT
);

INSERT INTO transactions (user_id, txn_date, amount) VALUES
(1, '2025-01-01', 500),
(1, '2025-01-03', -200),
(1, '2025-01-05', 300),
(2, '2025-01-02', 1000),
(2, '2025-01-04', -400);

SELECT 
    user_id,
    txn_date,
    amount,
    SUM(amount) OVER (PARTITION BY user_id ORDER BY txn_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_balance
FROM transactions
ORDER BY user_id, txn_date;
