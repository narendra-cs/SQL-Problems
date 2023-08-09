

--Find how many times each artist appeared on the Spotify ranking list
-- Output the artist name along with the corresponding number of occurrences.
-- Order records by the number of occurrences in descending order.

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
select artist, count(1) as artist_rank
from spotify_worldwide_daily_song_ranking
group by artist
order by artist_rank desc;