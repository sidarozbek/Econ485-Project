CREATE TABLE price_info (
  id INT NOT NULL AUTO_INCREMENT,
  region_id INT NOT NULL,
  property_type_id INT NOT NULL,
  rent_price INT,
  rent_price_per_sqm DECIMAL(10,2),
  sale_price INT,
  sale_price_per_sqm DECIMAL(10,2),
  payback_years DECIMAL(5,2),
  price_date DATE,
  PRIMARY KEY (id),
  CONSTRAINT fk_price_info_region
    FOREIGN KEY (region_id) REFERENCES region(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_price_info_property_type
    FOREIGN KEY (property_type_id) REFERENCES property_type(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;