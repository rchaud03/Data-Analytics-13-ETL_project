CREATE TABLE ratings (
imdb_title_id varchar(30) PRIMARY KEY,
us_voters_rating FLOAT,
non_us_voters_rating FLOAT,
us_voters_votes FLOAT,
non_us_voters_votes FLOAT,
average_total_ratings FLOAT
);

CREATE TABLE movies (
imdb_title_id varchar(30) PRIMARY KEY,
title varchar(30),
year INTEGER,
genre varchar(30),
description varchar(30),
reviews_from_users FLOAT,
reviews_from_critics FLOAT
);