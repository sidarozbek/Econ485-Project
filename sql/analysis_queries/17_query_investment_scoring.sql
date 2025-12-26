WITH region_summary AS (
  SELECT
    r.id,
    r.name,
    r.supply_status,
    ds.student_share,
    (d.student_count * 1.0 / NULLIF(d.household_count, 0)) AS student_density,
    AVG(pi.rent_price_per_sqm)  AS avg_rent_per_sqm,
    AVG(pi.sale_price_per_sqm)  AS avg_sale_per_sqm,
    AVG(pi.payback_years)       AS avg_payback_years
  FROM region r
  LEFT JOIN price_info        pi ON pi.region_id = r.id
  LEFT JOIN demand_structure  ds ON ds.region_id = r.id
  LEFT JOIN demographics      d  ON d.region_id  = r.id
  GROUP BY
    r.id, r.name, r.supply_status,
    ds.student_share,
    d.student_count, d.household_count
),
score AS (
  SELECT
    *,
    (
      CASE
        WHEN avg_payback_years <= 12 THEN 3
        WHEN avg_payback_years <= 16 THEN 2
        WHEN avg_payback_years <= 18 THEN 1
        ELSE 0
      END
      +
      CASE
        WHEN student_share >= 0.50 THEN 2
        WHEN student_share >= 0.30 THEN 1
        ELSE 0
      END
      +
      CASE
        WHEN student_density >= 0.35 THEN 2
        WHEN student_density >= 0.20 THEN 1
        ELSE 0
      END
      +
      CASE
        WHEN supply_status = 'low supply'    THEN 2
        WHEN supply_status = 'medium supply' THEN 1
        ELSE 0
      END
    ) AS investment_score
  FROM region_summary
)
SELECT
  id,
  name,
  supply_status,
  ROUND(student_share, 2)        AS student_share,
  ROUND(student_density, 3)      AS student_density,
  ROUND(avg_rent_per_sqm, 2)     AS avg_rent_per_sqm,
  ROUND(avg_sale_per_sqm, 2)     AS avg_sale_per_sqm,
  ROUND(avg_payback_years, 2)    AS avg_payback_years,
  investment_score
FROM score
ORDER BY
  investment_score DESC,
  avg_payback_years ASC;