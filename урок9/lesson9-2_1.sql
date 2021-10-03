drop function if exists hello;

DELIMITER //

CREATE FUNCTION hello ()
RETURNS TEXT DETERMINISTIC
begin
	select hour(NOW()) into @now;
	if (@now>=0 and @now <6) then 
		return 'доброй ночи';
	end if ;
    if (@now>=6 and @now <12) then 
    	return 'доброе утро';
    end if ;	
    if (@now>=12 and @now <18) then 
  		return 'добрый день';
  	end if ;	
  	if (@now>=18 ) then 
  		return 'добрый вечер';
  	end if ;
end //

DELIMITER ;

select hello();