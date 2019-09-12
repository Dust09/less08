--Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT SUM(CASE WHEN p.sex = 'f' THEN 1 ELSE 0 END),
 SUM(CASE WHEN p.sex='m' THEN 1 ELSE 0 END)
 FROM likes l
  LEFT JOIN profiles p ON l.user_id=p.user_id
   GROUP BY p.sex
   ORDER BY COUNT(l.id);
   
