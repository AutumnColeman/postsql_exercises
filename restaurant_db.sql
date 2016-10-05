CREATE DATABASE restaurant_db;
CREATE TABLE restaurant (
  id serial primary key,
  name varchar,
  distance integer,
  stars integer,
  category varchar,
  favorite_dish varchar,
  takeout boolean,
  last_visit date
);
 \d restaurant

-- insert statements into table
insert into restaurant values
(default, 'Vortex', 6.5, 4, 'American', 'Holy Guacamole Burger', TRUE, '2016-09-29');

insert into restaurant values
(default, 'Shoya Izakaya', 7.5, 4, 'Japanese', 'Tonkatsu Ramen', TRUE, '2016-08-20');

insert into restaurant values
(default, 'Cafe Alsace', 8.5, 5, 'French', 'Spaetzle Aux Champignons', TRUE, '2015-11-18');

insert into restaurant values
(default, 'Hong Kong Bakery', 5.7, 5, 'Chinese', 'Cha Siu Bao', TRUE, '2016-05-18');

-- Writing queries
select * from restaurant where stars = 5;
select favorite_dish from restaurant where stars = 5;
select id from restaurant where name = 'Vortex';
select name from restaurant where category = 'BBQ';
select name from restaurant where takeout = FALSE;
select name from restaurant where category = 'BBQ' and takeout = TRUE;
select name from restaurant where distance < 2;
select name from restaurant where last_visit > '2016-09-27';
select name from restaurant where last_visit > '2016-09-27' and stars = 5;
