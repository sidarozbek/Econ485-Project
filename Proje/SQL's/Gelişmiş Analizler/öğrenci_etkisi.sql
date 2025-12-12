WITH ref AS (
  SELECT
    b.id,
    b.ad,
    AVG(f.kira_m2) AS ref_kira_m2
  FROM bolge b
  JOIN talep_yapisi t ON t.bolge_id = b.id
  JOIN fiyat_bilgi  f ON f.bolge_id = b.id
  ORDER BY t.ogrenci_orani ASC
  LIMIT 1              -- ogrenci_orani en düşük olan bölge (Cevizlidere)
)
SELECT
  b.ad,
  ROUND(t.ogrenci_orani, 2)             AS ogrenci_orani,
  ROUND(AVG(f.kira_m2), 2)              AS ort_kira_m2,
  ROUND(
    AVG(f.kira_m2) - (SELECT ref_kira_m2 FROM ref),
    2
  ) AS ogrenci_kira_primi
FROM bolge b
JOIN talep_yapisi t ON t.bolge_id = b.id
JOIN fiyat_bilgi  f ON f.bolge_id = b.id
GROUP BY
  b.id,
  b.ad,
  t.ogrenci_orani
ORDER BY
  t.ogrenci_orani DESC;
