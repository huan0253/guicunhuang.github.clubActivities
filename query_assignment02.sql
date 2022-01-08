
--Metadata

 SELECT column_name, data_type,character_maximum_length
 FROM INFORMATION_SCHEMA.COLUMNS WHERE
 TABLE_NAME = 'clubs' OR
 TABLE_NAME = 'activities' OR
 TABLE_NAME = 'members' OR
 TABLE_NAME = 'teams' OR
 TABLE_NAME = 'member_teams' or
 TABLE_NAME = 'coaches';
 
--the first one of query statements using select and where

select id,full_name,email
From members
where id ='10000';

--the second one of query statements using select and where
select id, name, contact_number
from clubs
where id = 'EVERG';

--the third one of query statements using select and where
select team_id, member_id, club_id
from member_team
where club_id='SportH' ;

-- left join statements

select members.full_name as member_name,
       member_team.team_id as team_id
from members left join member_team
on members.id = member_team.member_id 
where members.id in (select id 
                   from members 
                   where id >10008)
order by member_id desc;
                                                        

-- right join statements                         
                                               
select member_team.member_id, teams.id
from member_team right join teams
on teams.id= member_team.team_id
where teams.id in (select id
                   from teams
                   where trainingCourse_fee >400);


--write one union join

select full_name,email
from members
union all
select full_name,email
from coaches





