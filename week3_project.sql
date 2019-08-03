-- | MSDS Summer Bridge | SQL Final Project | 
-- ------------------------------------------------
-- Building a Relational Database Management System --

-- Step 1: Create and use the Data base "roomaccess":

drop schema if exists roomaccesskey;
create schema roomaccesskey;
use roomaccesskey;
select database(); -- to verify the name of the currently connected database

-- Step 2: Create Tables 

DROP TABLE IF EXISTS grps; -- "grps" for groups, Groups was not accepted, it is a reserved keyword in MySQL
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS grouprooms;

-- Step 3: create tables
-- ----------------------
-- Create Groups Tables: 
CREATE TABLE grps
(
  GroupId int PRIMARY KEY,
  GroupName varchar(50) NOT NULL
);

-- Insert records into the Groups table
INSERT INTO grps (groupid, groupName) VALUES (1, 'IT.');
INSERT INTO grps (groupid, groupName) VALUES (2, 'Sales');
INSERT INTO grps (groupid, groupName) VALUES (3, 'Administration');
INSERT INTO grps (groupid, groupName) VALUES (4, 'Operations');

-- Create users Tables:
CREATE TABLE users
(
  UserId int PRIMARY KEY,
  UserName varchar(50) NOT NULL,
  GroupId int references grps(groupid)
);

-- Insert records into the users table

INSERT INTO users (userid, username, groupid) VALUES (1, 'Modesto', 1);
INSERT INTO users (userid, username, groupid) VALUES (2, 'Ayine', 1);

INSERT INTO users (userid, username, groupid) VALUES (3, 'Christopher', 2);
INSERT INTO users (userid, username, groupid) VALUES (4, 'Cheong woo', 2);

INSERT INTO users (userid, username, groupid) VALUES (5, 'Saulat', 3);
INSERT INTO users (userid, username, groupid) VALUES (6, 'Heidy', null); -- Heidy has not yet been assigned to any group

-- Create rooms

CREATE TABLE rooms
(
  RoomId int PRIMARY KEY,
  RoomName varchar(50) NOT NULL
);

-- Insert records into the rooms table

INSERT INTO rooms (roomid, roomname) VALUES (1, '101');
INSERT INTO rooms (roomid, roomname) VALUES (2, '102');
INSERT INTO rooms (roomid, roomname) VALUES (3, 'Auditorium A');
INSERT INTO rooms (roomid, roomname) VALUES (4, 'Auditorium B');

-- Create the Group Rooms

CREATE TABLE GroupRooms
(
  groupid int references grps(groupid),
  roomid int references rooms(roomid)
);

-- Insert records into the Group Rooms table

INSERT INTO GroupRooms (groupid, roomid) VALUES (1, 1);
INSERT INTO GroupRooms (groupid, roomid) VALUES (1, 2);

INSERT INTO GroupRooms (groupid, roomid) VALUES (2, 2);
INSERT INTO GroupRooms (groupid, roomid) VALUES (2, 3);

-- write SELECT statements that provide information about all groups, and the users in each group. A group should appear even if there are no users assigned to the group.
-- A left Join will be used in this case :
Select a.*, b.UserName, b.userId from grps as a
left join users as b on a.groupId = b.groupId;

-- write SELECT statements that provide information about all rooms, and the groups assigned to each room.  The rooms should appear even if no groups have been assigned to them.
-- Note : In this statment i got an error message "MySQL Workbench reports “is not valid at this position for this server version” the error was resolved by adding the table name "roomaccesskey"

Select a.*, c.GroupName from roomaccesskey.rooms as a
left join roomaccesskey.GroupRooms as b on a.RoomId = b.roomid
left join roomaccesskey.grps as c on b.groupId = c.groupId ;

-- Write SELECT statements that provide a list of users, the groups that they belong to, and the rooms to which they are assigned.  This should be sorted alphabetically by user, then by group, then by room

Select a.UserId, a.UserName, b.GroupName, d.RoomName from users as a
left join grps as b on a.GroupId = b.GroupId
left join GroupRooms as c on b.GroupId = c.groupid
left join rooms as d on c.roomid = d.RoomId
order by a.UserName, b.GroupName, d.RoomName;