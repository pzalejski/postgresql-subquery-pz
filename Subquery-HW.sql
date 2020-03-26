-- Show all customer names who have made total payments over $175
SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	Group By customer_id
	HAVING SUM(amount) >175
	ORDER BY SUM(amount) DESC
);

-- Show all customer names who have made a single payment above $6.99
SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount = 6.99
	GROUP BY customer_id, amount
);


-- Show all movie information that the store has 5 or more copies from the rental table
SELECT *
From film
Where film_id in(
	SELECT inventory_id
	from inventory
	Where inventory_id IN(
		Select inventory_id
		from rental
		group by inventory_id
		having count(inventory_id) >= 5
	)
);


-- Show all country names where a city begins with the letter 'D'
SELECT *
FROM country
WHERE country_id IN(
	SELECT country_id
	FROM city
	WHERE city LIKE 'D%'
);

-- Using a subquery, find all movies that use the 'French' language.
SELECT *
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM language
	WHERE name = 'French'
);



