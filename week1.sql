-- SQL Bridge Assignment Week 1 | Abdellah Ait Elmouden

--- 1) Which destination in the flights database is the furthest distance away, based on information in the flights table. Show the SQL query(s) that support your conclusion.

select distinct flight, origin, dest, distance 
from flights.flights 
where distance in (select max(distance) from flights.flights) ;

--Result:
-- +--------+--------+------+----------+
-- | flight | origin | dest | distance |
-- +--------+--------+------+----------+
-- |     51 | JFK    | HNL  |     4983 |
-- +--------+--------+------+----------+

-- 2) What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats? Show the SQL statement(s) that support your result.

select engines, max(seats) 
from flights.planes 
group by engines;

-- Result:
-- +---------+------------+
-- | engines | max(seats) |
-- +---------+------------+
-- |       2 |        400 |
-- |       1 |         16 |
-- |       4 |        450 |
-- |       3 |        379 |
-- +---------+------------+

-- 3) Show the total number of flights.

select count(*) from flights;

-- Result:
-- +----------+
-- | count(*) |
-- +----------+
-- |   336776 |
-- +----------+

-- 4) Show the total number of flights by airline (carrier).

select carrier, count(*) 
from flights 
group by carrier;

-- Result:
-- +---------+----------+
-- | carrier | count(*) |
-- +---------+----------+
-- | UA      |    58665 |
-- | AA      |    32729 |
-- | B6      |    54635 |
-- | DL      |    48110 |
-- | EV      |    54173 |
-- | MQ      |    26397 |
-- | US      |    20536 |
-- | WN      |    12275 |
-- | VX      |     5162 |
-- | FL      |     3260 |
-- | AS      |      714 |
-- | 9E      |    18460 |
-- | F9      |      685 |
-- | HA      |      342 |
-- | YV      |      601 |
-- | OO      |       32 |
-- +---------+----------+


-- 5) Show all of the airlines, ordered by number of flights in descending order.

select carrier, count(*) as FlightCount from flights 
group by carrier 
order by FlightCount desc;

-- Result
-- +---------+-------------+
-- | carrier | FlightCount |
-- +---------+-------------+
-- | UA      |       58665 |
-- | B6      |       54635 |
-- | EV      |       54173 |
-- | DL      |       48110 |
-- | AA      |       32729 |
-- | MQ      |       26397 |
-- | US      |       20536 |
-- | 9E      |       18460 |
-- | WN      |       12275 |
-- | VX      |        5162 |
-- | FL      |        3260 |
-- | AS      |         714 |
-- | F9      |         685 |
-- | YV      |         601 |
-- | HA      |         342 |
-- | OO      |          32 |
-- +---------+-------------+


-- 6) Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

select carrier, 
count(*) as FlightCount from flights 
group by carrier 
order by FlightCount desc limit 5;

-- Result
-- +---------+-------------+
-- | carrier | FlightCount |
-- +---------+-------------+
-- | UA      |       58665 |
-- | B6      |       54635 |
-- | EV      |       54173 |
-- | DL      |       48110 |
-- | AA      |       32729 |
-- +---------+-------------+


-- 7) Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.

select carrier, count(*) as FlightCount from flights 
where distance	>=1000 
group by carrier 
order by FlightCount desc limit 5 ;

-- +---------+-------------+
-- | carrier | FlightCount |
-- +---------+-------------+
-- | UA      |       41135 |
-- | B6      |       30022 |
-- | DL      |       28096 |
-- | AA      |       23583 |
-- | EV      |        6248 |
-- +---------+-------------+


-- 8) Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question.

-- Question : Which flight in the flights database consume less fuel per flight, based on information in the flights table. 

--Answer : we can answer the question by selecting the flight that spend the min number of hours.

select distinct flight, origin, dest, hour 
from flights.flights 
where hour in (select min(hour) from flights.flights) ;


-- 
