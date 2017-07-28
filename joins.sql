SELECT * FROM users;

SELECT * FROM posts WHERE users_id = 100;

SELECT posts.*, users.first_name, users.last_name
FROM posts JOIN users ON posts.users_id = users.id
WHERE users_id = 100;

SELECT posts.*, users.username
FROM posts INNER JOIN users ON posts.users_id = users.id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';


SELECT users.username
FROM users
WHERE created_at > '2015-01-01';
