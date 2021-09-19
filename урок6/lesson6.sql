select from_user_id, to_user_id,count(from_user_id) as c from messages where to_user_id=224 group by from_user_id order by c desc limit 1;

select user_id, id, count(id) from likes where user_id in (
	select user_id from (
		select birthday, user_id, timestampdiff(year, birthday, now()) as age from profiles order by age limit 10) 
	as T
) group by user_id;