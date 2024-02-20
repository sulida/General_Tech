create database music;
-- Создать таблицу комментариев (comments) с использованием механизма валидации данных в SQL

CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    music_track VARCHAR(128) NOT NULL,
    author_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comment VARCHAR(128) NOT NULL    
    );

-- Добавить в таблицу комментариев несколько записей

INSERT INTO comments (music_track, author_id, created_at, comment)
VALUES
		('Kalina', 1, current_timestamp(), 'Cool'),
        ('Kalina', 2, current_timestamp(), 'Great work!'),
		('Kalina', 3, current_timestamp(), 'I like it'),
        ('All will be good', 1, current_timestamp(), 'Cool'),
        ('All will be good', 2, current_timestamp(), 'Great work!'),
        ('All will be good', 3, current_timestamp(), 'Cool'),
        ('All will be good', 4, current_timestamp(), 'Great work!'),
		('Makarena', 1, current_timestamp(), 'Cool'),
        ('Makarena', 4, current_timestamp(), 'Great work!');
        
-- Вывести ко-во комментариев на каждый трек (в упорядоченном виде)
SELECT music_track, count(*) AS quantity_of_comments
FROM comments
GROUP BY music_track;