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
CREATE TABLE tasks (
    /*id INTEGER NOT NULL,*/
    id SERIAL,
    title varchar(255) NOT NULL,
    description text NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NULL,
    completed boolean NOT NULL DEFAULT FALSE
  );

-- 7
ALTER TABLE tasks ADD PRIMARY KEY(id);

-- 8
  --i
ALTER TABLE tasks DROP COLUMN completed;

  --ii
ALTER TABLE tasks ADD COLUMN completed_at timestamp NULL DEFAULT NULL;

  --iii
/*ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL, DEFAULT now();*/
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT now();



  --iv
INSERT INTO tasks (id, title, description, created_at, updated_at, completed_at)
  VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', DEFAULT, DEFAULT, DEFAULT);

  --v
INSERT INTO tasks (title, description)
  VALUES ('Study PostgreSQL', 'Read all the documentation');

  --vi
SELECT title
  FROM tasks
  WHERE completed_at = NULL;

  --vii
UPDATE tasks SET completed_at = NULL
  WHERE title = 'Study SQL';

  --viii
SELECT title, description
  FROM tasks
  WHERE completed_at = NULL;

  --ix
SELECT *
  FROM tasks
  ORDER BY created_at DESC;

  --x
INSERT INTO tasks (title, description)
  VALUES ('mistake 1', 'a test entry');

  --xi
INSERT INTO tasks (title, description)
  VALUES ('mistake 2', 'another test entry');

  --xii
INSERT INTO tasks (title, description)
  VALUES ('third mistake', 'another test entry');

  --xiii
SELECT title
  FROM tasks
  WHERE title LIKE '%mistake%';

  --xiv
DELETE FROM tasks
  WHERE title = 'mistake 1';

  --xv
SELECT title, description
  FROM tasks
    WHERE title LIKE '%mistake%';

  --xvi
DELETE FROM tasks
  WHERE title = '%mistake%';

  --xvii
SELECT *
  FROM tasks
  ORDER BY title ASC;

\c andy;