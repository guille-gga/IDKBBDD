-- SELECT * FROM posts WHERE user_id = (SELECT id FROM users WHERE name = 'admin');

-- SELECT users.name, posts.message, posts.created_at
-- FROM users
-- JOIN posts ON users.id = posts.user_id;

-- Podemos hacer lo mismo usando JOIN desde la otra tabla
SELECT users.name AS nombre, posts.message AS mensaje, posts.created_at AS fecha_creacion
FROM posts
RIGHT JOIN users ON posts.user_id = users.id;
