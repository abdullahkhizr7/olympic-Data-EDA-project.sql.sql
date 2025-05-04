

update  athlete_events
set medal = null
where medal = 'NA'

--1--

select top 1 a1.team,count(*) as gold_medals_won
from athletes a1
inner join athlete_events a2 on a1.id=a2.athlete_id
where a2.medal like 'Gold'
group by a1.team
order by gold_medals_won desc
;
--2--
with A as(
select team,count(medal) as Silver_medal_won
from athletes a1
inner join athlete_events a2 on a1.id=a2.athlete_id
where a2.medal like 'Silver'
group by a1.team

),
B as(
select a1.team,a2.year,dense_rank() over(partition by a1.team order by count(medal) desc) as rn,count(medal) as silver_meadals
from athletes a1
inner join athlete_events a2 on a1.id=a2.athlete_id
where a2.medal = 'Silver'
group by a1.team,a2.year
)
select A.team,A.Silver_medal_won,B.year as year_of_highest_silver_medals
from A
inner join B on A.team=B.team
where rn =1 


--3--
with A as(
select a1.name,a2.medal
from athletes a1
inner join athlete_events a2 on a1.id=a2.athlete_id
where a1.name not in (select a1.name from athletes where medal in ('Bronze','Silver') )
)
select  top 1 name,count(*) as medal_won
from A
where medal = 'Gold'
group by name
order by medal_won desc
;

--4--
with A as(
select a2.year,a1.name, count(*) as golds_won,RANK() over(partition by year order by count(*) desc) as rn
from athletes a1
inner join athlete_events a2 on a1.id=a2.athlete_id
where medal like 'Gold'
group by a2.year,a1.name
),B as(
select year,name,golds_won,rn
from A
where rn =1)
select year, STRING_AGG(name,', ') as name
from B
group by year
;

--5--
with A as(
select a2.medal,a2.year,sport, row_number() over(partition by a2.medal order by year asc ) as rn
from athletes a1
inner join athlete_events a2 on a1.id=a2.athlete_id
where a1.team = 'India' and medal is not null
)
select medal, year,sport
from A
where rn =1
;


--6--
select a1.name	
from athletes a1
inner join athlete_events a2 on a1.id=a2.athlete_id
where medal = 'Gold'
group by a1.name
having count (distinct season) =2 



--7--
select a1.name,a2.year
from athletes a1
inner join athlete_events a2 on a1.id=a2.athlete_id
where medal is not null
group by a1.name,a2.year
having count(distinct medal) = 3
;

--8--
with A as(
select name ,year,event
 from athletes a1
inner join athlete_events a2 on a1.id=a2.athlete_id
where year >=2000 and medal = 'Gold' and season ='Summer'
group by name,event,year
)
select * from
(select *,lag(year,1) over(partition by name,event order by year) as prev_year
,lead(year,1) over(partition by name,event order by year) as next_year
from A
) a
where year= prev_year+4 and year = next_year-4







select top 100 * from athletes;

select *
from athletes a1
inner join athlete_events a2 on a1.id=a2.athlete_id;