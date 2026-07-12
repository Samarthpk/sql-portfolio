-- Q2: Best-selling product per region (by quantity)
-- Uses RANK() window function to find top product in each region

SELECT region, product_name, total_qty
FROM (
  SELECT region, product_name,
         SUM(quantity) AS total_qty,
         RANK() OVER (PARTITION BY region ORDER BY SUM(quantity) DESC) AS rnk
  FROM sales
  GROUP BY region, product_name
)
WHERE rnk = 1;

-- Result:
-- Midwest   → USB-C Hub (182 units)
-- Northeast → Notebook Set (205 units)
-- Southeast → USB-C Hub (199 units)
-- West      → Yoga Mat (220 units)
