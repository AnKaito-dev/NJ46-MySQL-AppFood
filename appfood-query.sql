-- Find 5 people who liked the restaurant most
SELECT user_id, COUNT(*) AS like_count
FROM like_res
GROUP BY user_id
ORDER BY like_count DESC
LIMIT 5;

-- Find 2 restaurants with the most likes
SELECT res_id, COUNT(*) AS like_count
FROM like_res
GROUP BY res_id
ORDER BY like_count DESC
LIMIT 2;

-- Find people who have placed the most orders
SELECT user_id, COUNT(*) AS order_count
FROM `order`
GROUP BY user_id
ORDER BY order_count DESC
LIMIT 1;

-- Find inactive users in the system (no order, no like, no restaurant review)
SELECT u.user_id, u.full_name
FROM user u
LEFT JOIN `order` o ON u.user_id = o.user_id
LEFT JOIN like_res lr ON u.user_id = lr.user_id
LEFT JOIN rate_res rr ON u.user_id = rr.user_id
WHERE o.user_id IS NULL 
  AND lr.user_id IS NULL 
  AND rr.user_id IS NULL;