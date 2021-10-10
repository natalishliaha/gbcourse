select name from (
	select h.id, h.name, h.stars, h.position_lat, h.position_lon, hn.area, f.furniture_type, p.plumbing_type, p.producer, e.eating_type from hotels h 
		join hotel_numbers hn on h.id = hn.hotel_id 
		join furniture_room_relation frn on frn.hotel_number_id = hn.id 
		join furnitures f on f.id = frn.id 
		join plumbing_room_relation prm on prm.hotel_number_id = hn.id 
		join plumbings p on p.id = prm.plumbing_id 
		join eating_hotel_relation ehr on ehr.hotel_id = h.id
		join eatings e on e.id = ehr.eating_id
		where h.stars >= 4 and h.position_lat >= 10 and h.position_lat <= 30 and h.position_lon >= 19 and h.position_lon <= 30
			and hn.area >= 50 and (f.furniture_type = 'sofa' or f.furniture_type = 'kitchen')
) as T group by name;