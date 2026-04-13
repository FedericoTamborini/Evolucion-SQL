/* 
   CAPÍTULO 4: OPERADORES DE RANGO Y CONJUNTOS
   Objetivo: Aprender a filtrar datos de forma eficiente en rangos de fechas, 
   montos y listas de valores.
*/


-- 1. OPERADOR BETWEEN 


-- ¿Cuántos pagos se realizaron exactamente entre $8 y $10?
-- Nota: BETWEEN es inclusivo, toma los límites (8 y 10).
SELECT COUNT(amount) FROM payment
WHERE amount BETWEEN 8 AND 10;
-- Resultado: 673

-- Filtrado por fechas: ¿Cuántos alquileres en la última semana de mayo 2005?
-- Importante: El formato de fecha en PostgreSQL es 'YYYY-MM-DD'.
SELECT COUNT(rental_date) FROM rental
WHERE rental_date BETWEEN '2005-05-24' AND '2005-05-27';
-- Resultado: 319

-- CASO DE ESTUDIO (Depuración de datos):
-- Una consulta de la primera semana de junio me dio 0. 
-- Antes de asumir un error en el código, verifiqué los datos:
SELECT rental_date FROM rental
WHERE rental_date BETWEEN '2005-06-01' AND '2005-06-20'
ORDER BY rental_date ASC
LIMIT 10;
-- Descubrimiento: Las rentas en junio comenzaron recién el día 14. 
-- El código estaba bien, la base de datos no tenía registros en ese rango.

-- 2. OPERADOR IN 

-- Buscando montos específicos: 0.99, 1.98, 1.99
SELECT COUNT(*) FROM payment
WHERE amount IN (0.99, 1.98, 1.99);
-- Resultado: 3301

-- Uso de NOT IN: Excluir duraciones de alquiler específicas (3, 6 y 7 días).
-- Útil para sistemas de reportes que segmentan la información.
SELECT title, rental_duration FROM film 
WHERE rental_duration NOT IN (3, 6, 7);

/* 
  NOTA:
   Me topé con un error de sintaxis al usar SELECT (columna1, columna2).
   - Con paréntesis: PostgreSQL crea una "tupla" (junta los datos en una sola celda).
   - Sin paréntesis: SQL mantiene el formato de tabla estándar de columnas independientes.
   Lección: Mantener las columnas separadas por comas sin envolverlas en paréntesis.
*/

--LIKE BÚSQUEDA DE PATRONES (LIKE e ILIKE)

-- ¿Cuántos nombres empiezan con 'J' y apellidos con 'S'?
SELECT COUNT(first_name) FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';
-- Resultado: 5

-- 2. El poder de ILIKE (Insensible a mayúsculas)
-- Útil cuando no sabemos cómo se cargaron los datos (ej: 'j' minúscula).
SELECT first_name, last_name FROM customer
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%';

-- 3. Búsqueda de secuencias internas (%er%)
SELECT first_name, last_name FROM customer
WHERE first_name LIKE '%er%';

-- 4. Uso del Wildcard _ (Representa un solo carácter exacto)
-- Nombres que tengan cualquier carácter seguido de 'her' y luego lo que sea.
SELECT first_name, last_name FROM customer
WHERE first_name LIKE '_her%';
-- Resultados: Cheryl, Theresa, Sherry, Sherri.

-- 5. CASO PRÁCTICO: Identificar emails que NO pertenecen a la organización.
-- Buscamos patrones que NO terminen en '.org'
SELECT first_name, email FROM customer
WHERE email NOT LIKE '%.org';

-- 6. CASO PRÁCTICO: Actores con nombres de exactamente 6 letras.
-- Que empiece con 'A', termine con 'a' y tenga 4 espacios definidos en medio.
SELECT * FROM actor
WHERE first_name ILIKE 'A____a'
ORDER BY last_name;
-- Resultados: Angela Hudson y Angela Witherspoon.

/* 
   APRENDIZAJE:
   - % es un comodín para CUALQUIER cantidad de caracteres.
   - _ es un comodín para exactamente UN carácter.
   - NOT LIKE/ILIKE es fundamental para limpiar reportes (excluir patrones).
*/
