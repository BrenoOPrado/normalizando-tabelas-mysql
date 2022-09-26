SELECT us.name AS "usuario"
FROM SpotifyClone.user us;

SELECT COUNT(user_id) AS "qt_de_musicas_ouvidas" FROM SpotifyClone.historic GROUP BY user_id;

SELECT us.name AS "usuario",
COUNT(his.user_id) AS "qt_de_musicas_ouvidas"
FROM SpotifyClone.user us
INNER JOIN SpotifyClone.historic his
ON his.user_id = us.user_id;

SELECT * FROM SpotifyClone.musics;