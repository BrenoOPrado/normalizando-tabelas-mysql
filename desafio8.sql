SELECT art.name AS "artista",
alb.name AS "album"
FROM SpotifyClone.album alb
INNER JOIN SpotifyClone.artist art
ON art.artist_id = alb.artist_id
WHERE art.name = 'Elis Regina';