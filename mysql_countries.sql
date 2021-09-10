USE world;

-- 1.
SELECT name, language, percentage AS pct
FROM countries
LEFT JOIN languages
ON countries.id = languages.country_id
WHERE language = "Slovene"
ORDER BY pct DESC;

-- 2.
SELECT countries.name as country, COUNT(cities.name) AS cities
FROM countries
LEFT JOIN cities
ON countries.id = cities.country_id
GROUP BY countries.name
ORDER BY cities DESC;

-- 3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? 
-- Tu consulta debe organizar el resultado por población en orden descendente. (1)
SELECT cities.name, cities.population
FROM countries
LEFT JOIN cities
ON countries.id = cities.country_id
WHERE countries.name = "Mexico"
ORDER BY cities.population DESC;

-- 4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? 
-- Tu consulta debe organizar el resultado por porcentaje en orden descendente. (1)
SELECT countries.name, languages.language, languages.percentage
FROM countries
LEFT JOIN languages
ON countries.id = languages.country_id
WHERE percentage > 89
ORDER BY percentage DESC;

-- 5. ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000? (2)
SELECT countries.name, countries.surface_area, cities.population
FROM countries
LEFT JOIN cities
ON countries.id = cities.country_id
WHERE surface_area < 501 AND cities.population > 100000
ORDER BY population DESC;

-- 6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida
-- superior a 75 años? (1)
SELECT name, government_form, capital, life_expectancy
FROM countries
WHERE capital > 200 AND life_expectancy > 75;

-- 7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población 
-- superior a 500,000? La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. (2)
SELECT countries.name, cities.name, cities.district, cities.population
FROM countries
LEFT JOIN cities
ON countries.id = cities.country_id
WHERE countries.name = "Argentina" AND cities.district = "Buenos Aires" AND cities.population > 500000;

-- 8. ¿Qué consulta harías para resumir el número de países en cada región? La consulta debe mostrar el nombre de la región y el 
-- número de países. Además, la consulta debe organizar el resultado por el número de países en orden descendente. (2)
SELECT countries.region, COUNT(countries.name) AS countries
FROM countries
GROUP BY countries.region
ORDER BY countries DESC;



