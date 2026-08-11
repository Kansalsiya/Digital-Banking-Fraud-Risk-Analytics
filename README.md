# 🏦 Digital Banking Fraud Risk Analytics

<p align="center">
  <b>SQL • Data Analytics • Fraud Detection • Business Intelligence</b>
</p>

<p align="center">
  An end-to-end analytics project focused on identifying fraud patterns,
  customer risk, merchant risk, and transaction behaviour using SQL.
</p>

---

## 📌 Project Overview

This project analyzes approximately **1.59 million synthetic banking
transactions** to identify patterns associated with fraudulent activity.

The goal is to transform raw transaction-level data into meaningful
business insights that can support **fraud monitoring, customer risk
analysis, and financial decision-making**.

---

## 🎯 Business Objectives

The analysis answers questions such as:

- 🔍 What is the overall fraud rate?
- 🛍️ Which transaction categories have the highest fraud risk?
- 🌎 Which states show elevated fraud rates?
- 🕐 At what times does fraud occur most frequently?
- 🏪 Which merchants show unusually high fraud activity?
- 👤 Which customers show higher observed fraud rates?
- 📊 Does fraud behaviour differ across age groups and gender?
- 💰 Are fraudulent transactions generally larger than legitimate ones?
- 📅 How does fraud change over time?

---

## 📂 Dataset

The project uses the **fraudTrain** transaction dataset.

### Dataset Scale

| Entity | Volume |
|---|---:|
| 💳 Transactions | ~1.59M |
| 👤 Customers / Cardholders | Multiple |
| 🏪 Merchants | Multiple |
| 📍 Geographic Locations | Multiple |

### Important Fields

- `trans_date_trans_time` — Transaction timestamp
- `cc_num` — Customer/card identifier
- `merchant` — Merchant
- `category` — Transaction category
- `amt` — Transaction amount
- `gender` — Customer gender
- `dob` — Date of birth
- `city` / `state` — Customer location
- `lat` / `long` — Customer coordinates
- `merch_lat` / `merch_long` — Merchant coordinates
- `is_fraud` — Fraud indicator

> ⚠️ The dataset contains **synthetically generated banking data** and
> does not contain real customer or financial information.

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| 🐬 **MySQL** | Database & SQL analysis |
| 🧮 **SQL** | Data manipulation & business analysis |
| 📊 **Power BI** | Interactive dashboarding |
| 🐍 **Python** | Exploratory analysis |
| 🔧 **Git** | Version control |
| ☁️ **GitHub** | Project documentation & collaboration |

---

# 📊 SQL Analysis

The project performs transaction-level and aggregated fraud analysis using SQL.

### 🔹 Overall Fraud Analysis

Calculates:

- Total transactions
- Fraudulent transactions
- Overall fraud rate

### 🔹 Category Analysis

Analyzes:

- Transaction volume
- Fraud cases
- Fraud amount
- Average transaction amount
- Fraud rate

### 🔹 Geographic Analysis

Examines fraud patterns across different states.

### 🔹 Time-Based Analysis

Analyzes fraud by:

- Transaction hour
- Month
- Fraud frequency
- Fraud amount

### 🔹 Merchant Risk Analysis

Identifies merchants with elevated observed fraud rates while applying a
minimum transaction threshold to avoid misleading results from very small
samples.

### 🔹 Customer Risk Analysis

Identifies customers with elevated observed fraud rates using transaction
history, fraud frequency, and fraud amount.

---

# 🧠 SQL Techniques Used

The project demonstrates:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `HAVING`
- Aggregate Functions
- `CASE WHEN`
- Date & Time Functions
- Conditional Calculations
- SQL Views
- Filtering
- Ranking
- Customer-level aggregation
- Transaction-level analysis

---

# 🔎 Key Findings

### 🚨 Overall Fraud

The dataset contains an observed fraud rate of approximately:

> **0.91%**

### 🌙 Time-Based Risk

Fraud rates are substantially higher during late-night hours.

The highest observed rate occurs around:

> **23:00 → 4.39%**

followed by:

> **22:00 → 4.16%**

### 🛍️ Category Risk

`shopping_net` shows a particularly high observed fraud rate:

> **2.48%**

and the highest observed fraud amount among the analyzed categories.

### 💰 Transaction Amount

Fraudulent transactions have a substantially higher average transaction
amount than legitimate transactions:

| Transaction Type | Average Amount |
|---|---:|
| ✅ Legitimate | **$67.64** |
| 🚨 Fraudulent | **$507.39** |

### 👤 Customer Risk

Several customers show significantly higher observed fraud rates than the
overall dataset average.

Customer-level analysis uses a minimum transaction threshold to make
risk comparisons more meaningful.

---

# 🗄️ SQL Views

Reusable analytical views were created for downstream analysis and
dashboarding:

```text
fraud_category_analysis
customer_risk_analysis
hourly_fraud_analysis
monthly_fraud_analysis