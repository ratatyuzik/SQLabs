SELECT UPPER(name)
FROM cities
ORDER BY name ASC
LIMIT 5 OFFSET 5;

SELECT name, LENGTH(name)/2 AS length
FROM cities
WHERE LENGTH(name)/2 NOT IN (8, 9, 10)
ORDER BY name ASC;
#не знаю чому ленгс повертає значення х2 ...

SELECT population
FROM cities
WHERE region IN ("C","S");

SELECT AVG(population) AS average_population_in_region_w
FROM cities
WHERE region IN ("W");

SELECT COUNT(name)
FROM cities
WHERE region IN ("E");
