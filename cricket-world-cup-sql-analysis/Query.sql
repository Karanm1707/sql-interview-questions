select team_name, count(team_name) as Match_played ,
sum(win_count) as match_won,
(count(team_name) - sum(win_count)) as Match_lost,
2 * sum(win_count) as Points
from 
(select Team_1 as team_name , Case
when Team_1 = Winner then 1 else 0 end as win_count
from icc_world_cup
union all
select Team_2 as team_name , Case
when Team_2 = Winner then 1 else 0 end as win_count
from icc_world_cup) A
group by team_name
order by match_won desc, match_lost;
