SELECT
  CASE
    WHEN g.risk_durumu IS NULL OR g.risk_durumu = 'normal'
      THEN 'normal'
    ELSE 'riskli'
  END AS risk_kategori,
  COUNT(DISTINCT g.id)              AS gayrimenkul_sayisi,
  ROUND(AVG(f.amortisman_yil), 2)   AS ort_amortisman,
  ROUND(AVG(f.kira_m2), 2)          AS ort_kira_m2,
  ROUND(AVG(f.satis_m2), 2)         AS ort_satis_m2
FROM gayrimenkul_tipi g
JOIN fiyat_bilgi f ON f.gayrimenkul_id = g.id
GROUP BY risk_kategori;
