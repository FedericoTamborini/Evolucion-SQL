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
