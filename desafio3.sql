SELECT us.name AS "usuario",
COUNT(his.user_id) AS "qt_de_musicas_ouvidas"
FROM SpotifyClone.historic his
INNER JOIN SpotifyClone.user us
ON his.user_id = us.user_id
GROUP BY his.user_id
ORDER BY us.name;

SELECT * FROM SpotifyClone.historic order by user_id;
SELECT * FROM SpotifyClone.musics;