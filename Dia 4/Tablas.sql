create table full_order_info(
	order_id serial primary key,
	product_id integer not null,
	quantity smallint not null,
	price numeric(10, 2) not null,
	orderdate date not null,
	user_id varchar(10) not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(50) not null,
	last_connection inet,
	website varchar(150) not null,
	name varchar(50) not null,
	description text null,
	stock smallint default 0,
	stock_price numeric(10, 2) not null,
	stockmin smallint default 0,
	stockmax smallint default 0
);

-- alter table full_order_info rename column stockmin to stockmin; -- actualizar el nombre del atributo de una tabla
alter table full_order_info alter column stockmin type integer; -- actualizar el tipo de dato

CREATE TABLE users (
    id varchar(20) primary key,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(50) NOT NULL UNIQUE,
    last_connection inet NOT NULL,
    website varchar(45) NOT NULL
);

CREATE TABLE products (
    id serial primary key,
    name text NOT NULL,
    description TEXT,
    stock integer CHECK (stock > 0),
    price double precision CHECK (price > 0),
    stockmin smallint default 0,
    stockmax smallint default 0
);
drop table orders;
CREATE TABLE orders (
    id serial primary key,
    orderdate date,
    user_id varchar(10) NOT NULL
);

alter table orders 
add constraint user_id_fkey
foreign key (user_id) references users(id);

drop table order_details;
CREATE TABLE order_details (
    id serial primary key,
    order_id integer not null, 
    product_id integer not null,
    quantity smallint not null,
    price numeric(10, 2) not null
);

alter table order_details
add constraint oder_id_fkey
foreign key (order_id) references orders(id);

alter table order_details
add constraint product_id_fkey
foreign key(product_id) references products(id);