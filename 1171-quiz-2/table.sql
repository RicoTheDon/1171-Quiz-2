-- quiz 2 for intro to database Enrique Garcia

DROP TABLE IF EXISTS albums CASCADE; 
DROP TABLE IF EXISTS tracks CASCADE;
DROP TABLE IF EXISTS albums_tracks;

CREATE TABLE albums(
    album_id SERIAL PRIMARY KEY,
    title text NOT NULL,
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW()
);

CREATE TABLE tracks(
    track_id SERIAL PRIMARY KEY,
    track_title text NOT NULL,
    length integer NOT NULL,
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW()
);

CREATE TABLE albums_tracks(
    albums_tracks_id serial PRIMARY KEY,
    track_id integer references tracks(track_id),
    album_id integer references albums(album_id),
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW()
);

INSERT INTO albums(title)
VALUES 
('sorry for what'),
('playboy'),
('artist'),
('alone at prom'),
('welcome to o'),
('chixtape'),
('loner'),
('before ava'),
('hoodie'),
('until i die');

INSERT INTO tracks(track_title, length)
VALUES
('lv belt',1),
('hennessy memories',2),
('just the intro',3),
('making you cry',4),
('glasses',5),
('war',6),
('lady of namek',7),
('lady of nebulon',8),
('man in the mirror',9),
('distance', 10);

INSERT INTO albums_tracks(album_id, track_id)
VALUES 
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3),
(4,3),
(5,1),
(5,6),
(6,7),
(8,1);

SELECT A.title, T.track_title
FROM albums AS A
INNER JOIN albums_tracks AS AT 
ON A.album_id = AT.album_id
INNER JOIN tracks AS T
ON AT.track_id = T.track_id;

SELECT A.title, T.track_title
FROM tracks AS T
INNER JOIN albums_tracks AS AT
ON T.track_id = AT.track_id
INNER JOIN albums AS A
ON AT.album_id = A.album_id;

SELECT A.title, COUNT(T.track_id)
FROM albums AS A
INNER JOIN albums_tracks AS AT
ON A.album_id = T.track_id 
GROUP BY A.title;

SELECT T.track_title, COUNT(A.album_id)
FROM tracks AS T 
INNER JOIN albums_tracks AS AT 
ON T.track_id= AT.track_id
INNER JOIN albums AS A
ON AT.album_id = A.album_id
WHERE T.track_title ='lv belt'
GROUP BY T.track_title;








