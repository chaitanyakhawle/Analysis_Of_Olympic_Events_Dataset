select * from olympic_events;

# 1. write an sql query to find in which sport or event india has won the highest medal ?

select year,event,count(medal)
from olympic_events
where Team = 'india'
and Medal <> 'na'
group by year,event ;

# ANSWERE IS
              #(# year         event        count(medal)
			  #'1928', 'Hockey Men\'s Hockey', '2'
			  #'1964', 'Hockey Men\'s Hockey', '1'
              #'1932', 'Hockey Men\'s Hockey', '1'
              #'1936', 'Hockey Men\'s Hockey', '1'
              #'1960', 'Hockey Men\'s Hockey', '1')

# 2. identify the sport or event which was played most consecutively in the summer olympic games ?

select event, count(Event)
from olympic_events
where Season = 'summer'
group by event
order by count(Event) desc;

# 3. write an sql query to fetch all the details of the countries which have won most number of silver and bronze medals at least one gold medals ?

select team, sum(silver),
             sum(bronze),
			 sum(gold)
FROM (
       select *,
               case medal when 'silver' then 1 else 0 end as silver,
			   case medal when 'bronze' then 1 else 0 end as bronze,
               case medal when 'gold' then 1 else 0 end as gold
       from olympic_events
) innerT 
group by team
having sum(gold) > 0
order by sum(silver) desc;

# 4. which player has won maximum number of gold ?

select name, 
sum(gold)
from 
(
select*,
case medal when 'gold' then 1 else 0 end as gold
from olympic_events) innerT
group by name 
order by sum(gold) desc;

   # 5. which sport has maximum events ?
  
  select sport, count(*)
   from olympic_events
   group by sport
   order by count(*) desc;
       
# 6. ehich year has the maximum events ?

select year, count(event)
from olympic_events
group by year 
order by count(event) desc;
