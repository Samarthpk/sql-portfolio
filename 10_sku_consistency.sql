-- Q10: SKU consistency analysis
-- Part A: Unique SKUs ordered per month
-- Part B: SKUs present in all 12 months (no seasonality)

-- Part A: Unique SKUs per month
SELECT order_month,
       COUNT(DISTINCT sku) AS unique_skus
FROM sales
GROUP BY order_month
ORDER BY order_month;

-- Part B: SKUs appearing in all 12 months
SELECT sku, product_name,
       COUNT(DISTINCT order_month) AS months_present
FROM sales
GROUP BY sku, product_name
HAVING months_present = 12
ORDER BY product_name;

-- Result:
-- All 9 SKUs appear in all 12 months → zero seasonal dropout
-- Catalog is stable year-round → no need for seasonal inventory adjustments
-- Consistent demand makes forecasting straightforward
