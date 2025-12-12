SELECT
  b.ad                       AS bolge,
  g.id                       AS gayrimenkul_id,
  g.oda_sayisi,
  g.metrekare,
  g.bina_tipi,
  g.risk_durumu,
  f.kira_fiyati,
  f.satis_fiyati,
  ROUND(f.amortisman_yil, 2) AS amortisman_yil
FROM gayrimenkul_tipi g
JOIN bolge        b ON b.id = g.bolge_id
JOIN fiyat_bilgi  f ON f.gayrimenkul_id = g.id
WHERE
  f.amortisman_yil <= 12
  AND g.risk_durumu IS NOT NULL
  AND g.risk_durumu <> 'normal'
ORDER BY
  amortisman_yil ASC;
