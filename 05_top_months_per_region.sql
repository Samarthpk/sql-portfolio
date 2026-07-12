-- Q5: Top 3 months by order count per region
-- Uses RANK() with PARTITION BY to rank months within each region

SELECT region, order_month, orders
FROM (
  SELECT region, order_month,
         COUNT(DISTINCT order_id) AS orders,
         RANK() OVER (PARTITION BY region ORDER BY COUNT(DISTINCT order_id) DESC) AS rnk
  FROM sales
  GROUP BY region, order_month
)
WHERE rnk <= 3
ORDER BY region, orders DESC;

-- Result:
-- Midwest   → Dec, Mar, Jul
-- Northeast → Feb, Dec, Jan
-- Southeast → Mar, Aug, Jan
-- West      → Oct, Jan, Jul
-- No single month dominates all regions → demand is geographically spread
