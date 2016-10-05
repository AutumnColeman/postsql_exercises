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

insert into restaurant values
(default, 'Oriental Pearl', 6, 4, 'Chinese', 'Jiaozi', TRUE, '2016-06-06');

insert into restaurant values
(default, 'Xela Pan', 5, 4, 'Guatemalan', 'Garnachas', TRUE, '2016-10-02');


-- Writing queries

--The names of the restaurants that you gave a 5 stars to
select * from restaurant where stars = 5;

--The favorite dishes of all 5-star restaurants
select favorite_dish from restaurant where stars = 5;

--The the id of a restaurant by a specific restaurant name
select id from restaurant where name = 'Vortex';

--restaurants in the category of 'BBQ'
select name from restaurant where category = 'BBQ';

--restaurants that do take out
select name from restaurant where takeout = FALSE;

--restaurants that do take out and is in the category of 'BBQ'
select name from restaurant where category = 'BBQ' and takeout = TRUE;

--restaurants within 2 miles
select name from restaurant where distance < 2;

--restaurants you haven't eaten at in the last week
select name from restaurant where last_visit >= '2016-09-27';

--restaurants you haven't eaten at in the last week and has 5 stars
select name from restaurant where last_visit >= '2016-09-27' and stars = 5;

--restaurants you haven't eaten at in the last 2 weeks and has at least 4 stars when the date is not defined
select * from restaurant where last_visit >= current_date - interval '1 week' and stars >= 4;

--list restaurants by the closest distance.
select * from restaurant order by distance;

--list the top 2 restaurants by distance.
select * from restaurant order by distance limit 2;

--list the top 2 restaurants by stars.
select * from restaurant order by stars desc limit 2;

--list the top 2 restaurants by stars where the distance is less than 6 miles.
select * from restaurant where distance < 6 order by stars desc limit 2;

--count the number of restaurants in the db.
select count(*) from restaurant;

--count the number of restaurants by category.
select category, count(*) from restaurant group by category;

--get the average stars per restaurant by category.
select category, round(avg(stars), 2) from restaurant group by category;

--get the max stars of a restaurant by category.
select category, round(max(stars)) from restaurant group by category;
