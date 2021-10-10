create or replace view get_hotel as 
	select h.id, h.name, h.stars, h.position_lat, h.position_lon, hn.area, f.furniture_type, p.plumbing_type, p.producer, e.eating_type from hotels h 
		join hotel_numbers hn on h.id = hn.hotel_id 
		join furniture_room_relation frn on frn.hotel_number_id = hn.id 
		join furnitures f on f.id = frn.id 
		join plumbing_room_relation prm on prm.hotel_number_id = hn.id 
		join plumbings p on p.id = prm.plumbing_id 
		join eating_hotel_relation ehr on ehr.hotel_id = h.id
		join eatings e on e.id = ehr.eating_id;
		
	
create or replace view get_hotel_rooms_photos as
	select h.id as hotel_id, h.name, h.floors, h.is_road_nearly, h.position_lat,
		h.position_lon, h.stars, h.max_amount_living, h.has_pool,
		hn.room_floor, hn.area, hn.id as hotel_numbers_id, hn.room_count, 
		hn.has_conditioner, hn.has_balcony, hn.window_view, hn.wifi,
		hn.accept_childs, hn.accepts_animals, hn.accepts_smokers, hp.media_url from hotels h 
			join hotel_numbers hn on hn.hotel_id = h.id 
			join hotel_photos hp on hp.hotel_id = h.id;