-- Q6: SKUs that were never sold at 0% discount
-- Finds products always sold with some discount applied

SELECT sku, product_name,
       COUNT(DISTINCT order_id) AS orders
FROM sales
WHERE sku NOT IN (
  SELECT DISTINCT sku FROM sales WHERE discount_pct = 0
)
GROUP BY sku, product_name;

-- Result: Empty set
-- Business insight: every SKU was sold at full price at least once
-- No product is permanently discounted — healthy pricing signal
