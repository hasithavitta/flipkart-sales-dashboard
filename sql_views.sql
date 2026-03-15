
-- View 1: Category performance
CREATE OR REPLACE VIEW flipkart_dataset.v_category_performance AS
SELECT main_category, COUNT(*) AS total_products,
  ROUND(AVG(retail_price), 0) AS avg_retail_price,
  ROUND(AVG(discounted_price), 0) AS avg_discounted_price,
  ROUND(AVG(discount_pct), 1) AS avg_discount_pct
FROM flipkart_dataset.products
WHERE main_category IS NOT NULL
GROUP BY main_category ORDER BY total_products DESC;

-- View 2: Price band distribution
CREATE OR REPLACE VIEW flipkart_dataset.v_price_bands AS
SELECT main_category, price_band, COUNT(*) AS product_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY main_category), 1) AS pct_in_category
FROM flipkart_dataset.products
GROUP BY main_category, price_band;

-- View 3: Discount tier analysis
CREATE OR REPLACE VIEW flipkart_dataset.v_discount_tiers AS
SELECT main_category,
  CASE WHEN discount_pct < 10 THEN '1. Low (under 10%)'
       WHEN discount_pct BETWEEN 10 AND 30 THEN '2. Medium (10-30%)'
       WHEN discount_pct BETWEEN 30 AND 50 THEN '3. High (30-50%)'
       ELSE '4. Very High (above 50%)' END AS discount_tier,
  COUNT(*) AS product_count
FROM flipkart_dataset.products
WHERE discount_pct IS NOT NULL AND main_category IS NOT NULL
GROUP BY main_category, discount_tier ORDER BY main_category, discount_tier;

-- View 4: Top 10 competitive categories
CREATE OR REPLACE VIEW flipkart_dataset.v_competitive_categories AS
SELECT main_category, COUNT(*) AS listing_count,
  ROUND(AVG(discount_pct), 1) AS avg_discount_pct,
  ROUND(MAX(discount_pct) - MIN(discount_pct), 1) AS discount_range,
  ROUND(MAX(discounted_price), 0) AS max_price,
  ROUND(MIN(discounted_price), 0) AS min_price
FROM flipkart_dataset.products
WHERE main_category IS NOT NULL
GROUP BY main_category ORDER BY listing_count DESC LIMIT 10;

-- View 5: FK Advantage analysis
CREATE OR REPLACE VIEW flipkart_dataset.v_fk_advantage AS
SELECT main_category, is_FK_Advantage_product,
  COUNT(*) AS product_count,
  ROUND(AVG(discount_pct), 1) AS avg_discount_pct,
  ROUND(AVG(discounted_price), 0) AS avg_price
FROM flipkart_dataset.products
WHERE main_category IS NOT NULL
GROUP BY main_category, is_FK_Advantage_product;
