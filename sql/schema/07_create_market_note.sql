CREATE TABLE market_note (
  id INT NOT NULL AUTO_INCREMENT,
  region_id INT NOT NULL,
  source VARCHAR(80),
  note VARCHAR(255),
  note_date DATE,
  PRIMARY KEY (id),
  CONSTRAINT fk_market_note_region
    FOREIGN KEY (region_id) REFERENCES region(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;