/* Populate database with sample data. */
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ( 'Agumon', '2020-02-03', 0, TRUE, 10.23);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ( 'Pikachu', '2021-01-07', 1, FALSE, 15.04);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ( 'Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ( 'Charmander', '2020-02-08', 0, FALSE, -11);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ( 'Plantmon', '2021-11-15', 2, TRUE, -5.7);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ( 'Squirtle', '1993-04-02', 3, FALSE, -12.13);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ( 'Angemon', '2005-06-12', 1, TRUE, -45);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ( 'Boarmon', '2005-06-07', 7, TRUE, 20.4);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ( 'Blossom', '1998-10-13', 3, TRUE, 17);

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ( 'Ditto', '2022-05-14', 4, TRUE, 22);

-- Insert data into the owners table
INSERT INTO owners (full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

-- Insert data into the species table
INSERT INTO species (name)
VALUES
  ('Pokemon'),
  ('Digimon');

-- Update animals table with species_id and owner_id
UPDATE animals
SET species_id = CASE
  WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
  ELSE (SELECT id FROM species WHERE name = 'Pokemon')
END,
owner_id = CASE
  WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
  WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
  WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
  WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
  WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END
WHERE species_id IS NULL AND owner_id IS NULL;

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id)
VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), 1);

INSERT INTO specializations (vet_id, species_id)
VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 2);

INSERT INTO specializations (vet_id, species_id)
VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 1);

INSERT INTO specializations (vet_id, species_id)
VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), 2);

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), 1, '2020-05-24');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 1, '2020-07-22');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), 2, '2021-02-02');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), 3, '2020-01-05');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), 3, '2020-03-08');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), 3, '2020-05-14');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 4, '2021-05-04');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), 5, '2021-02-24');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), 6, '2019-12-21');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), 6, '2020-08-10');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), 6, '2021-04-07');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 7, '2019-09-29');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), 8, '2020-10-03');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), 8, '2020-11-04');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), 9, '2019-01-24');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), 9, '2019-05-15');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), 9, '2020-02-27');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), 9, '2020-08-03');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 10, '2020-05-24');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), 10, '2021-01-11');


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';