WITH bolge_ozet AS (
  SELECT
    b.id,
    b.ad,
    b.arz_durumu,
    t.ogrenci_orani,
    d.ogrenci_sayisi * 1.0 / d.hane_sayisi AS ogrenci_yogunlugu,
    AVG(f.kira_m2)    AS ort_kira_m2,
    AVG(f.satis_m2)   AS ort_satis_m2,
    AVG(f.amortisman_yil) AS ort_amortisman
  FROM bolge b
  LEFT JOIN fiyat_bilgi   f ON f.bolge_id = b.id
  LEFT JOIN talep_yapisi  t ON t.bolge_id = b.id
  LEFT JOIN demografi     d ON d.bolge_id = b.id
  GROUP BY
    b.id, b.ad, b.arz_durumu,
    t.ogrenci_orani,
    d.ogrenci_sayisi,
    d.hane_sayisi
),
skor AS (
  SELECT
    *,
    (
      CASE 
        WHEN ort_amortisman <= 12 THEN 3
        WHEN ort_amortisman <= 16 THEN 2
        WHEN ort_amortisman <= 18 THEN 1
        ELSE 0
      END
      +
      CASE
        WHEN ogrenci_orani >= 0.50 THEN 2
        WHEN ogrenci_orani >= 0.30 THEN 1
        ELSE 0
      END
      +
      CASE
        WHEN ogrenci_yogunlugu >= 0.35 THEN 2
        WHEN ogrenci_yogunlugu >= 0.20 THEN 1
        ELSE 0
      END
      +
      CASE
        WHEN arz_durumu = 'düşük arz' THEN 2
        WHEN arz_durumu = 'orta arz'  THEN 1
        ELSE 0
      END
    ) AS yatirim_puani
  FROM bolge_ozet
)
SELECT
  id,
  ad,
  arz_durumu,
  ROUND(ogrenci_orani, 2)      AS ogrenci_orani,
  ROUND(ogrenci_yogunlugu, 3)  AS ogrenci_yogunlugu,
  ROUND(ort_kira_m2, 2)        AS ort_kira_m2,
  ROUND(ort_satis_m2, 2)       AS ort_satis_m2,
  ROUND(ort_amortisman, 2)     AS ort_amortisman,
  yatirim_puani
FROM skor
ORDER BY
  yatirim_puani DESC,
  ort_amortisman ASC;
