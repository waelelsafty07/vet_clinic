/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN TRANSACTION;

UPDATE animals SET species = 'Unspecified';

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

BEGIN TRANSACTION;

UPDATE animals SET species = 'Digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'Pokemon' WHERE species IS NULL;

SELECT * FROM animals;

COMMIT;

SELECT * FROM animals;

BEGIN TRANSACTION;

DELETE FROM animals;

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;



BEGIN TRANSACTION;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT my_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT my_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT COUNT(*) AS total_animals FROM animals;
SELECT COUNT(*) AS animals_never_escaped FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS average_weight FROM animals;

SELECT neutered, SUM(escape_attempts) AS total_escape_attempts
FROM animals
GROUP BY neutered
ORDER BY total_escape_attempts DESC
LIMIT 1;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;


SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

SELECT a.name
FROM animals a
JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name, a.name
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id;

SELECT s.name, COUNT(*) as animal_count
FROM animals a
JOIN species s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.name
FROM animals a
JOIN species s ON a.species_id = s.id
JOIN owners o ON a.owner_id = o.id
WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name, COUNT(*) as animal_count
FROM owners o
JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY animal_count DESC
LIMIT 1;

SELECT a.*
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT v.animal_id) AS animal_count
FROM visits v
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'Stephanie Mendez';

SELECT v.name, s.name AS specialty
FROM vets v
LEFT JOIN specializations sp ON sp.vet_id = v.id
LEFT JOIN species s ON s.id = sp.species_id;

SELECT a.*
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'Stephanie Mendez'
  AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name, COUNT(*) AS visit_count
FROM animals a
JOIN visits v ON a.id = v.animal_id
GROUP BY a.name
ORDER BY visit_count DESC
LIMIT 1;

SELECT a.name, MIN(v.visit_date) AS first_visit_date
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'Maisy Smith'
GROUP BY a.name
ORDER BY first_visit_date ASC
LIMIT 1;

SELECT a.*, vt.name AS vet_name, v.visit_date
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(*) AS mismatched_visits
FROM visits v
JOIN vets vt ON vt.id = v.vet_id
JOIN animals a ON a.id = v.animal_id
LEFT JOIN specializations sp ON sp.vet_id = vt.id AND sp.species_id = a.species_id
WHERE sp.id IS NULL;

SELECT s.name AS potential_specialty
FROM visits v
JOIN animals a ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
JOIN specializations sp ON sp.vet_id = vt.id
JOIN species s ON s.id = sp.species_id
WHERE vt.name = 'Maisy Smith'
GROUP BY s.name
ORDER BY COUNT(*) DESC
LIMIT 1;

-- query data with explain analyze 
EXPLAIN ANALYZE  SELECT COUNT(*) FROM visits WHERE animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits WHERE vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners WHERE email = 'owner_18327@mail.com';