
-- Find songs that are ranked between 8-10.
-- Output the track name along with the corresponding position, ordered ascendingly.

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

-- Solution 1
select trackname, position
from spotify_worldwide_daily_song_ranking
where position between 8 and 10
order by position;