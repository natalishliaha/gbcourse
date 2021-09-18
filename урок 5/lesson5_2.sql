select avg(timestampdiff(year, birthday_at, now())) from users; 

select dayofweek(date_add(birthday_at, interval(year(now()) - year(birthday_at)) year)) as day_week, 
	   count(*) as `count` 
from users group by day_week;