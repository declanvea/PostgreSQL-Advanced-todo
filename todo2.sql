DROP TABLE todos;

CREATE TABLE todos(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  details VARCHAR(999999) NULL,
  priority INTEGER NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT NOW(),
  completed_at TIMESTAMP NULL
);

INSERT INTO todos (title, details, priority, created_at, completed_at)
VALUES
('Matt', 'Get dog food', 10,NOW(), NOW()),
('Donuts', 'Go to Jacks Donuts', 9,'2016-04-04', '2017-03-03'),
('Cook', 'Make meals for the week', 4,'2015-03-03', '2017-03-03');

INSERT INTO todos (title, details, priority, completed_at)
VALUES
('Jon', 'Prepare crockpot for the big Arsenal match Saturday morning', 4, NULL),
('Chelsea', 'Fill car gas tank up before road trip', 10, NULL),
('Adam', 'Go to grocery', 10, NULL),
('Sam', 'Eat lots of flamming hot cheetos', 1, NULL),
('Lake', 'Go to the lake', 1, NULL),
('Run', 'Go for a run', 10, NULL),
('Workout', 'Eh...', 10, NULL);

INSERT INTO todos (title, details, priority, created_at)
VALUES
('Apple', 'Ruin the world', 3, '1975-01-01'),
('Uber', 'Be the Uber of NetJets', 2, '2011-01-02'),
('Amazon', 'Buy the world', 1, NOW()),
('Keith', 'Eat pizza', 1, NOW()),
('Molly', 'Walk the dog', 2, '2017-04-03');

INSERT INTO todos (title, details, priority)
VALUES
('Keegan', 'Play golf', 3),
('Jacob', 'Make beer', 8),
('Arlo', 'Chew on a stick (dog)', 1),
('Clubs', 'Clean golf clubs', 3),
('Jobs', 'Find Steve Jobs, alternatively just find a job', 1);

-- Write INSERT statements to insert 20 todos into the todos table, with a combination of priorities, created times, and completed times, with not all having a completed time.
--Complete
SELECT * FROM todos;

-- -- Write a SELECT statement to find all incomplete todos with priority 3.
-- --Complete
SELECT * FROM todos WHERE completed_at IS NULL AND priority = 3;

-- Write a SELECT statement to find the number of incomplete todos by priority.
SELECT COUNT(id), priority
  FROM todos
  WHERE completed_at IS NULL
  GROUP BY priority;

-- -- Write a SELECT statement to find the number of todos by priority created in the last 30 days.
-- --Complete
SELECT COUNT(id), priority
  FROM todos
  WHERE created_at > '2017-07-29'
  AND created_at < NOW()
  GROUP BY priority;
--
-- -- Write a SELECT statement to find the next todo you should work on. This is the todo with the highest priority that was created first.
-- --Complete
SELECT title, details, priority
FROM todos
WHERE completed_at IS NULL
ORDER BY priority, created_at
