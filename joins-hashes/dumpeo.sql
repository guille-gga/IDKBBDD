PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    age INTEGER CHECK(age >= 18),
    salary REAL
);
INSERT INTO users VALUES(1,'admin','adminpass','admin@gmail.com',24,5000.0);
INSERT INTO users VALUES(2,'user0','user0pass','user0@gmail.com',20,1000.0);
INSERT INTO users VALUES(3,'user1','user1pass','user1@gmail.com',21,500.0);
INSERT INTO users VALUES(4,'user2','user2pass','user2@gmail.com',32,NULL);
INSERT INTO users VALUES(5,'user3','user3pass','user3@gmail.com',67,NULL);
CREATE TABLE posts(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    message TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);
INSERT INTO posts VALUES(1,1,'Hola, soy el admin!','2025-11-20 08:40:20');
INSERT INTO posts VALUES(2,2,'este es mi primer post!','2025-11-20 08:40:20');
INSERT INTO posts VALUES(3,3,'Holaaaaaa','2025-11-20 08:40:20');
INSERT INTO posts VALUES(4,1,'Recordatorio: La reunión es mañana a las 10 AM.','2025-11-20 08:40:20');
INSERT INTO posts VALUES(5,2,'okkkkk, gracias por el aviso.','2025-11-20 08:40:20');
INSERT INTO posts VALUES(6,1,'otro mensaje','2025-11-20 09:12:40');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('users',5);
INSERT INTO sqlite_sequence VALUES('posts',6);
CREATE VIEW users_messages AS
SELECT users.name AS nombre, posts.message AS mensaje, posts.created_at AS fecha_creacion
FROM posts
JOIN users ON posts.user_id = users.id;
COMMIT;
