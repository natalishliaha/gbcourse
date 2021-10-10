drop trigger if exists log_hotels;
drop trigger if exists log_hotel_numbers;
drop trigger if exists log_hotel_photos;

DELIMITER //

CREATE trigger log_hotels after insert on hotels
FOR EACH ROW
begin 
	insert into logs(record_date, table_name, record_id) values (current_date(), 'hotels', new.id);
		
end//

CREATE trigger log_hotel_numbers after insert on hotel_numbers
FOR EACH ROW
begin 
	insert into logs(record_date, table_name, record_id) values (current_date(), 'hotel_numbers', new.id); 
		
	
end//

CREATE trigger log_hotel_photos after insert on hotel_photos
FOR EACH ROW
begin 
	insert into logs(record_date, table_name, record_id) values (current_date(), 'hotel_photos', new.id);
	
end//

DELIMITER ;

