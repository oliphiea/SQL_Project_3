# Write a SQL query to find when the movie 'American Beauty' 
# was released. Return movie release year.
SELECT 
    mov_year
FROM
    movie
WHERE
    mov_title = 'American Beauty';


# Write a SQL query to find those movies, which were released 
# before 1998. Return movie title.
SELECT 
    mov_title
FROM
    movie
WHERE
    mov_year < 1998;


# Write a query where it should contain all the data of the 
# movies which were released after 1995 and 
# their movie duration was greater than 120.
SELECT 
    *
FROM
    movie
WHERE
    mov_year > 1995 AND mov_time > 120;


# Write a query to determine the Top 7 movies which were 
# released in the United Kingdom. 
# Sort the data in ascending order of the movie year.
SELECT 
    *
FROM
    movie
WHERE
    mov_rel_country = 'UK'
ORDER BY mov_year ASC
LIMIT 7;


# Doubt
# Set the language of movie language as 'Japanese' for the movie which
# has its existing language as Chinese and the movie year was 2001.
select * from movie;
UPDATE movie 
SET 
    mov_lang = 'Japanese'
WHERE
    mov_year = 2001;



# Write a SQL query to find the name of all the reviewers who rated 
# the movie 'Slumdog Millionaire'.
SELECT 
    userId, rating
FROM
    ratings AS r
        JOIN
    movie AS m ON r.movieId = m.mov_id
WHERE
    movieId IN (SELECT 
            mov_id
        FROM
            movie
        WHERE
            mov_title = 'Slumdog Millionaire');


# Write a query which fetches the first name, last name & role played
# by the actor where output should all exclude Male actors.
SELECT 
    act_fname, act_lname
FROM
    actor
WHERE
    act_gender = 'F';


# Write a SQL query to find the actors who played a role in the
# movie 'Annie Hall'. Fetch all the fields of the actor table. 
# (Hint: Use the IN operator).

SELECT 
    *
FROM
    actor
WHERE
    act_id IN (SELECT 
            act_id
        FROM
            cast
        WHERE
            mov_id IN (SELECT 
                    mov_id
                FROM
                    movie
                WHERE
                    mov_title = 'Annie Hall'));


# Write a SQL query to find those movies that have been released 
# in countries other than the United Kingdom. Return movie title, 
# movie year, movie time, and date of release, releasing country.
SELECT 
    mov_title, mov_year, mov_time, mov_dt_rel, mov_rel_country
FROM
    movie
WHERE
    NOT mov_rel_country = 'UK';


#Doubt
# Print genre title, maximum movie duration and count the number
# of movies in each genre. (HINT: By using inner join)
select count(mov_id),gen_id from movie_genres group by gen_id; 
    
SELECT 
    gen_title, COUNT(gen_title), mov_time
FROM
    movie AS m
        JOIN
    movie_genres AS mg ON m.mov_id = mg.mov_id
        JOIN
    genres AS g on mg.gen_id=g.gen_id
GROUP BY gen_title; 



# Create a view which should contain the first name, last name, title
# of the movie & role played by a particular actor.
CREATE VIEW sales_per_ord AS
    (SELECT 
        act_fname, act_lname, m.mov_title, role
    FROM
        actor
            JOIN
        cast USING (act_id)
            JOIN
        movie AS m USING (mov_id));
      
      
SELECT 
    *
FROM
    sales_per_ord;


# Write a SQL query to find the movies with the lowest ratings
SELECT 
    r.movieId, r.rating
FROM
    movie AS m
        RIGHT JOIN
    ratings AS r ON m.mov_id = r.movieId
WHERE
    rating = (SELECT 
            MIN(rating)
        FROM
            ratings); 

