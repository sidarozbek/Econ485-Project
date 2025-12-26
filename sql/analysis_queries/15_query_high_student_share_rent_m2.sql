SELECT
  r.name,
  ds.student_share,
  COUNT(pt.id)                      AS property_count,
  ROUND(AVG(pi.rent_price_per_sqm), 2) AS avg_rent_per_sqm
FROM region r
JOIN demand_structure ds  ON ds.region_id = r.id
LEFT JOIN property_type  pt ON pt.region_id = r.id
LEFT JOIN price_info     pi ON pi.property_type_id = pt.id
WHERE
  ds.student_share >= 0.50
GROUP BY
  r.id,
  r.name,
  ds.student_share
ORDER BY
  ds.student_share DESC;