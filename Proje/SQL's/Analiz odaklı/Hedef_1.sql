SELECT
  b.id,
  b.ad,
  ROUND(AVG(f.kira_fiyati), 0)     AS ort_kira,
  ROUND(AVG(f.satis_fiyati), 0)    AS ort_satis,
  ROUND(AVG(f.amortisman_yil), 2)  AS ort_amortisman,
  t.ogrenci_orani
FROM bolge b
LEFT JOIN fiyat_bilgi   f ON f.bolge_id = b.id
LEFT JOIN talep_yapisi t ON t.bolge_id = b.id
GROUP BY
  b.id,
  b.ad,
  t.ogrenci_orani
ORDER BY
  ort_amortisman ASC;