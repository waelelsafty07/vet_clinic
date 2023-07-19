/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(10,2),
  species_id INTEGER REFERENCES species(id),
  owner_id INTEGER REFERENCES owners(id)
);

CREATE TABLE species (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255)
);
CREATE TABLE owners (
  id INTEGER PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);

CREATE TABLE vets (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  age INT,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  id INTEGER PRIMARY KEY,
  vet_id INTEGER,
  species_id INTEGER,
  FOREIGN KEY (vet_id) REFERENCES vets (id),
  FOREIGN KEY (species_id) REFERENCES species (id)
);

CREATE TABLE visits (
  id INTEGER PRIMARY KEY,
  vet_id INTEGER,
  animal_id INTEGER,
  visit_date DATE,
  FOREIGN KEY (vet_id) REFERENCES vets (id),
  FOREIGN KEY (animal_id) REFERENCES animals (id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- improve performance by creating indexes
CREATE INDEX animal_id_index ON visits(animal_id);
CREATE INDEX vet_id_index ON visits(vet_id);
CREATE INDEX email_index ON owners(email);
CREATE INDEX visits_vet_id_covering_idx ON visits(vet_id) INCLUDE (id, animal_id, date_of_visit);

