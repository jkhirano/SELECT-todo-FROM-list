-- 1
DROP TABLE IF EXISTS tasks;

-- 2, 3
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title varchar(255) NOT NULL,
    description text,
    created_at timestamp NOT NULL,
    updated_at timestamp NOT NULL,
    completed boolean NOT NULL NOT NULL
);

-- 4, 5
ALTER TABLE tasks
DROP COLUMN completed;

-- 6
ALTER TABLE tasks
ADD COLUMN completed_at timestamp;

ALTER TABLE tasks
ALTER COLUMN completed_at SET DEFAULT NULL;

-- 7
ALTER TABLE tasks
ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at SET DEFAULT now();

-- 8
INSERT INTO tasks
VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

-- 9
INSERT INTO tasks
VALUES (DEFAULT, 'Study PostgreSQL', 'Read all the documentation', now(), now(), NULL);

-- 10
SELECT title FROM tasks
WHERE completed_at IS NULL;

-- 11
UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

-- 12
SELECT title, description FROM tasks
WHERE completed_at IS NULL;
-- SELECT * FROM tasks;

-- 13
SELECT * FROM tasks
ORDER BY created_at DESC;

-- 14
INSERT INTO tasks
VALUES (DEFAULT, 'mistake 1', 'a test entry', now(), now(), NULL);

-- 15
INSERT INTO tasks
VALUES (DEFAULT, 'mistake 2', 'another test entry', now(), now(), NULL);

-- 16
INSERT INTO tasks
VALUES (DEFAULT, 'third mistake', 'another test entry', now(), now(), NULL);

-- 17
SELECT * FROM tasks
WHERE title LIKE '%mistake%'; 

-- 18
DELETE FROM tasks
WHERE title = 'mistake 1';

-- 19
SELECT title, description FROM tasks
WHERE title LIKE '%mistake%';

-- 20
DELETE FROM tasks
WHERE title LIKE '%mistake%';

-- 21
SELECT * FROM tasks
ORDER BY title ASC;