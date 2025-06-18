
# Celestial Bodies Database

This repository contains the solution for the "Build a Celestial Bodies Database" project, which is part of the Relational Database course within the freeCodeCamp.org Relational Database Developer certification.

## Project Description

The goal of this project was to design and implement a PostgreSQL database to store information about celestial bodies, including galaxies, stars, planets, and moons. The database schema includes various data types and enforces relationships between different celestial entities using foreign keys.

## Technologies Used

* **PostgreSQL:** The relational database management system used for creating and managing the database.
* **SQL:** The language used to define the schema, insert data, and query the database.
* **Gitpod:** The cloud-based development environment used to complete the project.

## Database Schema Overview

The database `universe` contains the following main tables, along with their relationships:

* **`galaxy`**: Stores information about different galaxies.
    * `galaxy_id` (Primary Key)
    * `name` (Unique, Not Null)
    * `description` (TEXT)
    * `age_in_millions_of_years` (INT)
    * `distance_from_earth_mly` (NUMERIC)
    * `has_life` (BOOLEAN)
* **`star`**: Stores information about stars, each belonging to a `galaxy`.
    * `star_id` (Primary Key)
    * `name` (Unique, Not Null)
    * `is_spherical` (BOOLEAN)
    * `age_in_millions_of_years` (INT)
    * `description` (TEXT)
    * `galaxy_id` (Foreign Key referencing `galaxy`)
* **`planet`**: Stores information about planets, each orbiting a `star`.
    * `planet_id` (Primary Key)
    * `name` (Unique, Not Null)
    * `has_life` (BOOLEAN)
    * `is_spherical` (BOOLEAN)
    * `description` (TEXT)
    * `star_id` (Foreign Key referencing `star`)
* **`moon`**: Stores information about moons, each orbiting a `planet`.
    * `moon_id` (Primary Key)
    * `name` (Unique, Not Null)
    * `is_spherical` (BOOLEAN)
    * `distance_from_planet_km` (INT)
    * `description` (TEXT)
    * `planet_id` (Foreign Key referencing `planet`)
* **`galaxy_types`**: (Bonus table) Stores different classifications of galaxies.
    * `galaxy_types_id` (Primary Key)
    * `name` (Unique, Not Null)
    * `description` (TEXT)

## Database Setup & Restoration

The entire database schema and data are encapsulated in the `universe.sql` file. You can recreate this database on your local PostgreSQL instance by following these steps:

1.  **Ensure PostgreSQL is installed and running.**
2.  **Open your terminal or command prompt.**
3.  **Run the following command:**
    ```bash
    psql -U postgres < universe.sql
    ```
    (Replace `postgres` with your PostgreSQL superuser if it's different. This command assumes you are in the directory where `universe.sql` is located.)

This command will:
* Drop the `universe` database if it already exists.
* Create a new `universe` database.
* Create all the tables with their specified columns and constraints.
* Insert all the data into the tables, populating them as required.

## Key Requirements Met

This project successfully implements the following freeCodeCamp requirements:

* Database named `universe` created.
* Tables `galaxy`, `star`, `planet`, `moon` created, plus an additional `galaxy_types` table (total 5+ tables).
* Each table has a primary key (`table_name_id`), automatically incrementing (`SERIAL`).
* Each table has a `name` column (`VARCHAR`, `UNIQUE`, `NOT NULL`).
* Correct usage of `INT`, `NUMERIC`, `TEXT`, and `BOOLEAN` data types.
* At least two `NOT NULL` columns per table (excluding primary keys).
* Foreign key relationships established: `star` to `galaxy`, `planet` to `star`, `moon` to `planet`.
* Minimum row counts met for all tables:
    * `galaxy`: >= 6 rows
    * `star`: >= 6 rows
    * `planet`: >= 12 rows
    * `moon`: >= 20 rows
    * `galaxy_types`: >= 3 rows

