
-- Find songs that have ranked in the top position. Output the track name and the number of times 
-- it ranked at the top. Sort your records by the number of times the song was in the top position in descending order.
-- Note: Top positioned songs have the value 1 for the position column.


-- Table: spotify_worldwide_daily_song_ranking


/* Schema
id:int
position:int
trackname:varchar
artist:varchar
streams:int
url:varchar
date:datetime
region:varchar
*/

select trackname, count(1) as top_rank_count
from spotify_worldwide_daily_song_ranking
where position = 1
group by 1
order by 2 desc;