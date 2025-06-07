--Q1. Give the name, release year, and worldwide gross of the lowest grossing movie.

SELECT *
FROM revenue
INNER JOIN specs
ON revenue.movie_id = specs.movie_id
ORDER BY worldwide_gross ASC;

--Answer: Semi-Tough, 1977, $37,187,139

--Q2. What year has the highest average imdb rating?

SELECT specs.release_year, ROUND(AVG(rating.imdb_rating),2) AS avg_rating
FROM rating
INNER JOIN specs
ON rating.movie_id = specs.movie_id
GROUP BY specs.release_year
ORDER BY avg_rating DESC;

--Answer: 1991

--Q3. What is the highest grossing G-rated movie? Which company distributed it?

SELECT revenue.worldwide_gross, specs.mpaa_rating, distributors.company_name, specs.film_title
FROM distributors
INNER JOIN specs
ON distributors.distributor_id = specs.domestic_distributor_id
INNER JOIN revenue
ON specs.movie_id = revenue.movie_id
WHERE mpaa_rating = 'G'
ORDER BY worldwide_gross DESC;

--Answer: Toy Story 4 is the highest grossing G rated film and it was distributed by Walt Disney.

--Q4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

SELECT COUNT(distributors.distributor_id) AS total_films, distributors.company_name
FROM distributors
LEFT JOIN specs
ON distributors.distributor_id = specs.domestic_distributor_id
GROUP BY company_name
ORDER BY COUNT(distributors.distributor_id) DESC;

--Q5. 

