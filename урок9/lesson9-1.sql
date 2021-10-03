START transaction;
SELECT @id := id,@name := name ,birthday_at,created_at,updated_at FROM shop.users WHERE id = 1;
insert into sample.users (id,name) values (@id,@name);
commit;

create or replace VIEW cat AS SELECT p.name as product_name, s.name as catalog_name FROM products p
	join catalogs s on catalog_id= s.id;
