CREATE TABLE demand_structure (
  id INT NOT NULL AUTO_INCREMENT,
  region_id INT NOT NULL,
  student_share DECIMAL(4,2),
  civil_servant_share DECIMAL(4,2),
  tradesmen_share DECIMAL(4,2),
  single_share DECIMAL(4,2),
  overall_demand_note VARCHAR(255),
  PRIMARY KEY (id),
  CONSTRAINT fk_demand_structure_region
    FOREIGN KEY (region_id) REFERENCES region(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;