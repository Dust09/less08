--При удалении пользователя удалятся сообщения 
ALTER TABLE messages
 ADD CONSTRAINT messages_to_user_id_fk
  FOREIGN KEY (to_user_id) REFERENCES users(id)
 ON DELETE CASCADE,
 ADD CONSTRAINT messages_from_user_id_fk
 FOREIGN KEY (from_user_id) REFERENCES users(id)
 ON DELETE CASCADE;
  

--Запрещено удалять тип медиа
ALTER TABLE media
 ADD CONSTRAINT media_media_type_id_fk
  FOREIGN KEY (media_type_id) REFERENCES media_types(id)
 ON DELETE RESTRICT,
 
--При удалении юзера удалятся все файлы этого юзера
 ADD CONSTRAINT media_user_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
  ON DELETE CASCADE;


--При удалении  юзера , юзер удаляется из сообщества
ALTER TABLE communities_user
 ADD CONSTRAINT communities_user_user_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
 ON DELETE CASCADE,
 
 --При удалении  сообщества  удалится все что было в этом сообществе 
 ADD CONSTRAINT communities_community_id_fk
  FOREIGN KEY (community_id) REFERENCES communities(id)
 ON DELETE CASCADE;

--Удаляя пользователя он удалится у его друзей
ALTER TABLE friendship 
 ADD CONSTRAINT friendship_user_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
 ON DELETE CASCADE,
 
 --Удаляя друга он удалится у пользователей
 ADD CONSTRAINT  friendship_friend_id
  FOREIGN KEY (friend_id) REFERENCES users(id)
 ON DELETE CASCADE;
 
--Удаляя пользователя удалятся все лайки который он поставил
ALTER TABLE likes
 ADD CONSTRAINT likes_user_id_fk
  FOREIGN KEY (user_id) REFERENCES users(id)
 ON DELETE CASCADE,
 

 
 
 






