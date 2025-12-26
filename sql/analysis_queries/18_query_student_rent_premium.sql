SELECT
  r.name,
  ROUND(ds.student_share, 2)                     AS student_share,
  ROUND(AVG(pi.rent_price_per_sqm), 2)           AS avg_rent_per_sqm,
  ROUND(
    AVG(pi.rent_price_per_sqm) -
    (
      SELECT AVG(pi2.rent_price_per_sqm)
      FROM region r2
      JOIN demand_structure ds2 ON ds2.region_id = r2.id
      JOIN price_info pi2       ON pi2.region_id = r2.id
      ORDER BY ds2.student_share ASC
      LIMIT 1
    ),
    2
  ) AS student_rent_premium
FROM region r
JOIN demand_structure ds ON ds.region_id = r.id
JOIN price_info pi       ON pi.region_id = r.id
GROUP BY
  r.id,
  r.name,
  ds.student_share
ORDER BY
  ds.student_share DESC;