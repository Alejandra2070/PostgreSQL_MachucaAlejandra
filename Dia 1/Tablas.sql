create table fabricante(
	codigo_fabricante int primary key not null,
	nombre varchar(255)
);

create table producto(
	codigo_producto int primary key not null,
	nombre varchar(255),
	precio double precision,
	codigo_fabricante int,
	constraint codigo_fabricante foreign key(codigo_fabricante) references fabricante(codigo_fabricante)
);
