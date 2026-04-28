-- INNER JOIN
-- Une ambas tablas mostrando solo los registros que coinciden en ambas

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    p.amount,
    p.payment_date
FROM payment AS p
INNER JOIN customer AS c
ON p.customer_id = c.customer_id;



-- FULL OUTER JOIN

-- Queremos verificar integridad de datos:
-- - Pagos sin cliente asociado
-- - Clientes sin pagos registrados

SELECT *
FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS NULL
   OR payment.payment_id IS NULL;

-- Resultado: no hay inconsistencias


-- Verificación adicional: cantidad de clientes únicos
SELECT COUNT(DISTINCT customer_id)
FROM customer;



-- LEFT JOIN

-- Relacionamos películas con inventario
-- inventory contiene:
-- - inventory_id
-- - film_id (relacionado con film)
-- - store_id

SELECT 
    film.film_id, 
    title, 
    inventory_id,
    store_id
FROM film
LEFT JOIN inventory 
ON inventory.film_id = film.film_id;

-- Muestra todas las películas, tengan o no inventario


-- Películas SIN inventario
SELECT 
    film.film_id, 
    title, 
    inventory_id,
    store_id
FROM film
LEFT JOIN inventory 
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL;

-- Estas películas no están disponibles en ninguna tienda



-- CASO PRÁCTICO I

-- Clientes que realizaron al menos un pago (sin duplicados)

SELECT DISTINCT 
    c.first_name, 
    c.last_name,
    c.email
FROM customer AS c
INNER JOIN payment AS p 
ON c.customer_id = p.customer_id;



-- CASO PRÁCTICO II

-- Películas que nunca fueron alquiladas

SELECT DISTINCT 
    f.film_id,
    f.title
FROM film f
LEFT JOIN inventory i 
    ON f.film_id = i.film_id
LEFT JOIN rental r 
    ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;



-- DESAFÍOS


-- 1) Clientes que viven en California

SELECT 
    c.first_name,
    c.last_name,
    c.email,
    a.district
FROM customer AS c
INNER JOIN address AS a 
    ON c.address_id = a.address_id
WHERE a.district = 'California';


-- 2) Películas donde actuó Nick Wahlberg

SELECT 
    f.title,
    a.first_name,
    a.last_name
FROM film AS f
INNER JOIN film_actor AS fa 
    ON f.film_id = fa.film_id
INNER JOIN actor AS a 
    ON a.actor_id = fa.actor_id
WHERE a.first_name = 'Nick' 
  AND a.last_name = 'Wahlberg';
