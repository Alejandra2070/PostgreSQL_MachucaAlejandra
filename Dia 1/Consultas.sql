-- Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre, precio from producto;

-- Lista todas las columnas de la tabla producto.
select * from producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
select nombre, precio as precio_euros, precio*1.05 as precio_dolares from producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
-- Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
select nombre as nombre_producto, precio as euros, precio*1.05 as dolares from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
select upper(nombre) from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
select lower(nombre), precio from producto;

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select nombre as nombre_fabricante, upper(substring(nombre, 1, 2)) from fabricante;

-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, round(precio) as precio_redondeado from producto;

--Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre, trunc(precio) as precio_truncado from producto;

--Lista el identificador de los fabricantes que tienen productos en la tabla producto.
select f.codigo_fabricante from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante;

--Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
select distinct(f.codigo_fabricante) from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante;

--Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre asc;

-- Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante order by nombre desc;

-- Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre, precio from producto order by nombre asc, precio desc;

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from producto limit 5;

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
select * from fabricante offset 3;

-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio asc limit 1;

-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio desc limit 1;

-- Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
select p.nombre, f.codigo_fabricante from producto p inner join fabricante f on p.codigo_fabricante = f.codigo_fabricante where f.codigo_fabricante = 2;

-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre, precio from producto where precio <= 120;

-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
select nombre, precio from producto where precio >= 400;

-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
select nombre, precio from producto where precio <= 400;

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select * from producto where precio > 80 and precio < 300;

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
select * from producto where precio between 60 and 200;

-- Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
select f.codigo_fabricante, p.* from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante 
where p.precio > 200 and f.codigo_fabricante = 6;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select f.codigo_fabricante, p.* from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante 
where f.codigo_fabricante = 1 or f.codigo_fabricante =  3 or f.codigo_fabricante = 5;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select f.codigo_fabricante, p.* from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante where f.codigo_fabricante in (1,3,5);

-- Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que
-- contiene el precio que se llame céntimos.
select nombre, precio * 100 as céntimos from producto;

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante where nombre like '%S%';

-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from fabricante where nombre like '%e';

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante where nombre like '%w%';

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante where length(nombre) = 4;

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select nombre from producto where nombre like '%Portátil%';

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre, precio from producto where nombre like '%Monitor%' and precio < 215;

-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en
-- orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select precio, nombre from producto where precio >= 180 order by precio desc, nombre asc;

-- Consultas multitabla

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
select p.nombre, p.precio, f.nombre from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado
-- por el nombre del fabricante, por orden alfabético.
select p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante from fabricante f 
inner join producto p on f.codigo_fabricante = p.codigo_fabricante order by f.nombre asc;

-- Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos
-- de la base de datos.
select p.codigo_producto, p.nombre, f.codigo_fabricante, f.nombre from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
select p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante from fabricante f 
inner join producto p on f.codigo_fabricante = p.codigo_fabricante order by p.precio asc limit 1;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
select p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante from fabricante f 
inner join producto p on f.codigo_fabricante = p.codigo_fabricante order by p.precio desc limit 1;

-- Devuelve una lista de todos los productos del fabricante Lenovo.
select f.nombre as nombre_fabricante, p.* from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante where f.nombre = 'Lenovo';

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
select f.nombre as nombre_fabricante, p.* from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante 
where f.nombre = 'Crucial' and p.precio > 200;

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
select f.nombre as nombre_fabricante, p.* from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante 
where f.nombre = 'Asus' or f.nombre = 'Hewlett-Packard' or f.nombre = 'Seagate';

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
select f.nombre as nombre_fabricante, p.* from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante 
where f.nombre in ('Asus', 'Hewlett-Packard', 'Seagate');

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
select p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante from fabricante f 
inner join producto p on f.codigo_fabricante = p.codigo_fabricante where f.nombre like '%e';

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
select p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante from fabricante f 
inner join producto p on f.codigo_fabricante = p.codigo_fabricante where f.nombre like '%w%';

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a
-- 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante from fabricante f 
inner join producto p on f.codigo_fabricante = p.codigo_fabricante where p.precio >= 180 order by p.precio desc, p.nombre asc;

-- Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
select f.codigo_fabricante, f.nombre from fabricante f inner join producto p on f.codigo_fabricante = p.codigo_fabricante;