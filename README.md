# Project: Data-Analytics-13-ETL

## Files
| File     | Description | Source |
|:---------|:------------|:-------|
[movies.ipynb](movies.ipynb) | Jupyiter Notebook to clean-up IMDB Movies CSV | This Repository
[ratings.ipynb](ratings.ipynb) | Jupyiter Notebook to clean-up IMDB Ratings CSV | This Repository
[disneyplus.ipynb](disneyplus.ipynb) | Jupyiter Notebook to clean-up Disney+ Shows CSV | This Repository
[schema.sql](schema.sql) | SQL statements to generate the database tables | This Repository
[imdb_movies.csv](resources/imdb_movies.csv) | CSV file containing IMDB Movie data | This Repository
[imdb_ratings.csv](resouces/imdb_ratings.csv) | CSV file containing IMDB Movie Ratings data | This Repository
[disney_plus_shows.csv](resources/disney_plus_shows.csv) | CSV file containing Disney+ Shows data | This Repository

## Getting Started
### Setup .env File
This file is used by the scripts to connect to the local instance of PostgreSQL.
1. Create a `.env` in the root of the respository. similar to:
```
DB_USER="<database_username>"
DB_PASSWD="<database_password>"
```

### Setup Database
1. In the local instance of PostgreSQL create a database called `movies_db`:
```sql
DROP DATABASE IF EXISTS movies_db;
CREATE DATABASE movies_db;
```
2. Create the tables using [schema.sql](schema.sql)

### Install Required Modules
1. Install `python-dotenv` module
```
pip3 install python-dotenv
```
2. Install `psycopg2-binary` module
```
pip3 install psycopg2-binary
```

## Walkthrough
1. Execute each notebook file to clean-up the source csv files and import the data into their respective database tables.
2. Explore the data with your own queries!

## Final Report
### Extract: The original data sources and how the data was formatted?
#### Data Sources
Two datasets were gathered from [Kaggle](https://www.kaggle.com)

* [IMDb-Extensive-Dataset](https://www.kaggle.com/stefanoleone992/imdb-extensive-dataset)
    1. IMDb movies.csv
    2. IMDb ratings.csv

* [Disney-Plus-Shows](https://www.kaggle.com/unanimad/disney-plus-shows)
    1. disney_plus_shows.csv

### Transform: What data cleaning or transformation was required?
* imdb-movies
    * Removed unneeded columns.
    * Filled NaN values in the `reviews_from_users` column with `0`.
    * Filled NaN values in the `reviews_from_critics` column with `0`.
    * Replaced NaN values in the `description` column with an empty string.

* imdb-rating
    * Removed unneeded columns.
    * Added a new calculated column `average_voters_rating` which is the mean of `us_voters_rating` and `non_us_voters_rating`.
    * Added a new calculated column `average_voters_votes` which is the mean of `us_voters_votes` and `non_us_voters_votes`.

* disney-plus-shows
    * Removed unneeded columns.
    * Renamed the `imdb_id` column to `imdb_title_id` to match the other sources.
    * Renamed the `rating` column to `mpaa_rating` to accurately reflect the contained data.
    * Replaced NaN values in the `mpaa_rating` column with `NR` to represent 'Not Rated'.

### Load: The final database, tables/collections, and why this was chosen?
#### Database
* PostgreSQL

#### Tables
* movies
* ratings
* disney_plus

#### Explaination
Relational-Database was used because the data is highly structured and the sources share a common reference field.