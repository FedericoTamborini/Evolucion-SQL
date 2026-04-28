-- 1. Filtrado numérico: ¿Cuántas transacciones superan los $5?
SELECT COUNT(amount) FROM payment
WHERE amount > 5;
-- Resultado: 3618

-- 2. Búsqueda de patrones: Actores cuyo nombre empieza con 'P'.
SELECT COUNT(first_name) FROM actor
WHERE first_name LIKE 'P%';
-- Resultado: 5

-- 3. Análisis de diversidad: ¿De cuántos distritos distintos proceden nuestros clientes?
-- Uso de COUNT + DISTINCT para obtener el número exacto de zonas geográficas únicas.
SELECT COUNT(DISTINCT(district)) FROM address;
-- Resultado: 378

-- 4. Filtros compuestos: Películas clasificación 'R' y costo de reemplazo entre $5 y $15.
-- Nota: Aquí el COUNT(*) es una buena práctica. Al motor no le importa la columna, 
-- solo cuenta las filas que cumplen la condición, lo cual es más eficiente.
SELECT COUNT(*) FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;
-- Resultado: 52

-- 5. Búsqueda de palabras clave en títulos: Películas con "Truman" en el título.
-- Uso de ILIKE para asegurar que capture el patrón sin importar mayúsculas/minúsculas.
SELECT COUNT(title) FROM film
WHERE title ILIKE '%Truman%';
-- Resultado: 5
