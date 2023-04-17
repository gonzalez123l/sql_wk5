-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
SELECT *
FROM payment 
WHERE amount BETWEEN 1.99 AND 3.99;

-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC

-- 4. How many customers have the last name ‘William’?
SELECT first_name, last_name
FROM customer
WHERE last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals?
SELECT rental.staff_id, COUNT(*) as rental_count
FROM rental
JOIN staff ON rental.staff_id = staff.staff_id
GROUP BY rental.staff_id
ORDER BY rental_count DESC;
-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district) as district_count
FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id) AS actors
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id
HAVING store_id = 1;

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(amount) as amount_count
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;
-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;