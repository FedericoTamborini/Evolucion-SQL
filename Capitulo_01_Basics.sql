-- SELECT: seleccion de columnas

SELECT first_name, last_name FROM actor;

SELECT * FROM film;

-- DISTINCT: Obtenemos valores unicos de una tabla.

SELECT DISTINCT(district) FROM address;

-- COUNT: Lo utilizo para el conteo  de registros

SELECT DISTINCT(rental_id) FROM rental;

-- COUNT es muy util si lo combinamos por ejmplo con DISTINCT para saber cuantos nombres distintos de clientes hay en la base de datos

SELECT COUNT(DISTINCT first_name) FROM customer;