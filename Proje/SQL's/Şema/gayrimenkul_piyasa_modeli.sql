DROP TABLE IF EXISTS piyasa_notu;
DROP TABLE IF EXISTS demografi;
DROP TABLE IF EXISTS talep_yapisi;
DROP TABLE IF EXISTS fiyat_bilgi;
DROP TABLE IF EXISTS gayrimenkul_tipi;
DROP TABLE IF EXISTS bolge;

CREATE TABLE bolge (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ad TEXT,
  altyapi_durumu TEXT,
  ulasim TEXT,
  ort_bina_yasi INTEGER,
  arz_durumu TEXT,
  ogrenci_katkisi REAL
);

CREATE TABLE gayrimenkul_tipi (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  bolge_id INTEGER,
  oda_sayisi TEXT,
  metrekare INTEGER,
  bina_tipi TEXT,
  esyali_mi INTEGER,
  bina_yasi INTEGER,
  asansor_var INTEGER,
  yalitim_iyi INTEGER,
  risk_durumu TEXT,
  FOREIGN KEY (bolge_id) REFERENCES bolge(id)
);

CREATE TABLE fiyat_bilgi (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  bolge_id INTEGER,
  gayrimenkul_id INTEGER,
  kira_fiyati INTEGER,
  kira_m2 REAL,
  satis_fiyati INTEGER,
  satis_m2 REAL,
  amortisman_yil REAL,
  tarih TEXT,
  FOREIGN KEY (bolge_id) REFERENCES bolge(id),
  FOREIGN KEY (gayrimenkul_id) REFERENCES gayrimenkul_tipi(id)
);

CREATE TABLE talep_yapisi (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  bolge_id INTEGER,
  ogrenci_orani REAL,
  memur_orani REAL,
  esnaf_orani REAL,
  bekar_orani REAL,
  toplam_talep_not TEXT,
  FOREIGN KEY (bolge_id) REFERENCES bolge(id)
);

CREATE TABLE demografi (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  bolge_id INTEGER,
  afrikali_orani REAL,
  depremzede_orani REAL,
  ogrenci_sayisi INTEGER,
  hane_sayisi INTEGER,
  FOREIGN KEY (bolge_id) REFERENCES bolge(id)
);

CREATE TABLE piyasa_notu (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  bolge_id INTEGER,
  kaynagi TEXT,
  aciklama TEXT,
  tarih TEXT,
  FOREIGN KEY (bolge_id) REFERENCES bolge(id)
);