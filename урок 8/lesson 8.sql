select from_user_id, to_user_id,count(from_user_id) as c from messages join users on users.id =messages.from_user_id where to_user_id=224 group by from_user_id order by c desc limit 1;

select l.user_id, id, count(id) from likes l join (
	select user_id, age from (
		select birthday, user_id, timestampdiff(year, birthday, now()) as age from profiles) 
	  as T where age < 10
) as TT on l.user_id=TT.user_id group by user_id;

select likes.user_id, id,count(id) from likes  join profiles p on p.user_id=likes.user_id group by p.gender; 