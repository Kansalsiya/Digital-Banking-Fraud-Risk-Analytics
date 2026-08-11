USE fraud_detection;

USE fraud_detection;

-- =========================================================
-- BANKING TRANSACTION & FRAUD RISK ANALYTICS
-- SQL Analysis
-- =========================================================


-- =========================================================
-- 1. OVERALL FRAUD SUMMARY
-- =========================================================

SELECT
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain;


-- =========================================================
-- 2. FRAUD ANALYSIS BY TRANSACTION CATEGORY
-- =========================================================

SELECT
    category,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(AVG(amt), 2) AS avg_transaction_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY category
ORDER BY fraud_rate_percent DESC;


-- =========================================================
-- 3. FRAUD ANALYSIS BY STATE
-- =========================================================

SELECT
    state,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY state
ORDER BY fraud_rate_percent DESC;


-- =========================================================
-- 4. FRAUD ANALYSIS BY TRANSACTION HOUR
-- =========================================================

SELECT
    HOUR(trans_date_trans_time) AS transaction_hour,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY transaction_hour
ORDER BY fraud_rate_percent DESC;


-- =========================================================
-- 5. HIGH-RISK MERCHANT ANALYSIS
-- Minimum 100 transactions
-- =========================================================

SELECT
    merchant,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY merchant
HAVING COUNT(*) >= 100
ORDER BY fraud_rate_percent DESC;


-- =========================================================
-- 6. CUSTOMER RISK ANALYSIS
-- Minimum 20 transactions
-- =========================================================

SELECT
    cc_num,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY cc_num
HAVING COUNT(*) >= 20
ORDER BY fraud_transactions DESC
LIMIT 20;


-- =========================================================
-- 7. FRAUD ANALYSIS BY GENDER
-- =========================================================

SELECT
    gender,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY gender
ORDER BY fraud_rate_percent DESC;


-- =========================================================
-- 8. FRAUD ANALYSIS BY AGE GROUP
-- =========================================================

SELECT
    CASE
        WHEN TIMESTAMPDIFF(YEAR, dob, trans_date_trans_time) < 25
            THEN 'Under 25'
        WHEN TIMESTAMPDIFF(YEAR, dob, trans_date_trans_time) BETWEEN 25 AND 34
            THEN '25-34'
        WHEN TIMESTAMPDIFF(YEAR, dob, trans_date_trans_time) BETWEEN 35 AND 44
            THEN '35-44'
        WHEN TIMESTAMPDIFF(YEAR, dob, trans_date_trans_time) BETWEEN 45 AND 54
            THEN '45-54'
        WHEN TIMESTAMPDIFF(YEAR, dob, trans_date_trans_time) BETWEEN 55 AND 64
            THEN '55-64'
        ELSE '65+'
    END AS age_group,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY age_group
ORDER BY fraud_rate_percent DESC;


-- =========================================================
-- 9. FRAUD VS LEGITIMATE TRANSACTION AMOUNT
-- =========================================================

SELECT
    is_fraud,
    COUNT(*) AS transaction_count,
    ROUND(AVG(amt), 2) AS avg_transaction_amount,
    ROUND(MIN(amt), 2) AS min_transaction_amount,
    ROUND(MAX(amt), 2) AS max_transaction_amount
FROM fraudtrain
GROUP BY is_fraud;


-- =========================================================
-- 10. MONTHLY FRAUD TREND
-- =========================================================

SELECT
    DATE_FORMAT(trans_date_trans_time, '%Y-%m') AS transaction_month,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY transaction_month
ORDER BY transaction_month;


-- =========================================================
-- 11. REUSABLE VIEW: CATEGORY FRAUD ANALYSIS
-- =========================================================

CREATE OR REPLACE VIEW fraud_category_analysis AS
SELECT
    category,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(AVG(amt), 2) AS avg_transaction_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY category;


-- =========================================================
-- 12. REUSABLE VIEW: CUSTOMER RISK ANALYSIS
-- =========================================================

CREATE OR REPLACE VIEW customer_risk_analysis AS
SELECT
    cc_num,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY cc_num
HAVING COUNT(*) >= 20;


-- =========================================================
-- 13. REUSABLE VIEW: HOURLY FRAUD ANALYSIS
-- =========================================================

CREATE OR REPLACE VIEW hourly_fraud_analysis AS
SELECT
    HOUR(trans_date_trans_time) AS transaction_hour,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY transaction_hour;


-- =========================================================
-- 14. REUSABLE VIEW: MONTHLY FRAUD ANALYSIS
-- =========================================================

CREATE OR REPLACE VIEW monthly_fraud_analysis AS
SELECT
    DATE_FORMAT(trans_date_trans_time, '%Y-%m') AS transaction_month,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM fraudtrain
GROUP BY transaction_month
ORDER BY transaction_month;