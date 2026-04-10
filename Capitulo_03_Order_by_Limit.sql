--CAPÍTULO 3: ORDENAMIENTO DE RESULTADOS (ORDER BY)
--Objetivo: Aprender a organizar la salida de datos para un análisis más claro.

--Ordenamiento básico por nombre.
-- Por defecto, SQL ordena de forma ascendente (A-Z).
SELECT * FROM customer
ORDER BY first_name;


-- Ordenamiento multinivel.
-- Útil cuando hay duplicados en una columna (como store_id). 
-- Primero agrupa por tienda y, dentro de cada grupo, ordena por nombre.
SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id, first_name ASC;

-- Ordenar por columnas no seleccionadas.
-- Dato clave: Puedo ordenar por 'replacement_cost' aunque solo quiera ver el 'title'.
-- El motor de la DB puede procesar el orden de una columna que no está en el SELECT.
SELECT title FROM film
ORDER BY replacement_cost DESC; -- Agregué DESC para ver las más caras primero 

--¿Cuáles son las 5 películas más cortas?
SELECT title, length FROM film
ORDER BY length ASC
LIMIT 5;

--Cuales fueron las cinco filas o pagos mas recientes segun la fecha de pago?
SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date
LIMIT 5
--Ejercicios
  
--Caso 1: Queremos recompensar a nuestros primeros 10 clientes (ID más bajos).
-- Uso ORDER BY para asegurar que empiezo desde el 1 y LIMIT para cortar en 10.
SELECT first_name, last_name, email FROM customer
ORDER BY customer_id ASC
LIMIT 10;


-- CASO 2: Un cliente quiere ver algo corto. ¿Cuáles son las 5 películas más breves?
-- Ordeno por duración (length) y pido los primeros 5 resultados.
SELECT title, length FROM film
ORDER BY length ASC
LIMIT 5;


-- CASO 3: ¿Cuántas películas duran 50 minutos o menos?
-- Mi enfoque: Ver los títulos y la duración para tener el detalle.
SELECT title, length FROM film
WHERE length <= 50 
ORDER BY length;

-- Enfoque de reporte: Contar el total de opciones disponibles.
SELECT COUNT(title) FROM film
WHERE length <= 50;

/* 
   NOTA:
   Para el bonus, instintivamente combiné WHERE (filtro) con ORDER BY (organización).
   esta consulta permite dar la respuesta con el detalle de los títulos, lo cual es más útil para el cliente final.
*/
