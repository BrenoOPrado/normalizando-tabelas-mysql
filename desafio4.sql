SELECT distinct us.name AS "usuario",
IF(YEAR(his.reproduction_date) > 2020,
'Usúario ativo', 'Usúario inativo') AS "status_usuario"
FROM SpotifyClone.user us
LEFT JOIN SpotifyClone.historic his
ON his.user_id = us.user_id
ORDER BY us.name;

SELECT * FROM SpotifyClone.historic;