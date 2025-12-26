CREATE TABLE property_type (
  id INT NOT NULL AUTO_INCREMENT,
  region_id INT NOT NULL,
  room_count VARCHAR(10),
  area_sqm INT,
  building_type VARCHAR(30),
  is_furnished TINYINT(1),
  building_age INT,
  has_elevator TINYINT(1),
  insulation_good TINYINT(1),
  risk_level VARCHAR(20),
  PRIMARY KEY (id),
  CONSTRAINT fk_property_type_region
    FOREIGN KEY (region_id) REFERENCES region(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;