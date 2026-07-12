-- Q8: Orders where net_revenue is above their category average
-- Uses CTE + AVG() window function (WHERE clause can't use window functions directly)

WITH cat_avg AS (
  SELECT *,
         AVG(net_revenue) OVER (PARTITION BY category) AS avg_cat_rev
  FROM sales
)
SELECT order_id, product_name, category,
       ROUND(net_revenue, 2) AS net_revenue,
       ROUND(avg_cat_rev, 2) AS cat_avg
FROM cat_avg
WHERE net_revenue > avg_cat_rev
ORDER BY category, net_revenue DESC;

-- Result: 1,043 orders above their category average
-- Electronics: Mechanical Keyboard dominates above-avg orders
-- Useful for identifying high-value transactions within each category
