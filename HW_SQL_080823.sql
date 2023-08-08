-- Вывести данные о стримах (проекция: названиестрима, имяавтора_стрима)
SELECT  streams.title, users.username FROM streams
inner join users ON streams.author_id= users.user_id;

-- Вывести юзеров, у которых отсутствуют стримы.
select users.username from users
left join streams on users.user_id=streams.author_id
WHERE streams.title is null; 