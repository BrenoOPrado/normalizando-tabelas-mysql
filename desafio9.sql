SELECT COUNT(*) AS "quantidade_musicas_no_historico"
FROM SpotifyClone.historic
WHERE user_id = 1
GROUP BY user_id;