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
