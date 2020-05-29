--Goal - Query the number of copies in inventory, show the film titles. Create a view called "title_count
-- Create a subquery

Create view title_count as
Select
	title,
	(
		Select
			Count(inventory.film_id)
		From 
			inventory
		Where 
			film.film_id = inventory.film_id
	) As "Number of copies"
From
	film;
	
Select * from title_count
	where "Number of copies" = 7