create table ejemplo(
	id serial primary key,
	nombre varchar(100) not null,
	descripcion text,
	precio numeric(10, 2) not null,
	disponible boolean default false,
	fecha_creacion date not null,
	hora_creacion time not null,
	fecha_hora timestamp not null,
	fecha_zona timestamp with time zone, --hora y fecha con una zona horaria
	duracion interval,
	ip inet,
	mac macaddr,
	punto_geo point,
	datos_json json,
	unico uuid,
	moneda money,
	rangos int4range,
	colores varchar(20)[],
	sexo_seleccionado sexo
);
drop table usuarios;
create table usuarios(
	id uuid not null default gen_random_uuid(), --genera un uuid diferente para cada insert
	nombre varchar(100) not null,
	apellido varchar(100) not null,
	email varchar(100) not null,
	ip inet,
	ciudad varchar(100) not null,
	blog varchar(100) not null,
	constrasena varchar(100) not null,
	siguiendo int not null,
	seguidores int not null
);

select id, nombre, constrasena, ip from usuarios where ciudad = 'Colombia';

create type sexo as enum('Masculino', 'Femenino', 'Otro');

insert into ejemplo values(1, 'Adrian', 'description', 10.23, true, '2025-02-23', '13:10:50', '2025-02-23 13:10:50', '2025-02-23 13:10:50+05', '1 day', 
'192.138.1.1', '80:00:12:23:10:00', '(10, 20)', '{"key": "value"}', 'f66c844a-fd5b-48c3-8c46-735e41b0a2e6', '15.23', '[10, 20)', 
array['rojo', 'verde', 'azul', 'amarillo'], 'Masculino');

select * from ejemplo;