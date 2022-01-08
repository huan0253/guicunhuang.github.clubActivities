--programmed by Jerry Huang
--July 24-2021

drop view if exists coach_team_v ;
drop view if exists club_v;

DROP TABLE IF EXISTS member_team;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS coaches;
DROP TABLE IF EXISTS clubs;
DROP TAble if EXISTS activities;




CREATE TABLE clubS
(
  id CHAR(20),
  name varchar (30),
  contact_number numeric(20),
  CONSTRAINT pk_clubs PRIMARY KEY (id)
);

CREATE TABLE activities
(
  id CHAR(20),
  name char (30),
  CONSTRAINT pk_activities PRIMARY KEY (id)
);



CREATE TABLE members
(
  id numeric (20),
  full_name char (50),
  email char (50),
  CONSTRAINT pk_members PRIMARY KEY (id)
);

CREATE TABLE coaches
(
  id CHAR(20),
  full_name char (50),
  email CHAR(50),
  CONSTRAINT coaches_pk PRIMARY KEY (id)
);


CREATE TABLE teams
(
  id CHAR(30),
  name CHAR(40) ,
  trainingCourse_fee float,
  coach_id CHAR(20),
  activity_id CHAR(20),
  CONSTRAINT teams_pk PRIMARY KEY (id),
  CONSTRAINT teams_FK1 FOREIGN KEY( coach_id ) REFERENCES coaches( id ),
  CONSTRAINT teams_FK2 FOREIGN KEY( activity_id ) REFERENCES activities( id )
);


CREATE TABLE member_team
(
  member_id numeric (20),
  team_id CHAR(30),
  club_id CHAR(20),
  CONSTRAINT member_team_pk PRIMARY KEY (team_id,member_id),
  CONSTRAINT member_team_FK1 FOREIGN KEY( member_id ) REFERENCES members( id ),
  CONSTRAINT member_team_FK2 FOREIGN KEY( team_id ) REFERENCES teams( id ),
  CONSTRAINT member_team_FK3 FOREIGN KEY( club_id ) REFERENCES clubs( id )
);


Alter table teams
add CONSTRAINT CHK_teams CHECK (trainingCourse_fee >=350); 

--write a view
create view coach_team_v as
select coaches.full_name, teams.id,teams.name
from teams inner join coaches
on (teams.coach_id = coaches.id);

--write another  view
create view club_v as 
select clubs.name, member_team.team_id
from clubs inner join member_team
on(clubs.id =member_team.club_id);


