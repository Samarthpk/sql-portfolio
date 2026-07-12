# SQL Portfolio — E-Commerce Sales Analysis

10 business SQL queries on a real ETL pipeline output (1,961 cleaned orders, FY 2025).
Covers aggregation, window functions, CTEs, and cohort analysis in SQLite.

## Dataset

Table: `sales` — output of [ecommerce-sales-etl](https://github.com/Samarthpk/ecommerce-sales-etl) pipeline

| Column | Type | Description |
|---|---|---|
| order_id | INTEGER | Unique order identifier |
| order_date | DATE | Parsed from 3 mixed formats in raw data |
| category | TEXT | Electronics, Fitness, Home & Kitchen, Office |
| region | TEXT | Midwest, Northeast, Southeast, West |
| quantity | INTEGER | Units ordered |
| net_revenue | REAL | After discount applied |
| order_month | TEXT | YYYY-MM format for time-series analysis |

## Queries

| # | File | Concept |
|---|---|---|
| 01 | `01_revenue_by_category.sql` | GROUP BY, aggregation |
| 02 | `02_top_product_per_region.sql` | RANK() window function |
| 03 | `03_mom_revenue_change.sql` | LAG() window function |
| 04 | `04_avg_order_value.sql` | COUNT DISTINCT, derived metrics |
| 05 | `05_top_months_per_region.sql` | RANK() with PARTITION BY |
| 06 | `06_always_discounted_skus.sql` | NOT IN subquery |
| 07 | `07_running_total_revenue.sql` | Cumulative SUM() window |
| 08 | `08_above_avg_orders.sql` | CTE + AVG() window function |
| 09 | `09_mom_variance_by_category.sql` | LAG() partitioned by category |
| 10 | `10_sku_consistency.sql` | Cohort/consistency analysis |

## Key Findings

- **Electronics** drives 54% of net revenue at $139 AOV — 2x other categories
- **April and November** see sharpest MoM drops (-12.9%, -13.9%) — seasonal pattern
- **No SKU ever dropped out** — all 9 products sold consistently across all 12 months
- **Every SKU sold at full price at least once** — no permanently discounted products

## How to Run

```bash
# After running the ETL pipeline:
sqlite3 ../ecommerce-sales-etl/output/sales.db < 01_revenue_by_category.sql
```

## Stack
SQLite · window functions · CTEs
