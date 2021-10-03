drop database if exists booking;
CREATE DATABASE booking;
use booking;

drop table if exists hotels;
create table hotels (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	name TEXT not null,
	floors INT unsigned not null,
	is_road_nearly BOOLEAN not null,
	position_lat FLOAT not null,
	position_lon FLOAT not null,
	stars INT unsigned not null,
	max_amount_living INT UNSIGNED not null,
	has_pool BOOLEAN not null,
	
	INDEX position_idx(position_lat, position_lon)
);

drop table if exists hotel_photos;
create table hotel_photos (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	media_url TEXT not null,
	hotel_id BIGINT UNSIGNED NOT null,
	
	foreign key (hotel_id) references hotels(id) on delete cascade
);

drop table if exists furnitures;
create table furnitures (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	furniture_type enum('sofa', 'single bed', 'double bed', 'two-tiered bed',
						'TV', 'DVD', 'refregerator', 'kitchen') not null
);

drop table if exists plumbings;
create table plumbings (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	plumbing_type enum('toilet', 'shower', 'bath') not null,
	producer text not null
);

drop table if exists eatings;
create table eatings (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	eating_type enum('breakfast', 'dinner', 'supper',
					 'order_room') not null
);

drop table if exists hotel_numbers;
create table hotel_numbers (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	room_floor INT unsigned not null,
	area FLOAT not null,
	room_count INT unsigned not null,
	has_conditioner BOOLEAN not null,
	has_balcony BOOLEAN not null,
	window_view TEXT not null,
	wifi enum('free', 'daily_cost') not null,
	accept_childs BOOLEAN not null,
	accepts_animals BOOLEAN not null,
	accepts_smokers BOOLEAN not null,
	hotel_id BIGINT UNSIGNED NOT null,
	
	foreign key (hotel_id) references hotels(id) on delete cascade
);

drop table if exists furniture_room_relation;
create table furniture_room_relation (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	hotel_number_id BIGINT UNSIGNED NOT null,
	furniture_id BIGINT UNSIGNED NOT null,
	
	foreign key (hotel_number_id) references hotel_numbers(id) on delete cascade,
	foreign key (furniture_id) references furnitures(id) on delete cascade
);

drop table if exists plumbing_room_relation;
create table plumbing_room_relation (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	hotel_number_id BIGINT UNSIGNED NOT null,
	plumbing_id BIGINT UNSIGNED NOT null,
	
	foreign key (hotel_number_id) references hotel_numbers(id) on delete cascade,
	foreign key (plumbing_id) references plumbings(id) on delete cascade
);

drop table if exists eating_hotel_relation;
create table eating_hotel_relation (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	hotel_id BIGINT UNSIGNED NOT null,
	eating_id BIGINT UNSIGNED NOT null,
	
	foreign key (hotel_id) references hotels(id) on delete cascade,
	foreign key (eating_id) references eatings(id) on delete cascade
);
