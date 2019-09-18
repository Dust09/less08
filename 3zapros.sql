--Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT SUM(CASE WHEN p.sex = 'f' THEN 1 ELSE 0 END),
 SUM(CASE WHEN p.sex='m' THEN 1 ELSE 0 END)
 FROM likes l
  LEFT JOIN profiles p ON l.user_id=p.user_id
   GROUP BY p.sex
   ORDER BY COUNT(l.id);
   
-- Пусть задан некоторый пользователь.
--Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользоваетелем.

SELECT CONCAT (u.firstname,' ',u.lastname) as friend,COUNT(*) AS messages FROM users AS u
 INNER JOIN friendship AS f ON u.id = f.friend_id AND
 f.user_id = 1 OR u.id = f.user_id AND f.friend_id = 1
 INNER JOIN messages AS m ON u.id = m.from_user_id AND 
 m.to_user_id=1 OR u.id = m.to_user_id AND m.from_user_id = 1 
 GROUP BY friend 
 ORDER BY messages DESC
 LIMIT 1;
