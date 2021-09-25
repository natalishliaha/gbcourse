select id from users where id in (select user_id from (select user_id,vv from (select id,user_id, count(id) as vv from orders group by user_id) as tt where vv >= 1) as ttt);

select p.name,c.name from (products p join catalogs c on p.catalog_id =c.id);