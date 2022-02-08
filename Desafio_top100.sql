--1) Crear base de datos llamada películas en pgAdmin (click derecho/databases/create).
--2) Crear dos tablas (pelicula, reparto) con sus respectivos campos, dentro de la base de datos "peliculas" (peliculas/public/Schemas/tables)

CREATE TABLE peliculas(
    id SERIAL,
    pelicula VARCHAR(80),
    anio_estreno VARCHAR(20),
    director VARCHAR(80),
    PRIMARY KEY(id)
);

CREATE TABLE reparto(
    pelicula_id INT,
    nombre VARCHAR(40),
    FOREiGN KEY (pelicula_id) REFERENCES pelicula(id)
);

--3) Importar archivos .csv a pgAdmin desde las tablas creadas en la base de datos peliculas

--4) Obtener el ID de la película “Titanic”. al ejecutar obtendre el id 2, que equivale a la pelicula titanic

SELECT id FROM pelicula WHERE pelicula = 'Titanic';


--4) Listar a todos los actores que aparecen en la película "Titanic".
SELECT nombre FROM reparto WHERE pelicula_id = 2;

--5) Consultar en cuántas películas del top 100 participa Harrison Ford.
select count(pelicula_id) from reparto where nombre ='Harrison Ford'; 

--6) Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
select pelicula from pelicula where anio_estreno between '1990' and '1999' order by pelicula asc;

--7) Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
select pelicula, length (pelicula) as longitud_titulo from pelicula;

--8) Consultar cual es la longitud más grande entre todos los títulos de las películas.
select max(length (pelicula)) from pelicula;