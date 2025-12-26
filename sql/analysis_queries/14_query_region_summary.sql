SELECT
  r.id,
  r.name,
  ROUND(AVG(p.rent_price), 0)          AS avg_rent,
  ROUND(AVG(p.sale_price), 0)          AS avg_sale,
  ROUND(AVG(p.payback_years), 2)       AS avg_payback_years,
  ds.student_share                     AS student_share
FROM region r
LEFT JOIN price_info        p  ON p.region_id = r.id
LEFT JOIN demand_structure  ds ON ds.region_id = r.id
GROUP BY
  r.id,
  r.name,
  ds.student_share
ORDER BY
  avg_payback_years ASC;