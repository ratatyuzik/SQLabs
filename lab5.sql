SELECT regions.name,
       (SELECT SUM(cities.population) 
        FROM cities 
        WHERE cities.region = regions.uuid) 
FROM regions;

SELECT regions.name, 
       (SELECT SUM(cities.population) 
        FROM cities 
        WHERE cities.region = regions.uuid)
FROM regions
WHERE (SELECT COUNT(cities.id) 
       FROM cities 
       WHERE cities.region = regions.uuid) >= 10;

SELECT name, population
FROM cities
WHERE region IN (
    SELECT uuid
    FROM regions
    WHERE area_quantity >= 5
)
ORDER BY population DESC
LIMIT 5 OFFSET 10;

SELECT regions.name, 
       (SELECT SUM(cities.population) 
        FROM cities 
        WHERE cities.region = regions.uuid AND cities.population > 300000)
FROM regions;

SELECT cities.name, cities.population
FROM cities, regions
WHERE cities.region = regions.uuid 
  AND regions.area_quantity <= 5
  AND cities.population NOT BETWEEN 150000 AND 500000;
