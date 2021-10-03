drop trigger if exists ppp;

DELIMITER //

CREATE trigger ppp before insert on products
FOR EACH ROW
begin 
	if (new.name is null and new.description is null) then 
		SIGNAL SQLSTATE '45004' SET MESSAGE_TEXT = 'description and name are null. Canceled';
	end if;
end//

DELIMITER ;

insert into products (name, description) values (null, null);