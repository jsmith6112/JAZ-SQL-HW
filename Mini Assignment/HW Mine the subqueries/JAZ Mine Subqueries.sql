Select a.first_name, a.last_name
	FROM actor a
	WHERE a.actor_id In 
		(SELECT 
			fa.actor_id
		FROM film_actor fa
		WHERE 
			fa.film_id IN (SELECT 
								f.film_id
							FROM film as f
							WHERE f.title = 'ALTER VICTORY'));

SELECT f.title
	FROM film AS f
	WHERE f.film_id IN
					(SELECT i.film_id
					 FROM inventory as i
					 WHERE i.inventory_id IN 
					 					  (SELECT r.inventory_id
							 		       FROM rental r
							 			   WHERE r.staff_id IN 
											  				(SELECT s.staff_id
					 						   				 FROM staff as s
					 						   				 WHERE s.last_name ='Stephens' AND s.first_name ='Jon')));

	


