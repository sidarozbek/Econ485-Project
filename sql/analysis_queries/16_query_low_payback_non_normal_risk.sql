SELECT
  r.name                       AS region,
  pt.id                        AS property_type_id,
  pt.room_count,
  pt.area_sqm,
  pt.building_type,
  pt.risk_level,
  pi.rent_price,
  pi.sale_price,
  ROUND(pi.payback_years, 2)   AS payback_years
FROM property_type pt
JOIN region      r  ON r.id = pt.region_id
JOIN price_info  pi ON pi.property_type_id = pt.id
WHERE
  pi.payback_years <= 12
  AND pt.risk_level IS NOT NULL
  AND pt.risk_level <> 'normal'
ORDER BY
  payback_years ASC;