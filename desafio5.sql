SELECT mus.name AS "cancao", COUNT(his.music_id) AS "reproducoes"
FROM SpotifyClone.historic his
INNER JOIN SpotifyClone.musics mus
ON mus.music_id = his.music_id
GROUP BY his.music_id
ORDER BY COUNT(his.music_id) DESC, mus.name
LIMIT 2;