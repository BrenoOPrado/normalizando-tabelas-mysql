SELECT art.name AS "artista",
alb.name AS "album",
COUNT(fa.artist_id) AS "seguidores"
FROM SpotifyClone.follow_artist fa
INNER JOIN SpotifyClone.artist art
ON fa.artist_id = art.artist_id
INNER JOIN SpotifyClone.album alb
ON alb.artist_id = art.artist_id
GROUP BY alb.album_id
ORDER BY COUNT(fa.artist_id) DESC,
art.name, alb.name;