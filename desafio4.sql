SELECT us.name AS "usuario",
IF(MAX(YEAR(his.reproduction_date)) >= 2021,
'Usuário ativo', 'Usuário inativo') AS "status_usuario"
FROM SpotifyClone.user us
LEFT JOIN SpotifyClone.historic his
ON his.user_id = us.user_id
GROUP BY us.name
ORDER BY us.name;