SELECT evento_id,
       evento_nome,
       evento_tipo_nome,
       artista_id,
       artista,
       funcao_nome
FROM
  (SELECT evento_id,
          evento_nome,
          evento_tipo_id,
          artista_id,
          artista_nome || " " || artista_sobrenome AS artista,
          funcao_nome
   FROM
     (SELECT artista_id,
             artista_nome,
             artista_sobrenome,
             eventos.evento_id,
             eventos.evento_nome,
             eventos.evento_tipo_id,
             funcao_id
      FROM
        (SELECT artista.artista_id,
                artista_nome,
                artista_sobrenome,
                evento_id,
                funcao_id
         FROM `tables/ficha_tecnica.csv` ficha_tecnica
         JOIN `tables/artistas.csv` artista ON ficha_tecnica.artista_id = artista.artista_id) fta
      JOIN `tables/eventos.csv` eventos ON fta.evento_id = eventos.evento_id) ftae
   JOIN `tables/funcao.csv` funcao ON ftae.funcao_id = funcao.funcao_id) ftaef
JOIN `tables/eventos_tipo.csv` et ON et.evento_tipo_id = ftaef.evento_tipo_id
ORDER BY evento_id,
         funcao_nome,
         artista;

