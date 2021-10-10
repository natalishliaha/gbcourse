drop table if exists logs;

create table logs(
	id SERIAL,
	record_date date,
	name VARCHAR(255),
	record_id integer,
	name_value VARCHAR(255)
) ENGINE=Archive;

drop trigger if exists ppp;
drop trigger if exists sss;
drop trigger if exists ddd;

DELIMITER //
CREATE trigger ppp after insert on products
FOR EACH ROW
begin 
	insert into logs(record_date, name,record_id,name_value) values (current_date(), 'products', new.id, new.name );
		
end//

CREATE trigger sss after insert on users
FOR EACH ROW
begin 
	insert into logs(record_date,name,record_id,name_value) values (current_date(), 'users', new.id, new.name); 
		
	
end//

CREATE trigger ddd after insert on catalogs
FOR EACH ROW
begin 
	insert into logs(record_date,name,record_id,name_value) values (current_date(), 'catalogs', new.id, new.name);
	
end//

DELIMITER ;
