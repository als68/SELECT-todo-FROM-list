-- 1
DROP ROLE IF EXISTS michael;

-- 2
CREATE ROLE michael WITH ENCRYPTED PASSWORD 'stonebreaker';

-- 3
DROP DATABASE IF EXISTS todo_app;

-- 4
CREATE DATABASE todo_app;

-- 5
\c todo_app;

-- 6

-- 7

-- 8

\c andy;