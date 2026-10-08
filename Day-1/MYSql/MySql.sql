-- =========================================
-- Day-1: MySQL Basics
-- SQL (Structured Query Language) It is a Programming Language used to interact with Relational DataBases.
-- It is used to perform CRUD operations.
-- CRUD = CREATE, READ, UPDATE, DELETE
-- =========================================

-- What is a Database?
-- Database is a Collection of Data in a format that can be easily accessed (Digital).

-- Create a new database
CREATE DATABASE college;

-- Select the database to use
USE college;

-- Create a table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);