CREATE TABLE ratings (
imdb_title_id varchar(30) PRIMARY KEY,
us_voters_rating FLOAT,
non_us_voters_rating FLOAT,
us_voters_votes FLOAT,
non_us_voters_votes FLOAT,
average_total_ratings FLOAT
);
