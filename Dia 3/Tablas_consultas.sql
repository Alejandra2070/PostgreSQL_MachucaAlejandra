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
	email varchar(100) not null unique,
	ip inet,
	ciudad varchar(100) not null,
	blog varchar(100) not null,
	username varchar(100) not null,
	siguiendo int not null,
	seguidores int not null
);

alter table credenciales add primary key(username);

alter table usuarios add constraint fk_username foreign key(username) references credenciales(username);

--Día 3
insert into credenciales(username, password, user_rol)
select username, 'password' as passsword, 'usuario' as rol from usuarios;

create table credenciales(
	username varchar(100),
	password text not null,
	user_rol rol not null
);

select * from credenciales;

alter table credenciales add column password_sha bytea null;
update credenciales set password_sha = sha512(password::bytea) where username = 'brush99';
select * from credenciales where username = 'brush99';
update credenciales set password_sha = sha512(password::bytea);

select * from credenciales where sha512('336ek1yfnfehc') = password_sha and username = 'brush99';


select sha512(password::bytea), username from credenciales;

update credenciales set password = sha512(generate_random_password1(12)) where username = 'brush99'; --  actualizar por medio de una funcion
update credenciales set password = generate_random_password1(12); -- where username = 'brush99' actualizar por medio de una funcion


create table integrante(
	id serial primary key,
	nombre varchar(30) not null,
	edad smallint not null check(edad > 9)
);

alter table integrante add constraint check_edad check(edad > 9);

insert into integrante(nombre, edad) values('rafael', 11); 
insert into integrante(nombre, edad) values('pedrito', 8);

select * from integrante;

select string_agg(substring('0123456789abcdefghijklmnopqrstuvwxyz$.!', round(random() * length('0123456789abcdefghijklmnopqrstuvwxyz$.!'))::integer, 1), '') as newPassword
from generate_series(5, 10);

select generate_series(1, 10);

-- Funcion

-- retorna una tabla
drop function generate_random_password;
create function generate_random_password(long integer)
returns table(password text) as $$
begin
	return query select string_agg(substring('0123456789abcdefghijklmnopqrstuvwxyz$.!', round(random() * length('0123456789abcdefghijklmnopqrstuvwxyz$.!'))::integer, 1), '') as newPassword
	from generate_series(0, long);
end;
$$ language plpgsql;

select generate_random_password(3);
--

-- retorna text
create function generate_random_password1(long integer)
returns text as $$
begin
	return (select string_agg(substring('0123456789abcdefghijklmnopqrstuvwxyz$.!', round(random() * length('0123456789abcdefghijklmnopqrstuvwxyz$.!'))::integer, 1), '') as newPassword
	from generate_series(0, long));
end;
$$ language plpgsql;
--

-- retornar text pero de una variable
drop function generate_random_password2;
create function generate_random_password2(long integer)
returns text as $$ declare rec text;
begin
	rec= (select string_agg(substring('0123456789abcdefghijklmnopqrstuvwxyz$.!', round(random() * length('0123456789abcdefghijklmnopqrstuvwxyz$.!'))::integer, 1), '') as newPassword
	from generate_series(0, long));
	return rec;
end;
$$ language plpgsql;

select generate_random_password2(3);
--

--
create function sumar(n1 integer, n2 integer)
returns integer as $$
begin
	return n1 + n2;
end;
$$ language plpgsql;

select sumar(10, 5);
--

create type rol as enum('usuario', 'admin');

-- hasta aquí

select id, nombre, constrasena, ip from usuarios where ciudad = 'Colombia';

create type sexo as enum('Masculino', 'Femenino', 'Otro');

insert into ejemplo values(1, 'Adrian', 'description', 10.23, true, '2025-02-23', '13:10:50', '2025-02-23 13:10:50', '2025-02-23 13:10:50+05', '1 day', 
'192.138.1.1', '80:00:12:23:10:00', '(10, 20)', '{"key": "value"}', 'f66c844a-fd5b-48c3-8c46-735e41b0a2e6', '15.23', '[10, 20)', 
array['rojo', 'verde', 'azul', 'amarillo'], 'Masculino');

select * from ejemplo;