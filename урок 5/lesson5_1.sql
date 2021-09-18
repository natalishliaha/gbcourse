update users set created_at ='18.09.2021 16:33',
updated_at ='18.09.2021 16:33';

update users set created_at =str_to_date(created_at, "%e.%c.%Y %H:%i"),
updated_at=str_to_date(updated_at, "%e.%c.%Y %H:%i");
alter table users modify created_at datetime default current_timestamp,
modify updated_at datetime default current_timestamp;

select value from storehouses_products order by value = 0, value;
