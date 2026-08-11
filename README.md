# Digital Banking Fraud Risk Analytics

An end-to-end fraud analytics project using SQL and Power BI to identify transaction patterns, customer risk, high-risk categories, merchants, locations, and time-based fraud trends.

## Project Overview

This project analyzes a large-scale synthetic banking transaction dataset containing approximately 1.59 million transactions.

The objective is to identify fraud patterns and translate transaction-level data into actionable business insights for fraud monitoring and risk analysis.

## Business Questions

The analysis focuses on:

- What is the overall fraud rate?
- Which transaction categories have the highest fraud risk?
- Which states show elevated fraud rates?
- When does fraud occur most frequently?
- Which merchants have unusually high fraud activity?
- Which customers show higher observed fraud rates?
- Does fraud behavior differ across gender and age groups?
- Are fraudulent transactions generally larger than legitimate transactions?
- How does fraud change over time?

## Dataset

The project uses the `fraudTrain` dataset containing transaction-level banking data.

Key fields include:

- Transaction date and time
- Transaction amount
- Customer/card identifier
- Merchant
- Transaction category
- Gender
- Date of birth
- City and state
- Geographic coordinates
- Fraud indicator

The dataset is synthetically generated and does not contain real customer or financial information.

## SQL Analysis

The SQL analysis includes:

- Overall fraud summary
- Fraud analysis by transaction category
- Geographic fraud analysis
- Hourly fraud analysis
- High-risk merchant analysis
- Customer risk analysis
- Gender-based analysis
- Age-group analysis
- Fraud vs. legitimate transaction amounts
- Monthly fraud trends

### SQL Techniques Used

- `GROUP BY`
- Aggregate functions
- `CASE WHEN`
- `HAVING`
- `ORDER BY`
- Window/analytical concepts
- SQL Views
- Date and time functions
- Conditional calculations
- Filtering and ranking

## Key Findings

Some notable findings from the analysis:

- Overall fraud rate is approximately **0.91%**.
- Late-night transactions show substantially higher observed fraud rates.
- `shopping_net` has one of the highest observed category-level fraud rates.
- Fraudulent transactions have a substantially higher average transaction amount than legitimate transactions.
- Some customers and merchants show significantly elevated observed fraud rates.
- Fraud patterns vary across geographic locations and customer segments.

## SQL Views

Reusable SQL views were created for:

- `fraud_category_analysis`
- `customer_risk_analysis`
- `hourly_fraud_analysis`
- `monthly_fraud_analysis`

These views prepare summarized datasets that can be used for downstream dashboarding and analysis.

## Project Structure

```text
Digital-Banking-Fraud-Risk-Analytics/
│
├── sql/
│   └── fraud_analysis.sql
│
├── data/
│
└── README.md