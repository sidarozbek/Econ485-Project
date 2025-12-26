CREATE TABLE demographics (
  id INT NOT NULL AUTO_INCREMENT,
  region_id INT NOT NULL,
  african_ratio DECIMAL(4,2),
  earthquake_victim_ratio DECIMAL(4,2),
  student_count INT,
  household_count INT,
  PRIMARY KEY (id),
  CONSTRAINT fk_demographics_region
    FOREIGN KEY (region_id) REFERENCES region(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;