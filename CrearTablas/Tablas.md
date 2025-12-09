# IDKBBDD

## Tabla de Películas (peliculas)
1. Creación de la Tabla (schema-peliculas.sql)
Para crear una tabla se utiliza la sentencia CREATE TABLE. Debemos elegir tipos de datos adecuados. Usaremos INTEGER PRIMARY KEY para la clave principal, TEXT para cadenas de texto, y REAL para la calificación.

SQL

-- schema-peliculas.sql

```
CREATE TABLE peliculas (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    director TEXT,
    year INTEGER,
    rating REAL
);
```

INTEGER PRIMARY KEY: Define id como un número entero y la clave primaria. En SQLite, esto también lo convierte en un alias de la ROWID, haciéndolo automáticamente autoincremental si no se proporciona un valor.

TEXT NOT NULL: Asegura que el título siempre tenga un valor.

REAL: Se usa para números con decimales, ideal para la calificación.

## 2. Inserción de Registros (insert-peliculas.sql)
Para agregar datos se usa la sentencia INSERT INTO.

SQL

-- insert-peliculas.sql
```
INSERT INTO peliculas (title, director, year, rating) VALUES
('Pulp Fiction', 'Quentin Tarantino', 1994, 8.9),
('The Dark Knight', 'Christopher Nolan', 2008, 9.0),
('Inception', 'Christopher Nolan', 2010, 8.8),
('Forrest Gump', 'Robert Zemeckis', 1994, 8.8),
('Parasite', 'Bong Joon-ho', 2019, 8.6),
('Interstellar', 'Christopher Nolan', 2014, 8.6); -- Un registro extra por si acaso
```
## 3. Consulta de Todos los Registros (query-peliculas-all.sql)
Para consultar todos los datos de una tabla, se usa SELECT * FROM.

SQL

-- query-peliculas-all.sql
```
SELECT * FROM peliculas;
```
## 4. Consulta por Año Específico (query-peliculas-year.sql)
Para aplicar un filtro a la consulta, se utiliza la cláusula WHERE. Elegiremos, por ejemplo, el año 1994.

SQL

-- query-peliculas-year.sql
```
SELECT * FROM peliculas
WHERE year = 1994;
´´´
