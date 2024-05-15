-- TIENDA

-- 1 -Lista el nombre de todos los productos que hay en la mesa "producto".
SELECT nombre FROM producto;
-- 2 - Lista los nombres y precios de todos los productos de la tabla "producto".
SELECT nombre, precio FROM producto;
-- 3 - Lista todas las columnas de la tabla "producto".
SELECT * FROM producto;
-- 4 - Lista el nombre de los "productos", el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio, ROUND(precio * 1.07, 2) FROM producto;
-- 5 - Lista el nombre de los "productos", el precio en euros y el precio en dólares estadounidenses. Utiliza los siguientes sobrenombre para las columnas: nombre de "producto", euros, dólares estadounidenses.
SELECT nombre AS nombre_producto, precio AS precio_en_euros,  ROUND(precio * 1.07, 2) AS precio_en_dolares FROM producto;
-- 6 - Lista los nombres y precios de todos los productos de la tabla "producto", convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio FROM producto;
-- 7 - Lista los nombres y precios de todos los productos de la tabla "producto", convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio FROM producto;
-- 8 - Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT codigo_fabricante, UPPER(SUBSTRING(nombre, 1, 2)) FROM producto;
-- 9 - Lista los nombres y precios de todos los productos de la mesa "producto", redondeando el valor del precio.
SELECT nombre, ROUND (precio) FROM producto;
-- 10 - Lista los nombres y precios de todos los productos de la tabla "producto", truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
-- 11 - Lista el código de los fabricantes que tienen productos en la mesa "producto".
SELECT codigo_fabricante FROM producto;
-- 12 - Lista el código de los fabricantes que tienen productos en la mesa "producto", eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;
-- 13 - Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT * FROM producto ORDER BY codigo_fabricante ASC;
-- 14 - Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT * FROM producto ORDER BY codigo_fabricante DESC;
-- 15 - Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.
SELECT * FROM producto ORDER BY nombre ASC, precio DESC;
-- 16 - Devuelve una lista con las 5 primeras filas de la mesa "fabricante".
SELECT codigo_fabricante FROM producto LIMIT 5;
-- 17 - Devuelve una lista con 2 filas a partir de la cuarta fila de la mesa "fabricante". La cuarta fila también debe incluirse en la respuesta.
SELECT codigo_fabricante FROM producto LIMIT 2 OFFSET 3;
-- 18 - Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MIN(precio), necesitarías GROUP BY
SELECT nombre, precio FROM producto GROUP BY nombre, precio ORDER BY precio ASC LIMIT 1;
-- 19 - Lista el nombre y precio del producto más caro. (Utiliza solamente las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MAX(precio), necesitarías GROUP BY.
SELECT nombre, precio FROM producto GROUP BY nombre, precio ORDER BY precio DESC LIMIT 1;
-- 20 - Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- 21 - Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT nombre, precio, codigo_fabricante FROM producto;
-- 22 - Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT nombre, precio, codigo_fabricante FROM producto ORDER BY nombre ASC;
-- 23 - Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.**
SELECT codigo, nombre, codigo_fabricante FROM producto;
-- 24 - Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT nombre, MIN(precio), codigo_fabricante FROM producto GROUP BY nombre, precio, codigo_fabricante ORDER BY precio LIMIT 1;
-- 25 - Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT nombre, MAX(precio), codigo_fabricante FROM producto GROUP BY nombre, precio, codigo_fabricante ORDER BY precio DESC LIMIT 1;
-- 26 - Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT nombre, codigo, precio, codigo_fabricante FROM producto WHERE codigo_fabricante = '2';
-- 27 - Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT nombre, codigo, precio, codigo_fabricante FROM producto WHERE codigo_fabricante = '6' AND precio > '200';
-- 28 - Devuelve una lista con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT * FROM producto WHERE codigo_fabricante = '1' OR codigo_fabricante = '3' OR codigo_fabricante = '5';
-- 29 - Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Usando el operador IN.
SELECT * FROM producto WHERE codigo_fabricante IN ('1', '3', '5');
-- 30 - Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
SELECT * FROM fabricante WHERE RIGHT(nombre, 1) = 'e';
-- 31 - Devuelve un listado con el nombre y precio de todos los productos de cuyos fabricantes contenga el carácter w en su nombre.
SELECT * FROM fabricante WHERE nombre LIKE '%w%'; 
-- 32 - Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT codigo, precio, codigo_fabricante FROM producto WHERE precio >= '180' ORDER BY precio ASC, codigo_fabricante DESC;
-- 33 - Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT f.codigo, f.nombre, p.codigo_fabricante FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
-- 34 - Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también a aquellos fabricantes que no tienen productos asociados.
SELECT f.codigo, f.nombre, p.codigo_fabricante, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
-- 35 - Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT f.codigo, f.nombre, p.codigo_fabricante FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE codigo_fabricante IS NULL;
-- 36 - Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT f.codigo, p.codigo_fabricante, f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%Lenovo%';
-- 37 - Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

-- 38 - Lista el nombre del producto más caro del fabricante Lenovo.
SELECT f.codigo, p.codigo_fabricante, f.nombre, p.nombre, p.precio FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%Lenovo%' ORDER BY precio ASC LIMIT 1;
-- 39 - Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT f.codigo, p.codigo_fabricante, f.nombre, p.nombre, p.precio FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%Hewlett-Packard%' ORDER BY precio DESC LIMIT 1;
-- 40 - Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

-- 41 - Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.


-- TIENDA

-- 1 -Lista el nombre de todos los productos que hay en la mesa "producto".
SELECT nombre FROM producto;
-- 2 - Lista los nombres y precios de todos los productos de la tabla "producto".
SELECT nombre, precio FROM producto;
-- 3 - Lista todas las columnas de la tabla "producto".
SELECT * FROM producto;
-- 4 - Lista el nombre de los "productos", el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio, ROUND(precio * 1.07, 2) FROM producto;
-- 5 - Lista el nombre de los "productos", el precio en euros y el precio en dólares estadounidenses. Utiliza los siguientes sobrenombre para las columnas: nombre de "producto", euros, dólares estadounidenses.
SELECT nombre AS nombre_producto, precio AS precio_en_euros,  ROUND(precio * 1.07, 2) AS precio_en_dolares FROM producto;
-- 6 - Lista los nombres y precios de todos los productos de la tabla "producto", convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio FROM producto;
-- 7 - Lista los nombres y precios de todos los productos de la tabla "producto", convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio FROM producto;
-- 8 - Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT codigo_fabricante, UPPER(SUBSTRING(nombre, 1, 2)) FROM producto;
-- 9 - Lista los nombres y precios de todos los productos de la mesa "producto", redondeando el valor del precio.
SELECT nombre, ROUND (precio) FROM producto;
-- 10 - Lista los nombres y precios de todos los productos de la tabla "producto", truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
-- 11 - Lista el código de los fabricantes que tienen productos en la mesa "producto".
SELECT codigo_fabricante FROM producto;
-- 12 - Lista el código de los fabricantes que tienen productos en la mesa "producto", eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;
-- 13 - Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT * FROM producto ORDER BY codigo_fabricante ASC;
-- 14 - Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT * FROM producto ORDER BY codigo_fabricante DESC;
-- 15 - Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.
SELECT * FROM producto ORDER BY nombre ASC, precio DESC;
-- 16 - Devuelve una lista con las 5 primeras filas de la mesa "fabricante".
SELECT codigo_fabricante FROM producto LIMIT 5;
-- 17 - Devuelve una lista con 2 filas a partir de la cuarta fila de la mesa "fabricante". La cuarta fila también debe incluirse en la respuesta.
SELECT codigo_fabricante FROM producto LIMIT 2 OFFSET 3;
-- 18 - Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MIN(precio), necesitarías GROUP BY
SELECT nombre, precio FROM producto GROUP BY nombre, precio ORDER BY precio ASC LIMIT 1;
-- 19 - Lista el nombre y precio del producto más caro. (Utiliza solamente las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podrías usar MAX(precio), necesitarías GROUP BY.
SELECT nombre, precio FROM producto GROUP BY nombre, precio ORDER BY precio DESC LIMIT 1;
-- 20 - Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- 21 - Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT nombre, precio, codigo_fabricante FROM producto;
-- 22 - Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT nombre, precio, codigo_fabricante FROM producto ORDER BY nombre ASC;
-- 23 - Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.**
SELECT codigo, nombre, codigo_fabricante FROM producto;
-- 24 - Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT nombre, MIN(precio), codigo_fabricante FROM producto GROUP BY nombre, precio, codigo_fabricante ORDER BY precio LIMIT 1;
-- 25 - Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT nombre, MAX(precio), codigo_fabricante FROM producto GROUP BY nombre, precio, codigo_fabricante ORDER BY precio DESC LIMIT 1;
-- 26 - Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT nombre, codigo, precio, codigo_fabricante FROM producto WHERE codigo_fabricante = '2';
-- 27 - Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT nombre, codigo, precio, codigo_fabricante FROM producto WHERE codigo_fabricante = '6' AND precio > '200';
-- 28 - Devuelve una lista con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT * FROM producto WHERE codigo_fabricante = '1' OR codigo_fabricante = '3' OR codigo_fabricante = '5';
-- 29 - Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Usando el operador IN.
SELECT * FROM producto WHERE codigo_fabricante IN ('1', '3', '5');
-- 30 - Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
SELECT * FROM fabricante WHERE RIGHT(nombre, 1) = 'e';
-- 31 - Devuelve un listado con el nombre y precio de todos los productos de cuyos fabricantes contenga el carácter w en su nombre.
SELECT * FROM fabricante WHERE nombre LIKE '%w%'; 
-- 32 - Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT codigo, precio, codigo_fabricante FROM producto WHERE precio >= '180' ORDER BY precio ASC, codigo_fabricante DESC;
-- 33 - Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT f.codigo, f.nombre, p.codigo_fabricante FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
-- 34 - Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también a aquellos fabricantes que no tienen productos asociados.
SELECT f.codigo, f.nombre, p.codigo_fabricante, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
-- 35 - Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT f.codigo, f.nombre, p.codigo_fabricante FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE codigo_fabricante IS NULL;
-- 36 - Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT f.codigo, p.codigo_fabricante, f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%Lenovo%';
-- 37 - Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

-- 38 - Lista el nombre del producto más caro del fabricante Lenovo.
SELECT f.codigo, p.codigo_fabricante, f.nombre, p.nombre, p.precio FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%Lenovo%' ORDER BY precio ASC LIMIT 1;
-- 39 - Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT f.codigo, p.codigo_fabricante, f.nombre, p.nombre, p.precio FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre LIKE '%Hewlett-Packard%' ORDER BY precio DESC LIMIT 1;
-- 40 - Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

-- 41 - Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.




-- UNIVERSIDAD

-- 1 - Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' GROUP BY apellido1, apellido2, nombre ORDER BY apellido1, apellido2, nombre;
-- 2 - Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT apellido1, apellido2, nombre, tipo, telefono FROM persona WHERE telefono IS NULL AND tipo LIKE 'alumno';
-- 3 - Devuelve el listado de los alumnos/as que nacieron en 1999.
SELECT * FROM persona WHERE fecha_nacimiento LIKE '1999%' AND tipo LIKE 'alumno';
-- 4 - Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF termina en K.
SELECT * FROM persona WHERE telefono IS NULL AND nif LIKE '%K' AND tipo = 'profesor';
-- 5 - Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT * FROM asignatura WHERE cuatrimestre = '1' AND curso = '3' AND id_grado = '7';
-- 6 - Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados/as. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.
SELECT p.apellido1 AS apellido_profesor, p.apellido2 AS segundo_apellido, p.nombre AS nombre_profesor, d.nombre AS nombre_departamento FROM persona p INNER JOIN profesor r ON p.id = r.id_profesor INNER JOIN departamento d ON d.id = r.id_departamento ORDER BY p.apellido1, p.apellido2, p.nombre; 
-- 7 - Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT  a.nombre AS nombre_asignatura, c.anyo_inicio , c.anyo_fin FROM alumno_se_matricula_asignatura b INNER JOIN asignatura a ON a.id = b.id_asignatura INNER JOIN persona p ON p.id = b.id_alumno INNER JOIN curso_escolar c ON c.id = b.id_curso_escolar WHERE p.nif = '26902806M';
-- 8 - Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).






-- 9 - Devuelve un listado con todos los alumnos/as que se han matriculado en alguna asignatura durante el curso escolar 2018/2019. ******
SELECT DISTINCT p.nombre, p.apellido1, c.anyo_inicio FROM alumno_se_matricula_asignatura a INNER JOIN persona p ON p.id = a.id_alumno INNER JOIN curso_escolar c ON c.id = a.id_curso_escolar WHERE c.anyo_inicio > 2017 AND c.anyo_inicio < 2020;
-- -----------------------
-- 1 - Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados/as. El listado también debe mostrar aquellos profesores/as que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y nombre.
SELECT d.nombre AS nombre_departamento, p.apellido1 AS apellido, p.apellido2 AS segundo_apellido, p.nombre FROM persona p LEFT JOIN profesor f ON p.id = f.id_profesor LEFT JOIN departamento d ON d.id = f.id_departamento WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
-- 2 - Devuelve un listado con los profesores/as que no están asociados a un departamento.
SELECT DISTINCT p.apellido1 AS primer_apellido, p.nombre AS nombre, r.id_departamento FROM persona p LEFT JOIN profesor r on r.id_profesor = p.id WHERE p.tipo = 'profesor' AND r.id_departamento IS NULL;
-- Todos los profesores tienen un departamento asociado.
-- 3 - Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT d.id AS id_departamento, d.nombre AS nombre_departamento FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento WHERE p.id_departamento IS NULL;
-- 4 - Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
SELECT q.id AS id_persona, q.nombre AS nombre, q.apellido1 AS apellido, q.apellido2 AS segundo_apellido, p.id_profesor AS id_profesor, a.id_profesor AS id_asignatura_profesor, a.id AS id_asignatura FROM persona q RIGHT JOIN profesor p ON q.id = p.id_profesor LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;
-- 5 - Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
SELECT a.id AS id_asignatura, a.nombre AS nombre_asignatura, p.id_profesor AS id_profesor FROM asignatura a LEFT JOIN profesor p ON a.id = p.id_profesor WHERE p.id_profesor IS NULL;
-- 6 - Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT d.id AS id_departamento, d.nombre AS nombre_departamento, p.id_departamento AS id_departamento, a.id AS id_asignatura, a.id_grado AS id_grado, c.id AS id_curso_escolar FROM departamento d LEFT JOIN profesor p ON d.id = p.id_profesor LEFT JOIN asignatura a ON p.id_profesor = a.id LEFT JOIN curso_escolar c ON a.id = c.id WHERE a.id IS NULL;
-- --------------------
-- 1 - Devuelve el número total de alumnos existentes.
SELECT COUNT(id) AS cantidad_de_alumnos FROM persona WHERE tipo = 'alumno';
-- 2 - Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(id) FROM persona WHERE YEAR(fecha_nacimiento) = 1999 AND tipo = 'alumno';
-- 3 - Calcula cuántos/as profesores/as hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores/as que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores/as asociados y tendrá que estar ordenado de mayor a menor por el número de profesores/as.
SELECT COUNT(p.id_profesor) AS cantidad_de_profesores, d.nombre AS nombre_departamento FROM profesor p INNER JOIN departamento d ON p.id_departamento = d.id GROUP BY d.nombre ORDER BY COUNT(p.id_profesor) DESC;
-- 4 - Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos. Tiene en cuenta que pueden existir departamentos que no tienen profesores/as asociados/as. Estos departamentos también deben aparecer en el listado.
SELECT COUNT(p.id_profesor) AS cantidad_de_profesores, d.nombre AS nombre_departamento FROM profesor p RIGHT JOIN departamento d ON p.id_departamento = d.id GROUP BY d.nombre ORDER BY COUNT(p.id_profesor) DESC;
-- 5 - Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tiene en cuenta que pueden existir grados que carecen de asignaturas asociadas. Estos grados también deben aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT g.nombre AS nombre_grado, COUNT(a.id) AS cantidad_de_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY COUNT(a.id) DESC;
-- 6 - Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT g.nombre AS nombre_grado, COUNT(a.id) AS cantidad_de_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.id) > 40 ORDER BY COUNT(a.id) DESC;
-- 7 - Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos existentes para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que existen de este tipo.
SELECT g.nombre AS nombre_de_grado, a.tipo AS tipo_de_asignatura, SUM(a.creditos) AS suma_asignaturas FROM grado g INNER JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;
-- 8 - Devuelve un listado que muestre cuántos/as alumnos/as se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos/as matriculados/as.
SELECT DISTINCT c.anyo_inicio, COUNT(DISTINCT a.id_alumno) AS alumnos_matriculados FROM curso_escolar c LEFT JOIN alumno_se_matricula_asignatura a ON c.id = a.id_curso_escolar GROUP BY c.anyo_inicio;
-- 9 - Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado debe tener en cuenta a aquellos profesores/as que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT DISTINCT r.id_profesor, p.nombre, p.apellido1 AS primer_apellido, p.apellido2 AS segundo_apellido, COUNT(a.id) AS numero_de_asignaturas FROM profesor r INNER JOIN persona p ON p.id = r.id_profesor LEFT JOIN asignatura a USING (id_profesor) GROUP BY r.id_profesor ORDER BY COUNT(a.id) DESC;
-- 10 - Devuelve todos los datos del alumno más joven.
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
-- 11 - Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT DISTINCT r.id_profesor, p.nombre, p.apellido1, d.nombre AS nombre_departamento, a.id_profesor AS asignaturas_asociadas FROM persona p INNER JOIN profesor r ON p.id = r.id_profesor INNER JOIN departamento d ON d.id = r.id_departamento LEFT JOIN asignatura a USING (id_profesor) WHERE a.id_profesor IS NULL;