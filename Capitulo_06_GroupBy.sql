
-- ANALISIS DE CLIENTES Y TRANSACCIONES
-- Base de datos: dvdrental
-- Objetivo: entender comportamiento de clientes y métricas clave



--  1. Exploración básica de costos

-- ¿Cuál es el costo mínimo y máximo de reemplazo?
SELECT 
    MIN(replacement_cost) AS min_cost,
    MAX(replacement_cost) AS max_cost
FROM film;


-- ¿Cuál es el costo promedio de reemplazo?
SELECT 
    ROUND(AVG(replacement_cost), 2) AS avg_cost
FROM film;


-- ¿Cuánto costaría reemplazar todo el inventario?
SELECT 
    SUM(replacement_cost) AS total_replacement_cost
FROM film;




-- 2. Análisis de clientes (nivel negocio)


-- ¿Cuáles son los 5 clientes que más dinero gastaron?

SELECT 
    customer_id,
    SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;


-- Insight:
-- Estos clientes representan los usuarios más valiosos del negocio.


-- Obtener información de esos clientes (emails, nombres)

SELECT 
    customer_id,
    first_name,
    last_name,
    email
FROM customer
WHERE customer_id IN (148, 526, 178, 137, 144);




--  3. Frecuencia de transacciones


-- ¿Qué clientes realizaron más transacciones?

SELECT 
    customer_id,
    COUNT(*) AS total_transactions
FROM payment
GROUP BY customer_id
ORDER BY total_transactions DESC
LIMIT 5;


--  4. Análisis más avanzado


-- ¿Qué cliente gastó más con cada empleado?

SELECT 
    customer_id,
    staff_id,
    SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id, staff_id
ORDER BY staff_id, total_spent DESC;




--  5. Análisis por fecha


-- ¿Qué días generaron más ingresos?

SELECT 
    DATE(payment_date) AS payment_day,
    SUM(amount) AS daily_revenue
FROM payment
GROUP BY payment_day
ORDER BY daily_revenue DESC;




--  6. Segmentación de clientes (HAVING)


-- Clientes que gastaron más de $100

SELECT 
    customer_id,
    SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;


-- Clientes elegibles para "estatus platino" (40+ transacciones)

SELECT 
    customer_id,
    COUNT(*) AS total_transactions
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40;
