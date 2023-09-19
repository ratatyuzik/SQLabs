SELECT name, population
FROM cities 
WHERE population > 1000000;

SELECT population 
FROM cities 
WHERE region = 'E' OR 'W'
ORDER BY population DESC;

SELECT name
FROM cities 
WHERE population > 50000 AND region IN('S', 'C', 'N');

SELECT name, id 
FROM cities 
WHERE population > 150000 AND population < 350000 AND region IN('E', 'W', 'N')
ORDER BY name ASC
LIMIT 20;

SELECT name
FROM cities 
WHERE NOT  region IN('E', 'W')
ORDER BY  population DESC
LIMIT 10 OFFSET 10;
