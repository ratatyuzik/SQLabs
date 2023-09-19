SELECT name
FROM cities 
WHERE name LIKE '%ськ';

SELECT name
FROM cities
WHERE name LIKE '%донец%';

SELECT CONCAT(name, '(',region,')')
FROM cities
WHERE population > 100000
ORDER BY name ASC;

SELECT name, (population/40000000)*100 AS prosentik 
FROM cities
ORDER BY population DESC
LIMIT 10;

SELECT CONCAT(name, ' - ', (population/40000000)*100, '%')
FROM cities
WHERE population >= (40000000 * (0.1/100))
ORDER BY (population/40000000)*100 DESC;
