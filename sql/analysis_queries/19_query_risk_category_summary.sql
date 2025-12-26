SELECT
  CASE
    WHEN pt.risk_level IS NULL OR pt.risk_level = 'normal'
      THEN 'normal'
    ELSE 'risky'
  END AS risk_category,
  COUNT(DISTINCT pt.id)              AS property_count,
  ROUND(AVG(pi.payback_years), 2)    AS avg_payback_years,
  ROUND(AVG(pi.rent_price_per_sqm), 2) AS avg_rent_per_sqm,
  ROUND(AVG(pi.sale_price_per_sqm), 2) AS avg_sale_per_sqm
FROM property_type pt
JOIN price_info pi ON pi.property_type_id = pt.id
GROUP BY risk_category;