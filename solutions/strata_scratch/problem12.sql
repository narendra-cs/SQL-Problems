-- Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

-- Solution 1
select distinct fp.*
from facebook_posts fp inner join facebook_reactions fr
    on fp.post_id = fr.post_id and fr.reaction = 'heart';


-- Solution 2
select *
from facebook_posts
where post_id in (select distinct post_id from facebook_reactions where reaction = 'heart');