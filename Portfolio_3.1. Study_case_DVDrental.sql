'What are the emails of the customers who live in California?'

SELECT EMAIL
FROM ADDRESS
INNER JOIN CUSTOMER ON ADDRESS.ADDRESS_ID = CUSTOMER.ADDRESS_ID
WHERE DISTRICT = 'California'


'Get a list of movies Nick Wahlberg has been in'

SELECT first_name, last_name, title 
FROM actor
INNER JOIN film_actor ON film_actor.actor_id = actor.actor_id
INNER JOIN film ON film.film_id = film_actor.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg'


'What are the top 5 film by total rental revenue?'

SELECT title, SUM (amount)
FROM payment
INNER JOIN
(
SELECT rental_id, title
FROM rental 
LEFT JOIN inventory 
ON rental.inventory_id = inventory.inventory_id
LEFT JOIN film 
ON inventory.film_id = film.film_id)
AS kkk
ON payment.rental_id = kkk.rental_id
GROUP BY title
ORDER BY sum DESC
LIMIT 5
