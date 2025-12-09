Para ejecutar estos comandos, puedes usar la línea de comandos de SQLite3.

Bash

# 1. Entra a la interfaz de SQLite3
sqlite3 peliculas.db
Una vez dentro, puedes escribir las sentencias SQL.

## 1. INSERT: Insertar Nuevos Datos
La sentencia INSERT se utiliza para agregar nuevas filas (registros) a una tabla.

Sintaxis General:

SQL

INSERT INTO nombre_tabla (columna1, columna2, ...)
VALUES (valor1, valor2, ...);

Ejemplo: Vamos a insertar una película adicional. Como id es Primary Key y se comporta como autoincremental, no necesitamos especificarlo.

SQL

INSERT INTO peliculas (title, director, year, rating) 
VALUES ('El Viaje de Chihiro', 'Hayao Miyazaki', 2001, 8.6);
## 2. SELECT: Consultar Datos
La sentencia SELECT es la más fundamental y se utiliza para recuperar datos de una o más tablas.

A. Consultar Todos los Datos
Consulta todos los campos (*) de la tabla:

SQL

SELECT * FROM peliculas;
B. Consultar Campos Específicos
Consulta solo el título y el año de las películas:

SQL

SELECT title, year FROM peliculas;
C. Consultar con Filtro (WHERE)
Consulta todas las películas dirigidas por 'Christopher Nolan':

SQL

SELECT * FROM peliculas
WHERE director = 'Christopher Nolan';
D. Consultar con Filtros Múltiples (AND, OR)
Consulta películas con calificación mayor a 8.9 O estrenadas en el año 1994:

SQL

SELECT title, rating, year FROM peliculas
WHERE rating > 8.9 OR year = 1994;
## 3. UPDATE: Modificar Datos Existentes
La sentencia UPDATE se utiliza para cambiar valores en las filas existentes. Es crucial usar la cláusula WHERE para especificar qué filas actualizar; de lo contrario, ¡actualizarás todos los registros de la tabla!

Sintaxis General:

SQL

UPDATE nombre_tabla
SET columna1 = nuevo_valor1, columna2 = nuevo_valor2, ...
WHERE condicion;
Ejemplo: La película 'Inception' fue reevaluada y su calificación subió a 9.1.

SQL

UPDATE peliculas
SET rating = 9.1
WHERE title = 'Inception';

-- Verifica el cambio:
SELECT title, rating FROM peliculas WHERE title = 'Inception';
Ejemplo de actualización masiva: Cambia el año de todas las películas de 1994 a 1995 por un error en el registro (solo para demostrar el UPDATE sin un ID):

SQL

UPDATE peliculas
SET year = 1995
WHERE year = 1994;

-- Verifica el cambio:
SELECT title, year FROM peliculas WHERE year = 1995;
## 4. DELETE: Eliminar Datos
La sentencia DELETE se utiliza para eliminar filas de una tabla. Al igual que UPDATE, siempre debes usar la cláusula WHERE para evitar borrar todos los datos.

Sintaxis General:

SQL

DELETE FROM nombre_tabla
WHERE condicion;
Ejemplo: Queremos eliminar la película 'El Viaje de Chihiro' que acabamos de insertar.

SQL

-- Primero, obtenemos el ID si no lo conocemos (asumiendo que es el ID 7)
SELECT id, title FROM peliculas WHERE title = 'El Viaje de Chihiro';

-- Luego, la eliminamos usando la condición. Usar el ID es la forma más segura.
DELETE FROM peliculas
WHERE title = 'El Viaje de Chihiro';

-- Verifica la eliminación:
SELECT * FROM peliculas;
⚠️ Advertencia de DML: UPDATE y DELETE sin la cláusula WHERE afectan a toda la tabla. Siempre prueba tus sentencias DML con un SELECT primero para asegurarte de que seleccionas los registros correctos.