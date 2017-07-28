--1

SELECT * FROM users;
--2
SELECT * FROM posts WHERE users_id = 100;
--3
SELECT posts.*, users.first_name, users.last_name
FROM posts JOIN users ON posts.users_id = users.id
WHERE users_id = 100;
--4
SELECT posts.*, users.username
FROM posts INNER JOIN users ON posts.users_id = users.id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';
--5

SELECT users.username
FROM users
WHERE created_at > '2015-01-01';
--6
SELECT posts.title, posts.content, users.username
FROM posts JOIN users ON posts.users_id = users.id
WHERE posts.created_at > '2015-01-01';
--7
SELECT comments.*, posts.title AS "Post Title"
FROM comments JOIN posts ON comments.users_id = posts.id;

--8

SELECT comments.*, posts.title AS "Post Title", posts.url AS "post_url", comments.body AS "comment_body"
FROM comments JOIN posts ON comments.users_id = posts.id
WHERE posts.created_at < '2015-01-01';

--9

SELECT comments.*, posts.title AS "Post Title", posts.url AS "post_url", comments.body AS "comment_body"
FROM comments JOIN posts ON comments.users_id = posts.id
WHERE posts.created_at < '2015-01-01';

--10

SELECT comments.*, posts.title AS "Post Title", posts.url AS "post_url", comments.body AS "comment_body"
FROM comments JOIN posts ON comments.users_id = posts.id
WHERE comments.body LIKE '%USB%';

--11
SELECT  posts.title AS "Post Title", users.first_name, users.last_name
FROM users INNER JOIN posts ON posts.users_id = users.id
INNER JOIN comments ON comments.posts_id = posts.id
WHERE comments.body LIKE '%matrix%';
COUNT(*);

--12
SELECT  comments.body, users.first_name, users.last_name
FROM users INNER JOIN posts ON posts.users_id = users.id
INNER JOIN comments ON comments.posts_id = posts.id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

--13

SELECT comments.body AS "comment_body", users.first_name AS "post_author_first_name", users.last_name AS "post_author_last_name", posts.title AS "post_title", users.username AS "author_username"
FROM users INNER JOIN posts ON posts.users_id = users.id
INNER JOIN comments ON comments.posts_id = posts.id
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';
