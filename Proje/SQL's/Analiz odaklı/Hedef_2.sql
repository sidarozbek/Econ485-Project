SELECT
  b.ad,
  t.ogrenci_orani,
  COUNT(g.id)                    AS konut_sayisi,
  ROUND(AVG(f.kira_m2), 2)       AS ort_kira_m2
FROM bolge b
JOIN talep_yapisi     t ON t.bolge_id = b.id
LEFT JOIN gayrimenkul_tipi g ON g.bolge_id = b.id
LEFT JOIN fiyat_bilgi     f ON f.gayrimenkul_id = g.id
WHERE
  t.ogrenci_orani >= 0.50
GROUP BY
  b.id,
  b.ad,
  t.ogrenci_orani
ORDER BY
  t.ogrenci_orani DESC;