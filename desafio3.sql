SELECT us.name AS "usuario",
COUNT(his.reproduction_date) AS "qt_de_musicas_ouvidas",
ROUND(SUM(mus.duration_in_seconds / 60), 2) AS "total_minutos"
FROM SpotifyClone.historic his
INNER JOIN SpotifyClone.user us
ON his.user_id = us.user_id
INNER JOIN SpotifyClone.musics mus
ON his.music_id = mus.music_id
GROUP BY his.user_id
ORDER BY us.name;