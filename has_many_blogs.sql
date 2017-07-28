DROP DATABASE IF EXISTS has_many_blogs;
DROP USER IF EXISTS has_many_user;

CREATE USER has_many_user;

CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

\c has_many_blogs has_many_user;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;


CREATE TABLE users (
  id SERIAL NOT NULL PRIMARY KEY,
  username VARCHAR(90) NOT NULL,
  first_name VARCHAR(90) DEFAULT NULL,
  last_name VARCHAR(90) DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
 );

 CREATE TABLE posts (
   id SERIAL NOT NULL PRIMARY KEY,
   title VARCHAR(180) DEFAULT NULL,
    url VARCHAR(510) DEFAULT NULL,
   content TEXT DEFAULT NULL,
   created_at TIMESTAMP NOT NULL DEFAULT NOW(),
   updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
   users_id INTEGER REFERENCES users(id)
  );

  CREATE TABLE comments (
    id SERIAL NOT NULL PRIMARY KEY,
    body VARCHAR(510) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    users_id INTEGER REFERENCES users(id),
    posts_id INTEGER REFERENCES posts(id)
   );
\i scripts/blog_data.sql;
