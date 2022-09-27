SELECT mus.name AS "nome",
COUNT(mus.name) AS "reproducoes"
FROM SpotifyClone.user us
INNER JOIN SpotifyClone.historic his
ON us.user_id = his.user_id
INNER JOIN SpotifyClone.musics mus
ON his.music_id = mus.music_id
WHERE us.plan_id = 1 OR us.plan_id = 3
GROUP BY mus.name
ORDER BY mus.name;