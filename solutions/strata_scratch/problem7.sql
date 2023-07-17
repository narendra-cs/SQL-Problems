
-- What were the top 10 ranked songs in 2010?
-- Output the rank, group name, and song name but do not show the same song twice.
-- Sort the result based on the year_rank in ascending order.

-- Table: billboard_top_100_year_end

/* Schema
year:int
year_rank:int
group_name:varchar
artist:varchar
song_name:varchar
id:int
*/

-- Solution 1
select distinct year_rank, group_name, song_name
from billboard_top_100_year_end
where year = 2010
order by year_rank
limit 10;


-- solution 2 (if a song alreay ranked then it should not coming again with same or other rank)
with ranked_songs as (
select year_rank,
    group_name,
    song_name,
    row_number() over(partition by song_name order by year_rank) row_num
from billboard_top_100_year_end
where year = 2010
)
select year_rank, group_name, song_name
from ranked_songs
where row_num = 1
order by year_rank
limit 10;
