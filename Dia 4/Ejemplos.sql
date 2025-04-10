--
create view stock_product_range as
select sum(stock_price) as stock_price, sum(stock) as stock, stockmin, stockmax, name from full_order_info group by name, stockmin, stockmax;

select * from stock_product_range;
--

--
 create view stock_product as
 select sum(stock_price * stock) as ammount_stock, name from full_order_info group by name;

select * from stock_product where name = 'Webcam';

-- drop view stock_product; eliminar vista

--

--
drop materialized view stock_avg;
refresh materialized view stock_avg;
create materialized view stock_avg as
select sum(stock_price) as stock_price, sum(stock) as stock, stockmin, stockmax, name from full_order_info group by name, stockmin, stockmax;

select * from stock_avg;
--

--
select u.id, u.first_name, o.orderdate from users u 
left join orders o on u.id = o.user_id;
--

--
select u.id, u.first_name, o.orderdate from users u 
right outer join orders o on u.id = o.user_id;
--

--
select u.id, u.first_name, o.orderdate from users u 
left outer join orders o on u.id = o.user_id 
where o.id is null;
--

--
select u.id, u.first_name, o.id, o.orderdate, od.product_id, od.quantity, od.price, p.name
from users u 
right join orders o on u.id = o.user_id
left join order_details od on o.id = od.order_id
left join products p on od.product_id = p.id;
--

--
create view order_details_view as
select u.id as user_id, u.first_name, o.id as order_id, o.orderdate, od.product_id, od.quantity, od.price, p.name
from users u 
right join orders o on u.id = o.user_id
left join order_details od on o.id = od.order_id
left join products p on od.product_id = p.id;
--

--

create or replace procedure total_amount(p_id_user varchar(20))
language plpgsql 
as $$
	declare 
		total numeric;
	begin
		select sum(quantity::numeric * price::numeric)
		into total
		from order_details_view
		where user_id = p_id_user;

		raise notice 'El total de $ gastado % es %',p_id_user, total;
	end;
$$;

call total_amount('00005');
--