--CAPÍTULO 2: FILTRADO DE DATOS (WHERE)
--Objetivo: Aprender a interrogar a la base de datos con condiciones específicas.

-- Búsqueda: ¿Cómo se llama el cliente 'Jared'?
-- Uso el '=' porque sé exactamente qué busco. Ojo con las comillas simples para texto.
SELECT * FROM customer
WHERE first_name = 'Jared';


--  Combinando filtros con AND: Tarifas altas + Costo de reemplazo alto + Clasificación R.
-- AND es restrictivo: se tienen que cumplir TODAS para que aparezca en el resultado.
SELECT * FROM film
WHERE rental_rate > 4 
  AND replacement_cost >= 19.99
  AND rating ='R';


--  ¿Cuántos títulos cumplen lo anterior? 
-- Uso COUNT sobre 'title' para tener un número rápido. 
-- Es mejor contar una columna específica que usar el *.
SELECT COUNT(title) FROM film
WHERE rental_rate > 4 
  AND replacement_cost >= 19.99
  AND rating ='R';


--  El operador OR: Películas R o PG-13.
-- A diferencia de AND, con OR me sirve que cumpla cualquiera de las dos.
SELECT * FROM film
WHERE rental_rate > 4 
  AND replacement_cost >= 19.99
  AND (rating ='R' OR rating = 'PG-13'); -- Los paréntesis ayudan a agrupar la lógica


-- El operador de desigualdad (!=): Todo lo que NO sea clasificación 'R'.
SELECT * FROM film
WHERE rating != 'R';



   RESOLUCIÓN DE CASOS (PRÁCTICA REAL) 

-- CASO 1: El cliente que olvidó la billetera (Nancy Thomas).
-- Paso 1: Revisé en Schemas -> Tables -> customer para ver los nombres de las columnas.
-- Paso 2: Filtro por nombre y apellido para asegurar que es la persona correcta.
SELECT email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';
-- Resultado: nancy.thomas@sakilacustomer.org


-- CASO 2: Descripción de la película 'Outlaw Hanky'.
-- Solo pido la columna 'description' para no traer datos innecesarios.
SELECT description FROM film
WHERE title = 'Outlaw Hanky';
-- Nota: Cuidado con las mayúsculas y espacios, SQL es sensible a eso en el texto.


-- CASO 3: Teléfono de un cliente por su dirección (259 Ipoh Drive).
-- Aquí la tabla y la columna se llaman igual ('address'). 
-- SELECT busca el dato (teléfono), FROM la tabla y WHERE la columna de filtro.
SELECT phone FROM address
WHERE address = '259 Ipoh Drive';
-- Resultado: 419009857119
