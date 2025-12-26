CREATE TABLE region (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  infrastructure_status VARCHAR(30),
  transportation VARCHAR(100),
  avg_building_age INT,
  supply_status VARCHAR(30),
  student_contribution DECIMAL(4,2),
  PRIMARY KEY (id)
) ENGINE=InnoDB;