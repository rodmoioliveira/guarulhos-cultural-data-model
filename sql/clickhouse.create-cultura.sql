DROP DATABASE IF EXISTS cultura;


CREATE DATABASE IF NOT EXISTS cultura;


CREATE TABLE IF NOT EXISTS cultura.artistas (artista_id UInt64,
                                             artista_nome String,
                                             artista_sobrenome String) ENGINE = MergeTree() PRIMARY KEY (artista_id);


CREATE TABLE IF NOT EXISTS cultura.funcoes (funcao_id UInt64,
                                            funcao_nome String) ENGINE = MergeTree() PRIMARY KEY (funcao_id);


CREATE TABLE IF NOT EXISTS cultura.eventos (evento_id UInt64,
                                            evento_nome String,
                                            evento_tipo_id UInt64) ENGINE = MergeTree() PRIMARY KEY (evento_id);


CREATE TABLE IF NOT EXISTS cultura.eventos_tipo (evento_tipo_id UInt64,
                                                 evento_tipo_nome String) ENGINE = MergeTree() PRIMARY KEY (evento_tipo_id);


CREATE TABLE IF NOT EXISTS cultura.ficha_tecnica (ficha_tecnica_id UInt64,
                                                  evento_id UInt64,
                                                  artista_id UInt64,
                                                  funcao_id UInt64) ENGINE = MergeTree() PRIMARY KEY (ficha_tecnica_id);


CREATE VIEW IF NOT EXISTS cultura.ficha_tecnica_joined AS
  (WITH a AS
     (SELECT *
      FROM cultura.ficha_tecnica
      INNER JOIN cultura.artistas ON cultura.ficha_tecnica.artista_id = cultura.artistas.artista_id),
        b AS
     (SELECT *
      FROM a
      INNER JOIN cultura.funcoes ON a.funcao_id = cultura.funcoes.funcao_id),
        c AS
     (SELECT *
      FROM b
      INNER JOIN cultura.eventos ON b.evento_id = cultura.eventos.evento_id) SELECT ficha_tecnica_id,
                                                                                    evento_id,
                                                                                    evento_nome,
                                                                                    evento_tipo_id,
                                                                                    evento_tipo_nome,
                                                                                    artista_id,
                                                                                    artista_nome,
                                                                                    artista_sobrenome,
                                                                                    funcao_id,
                                                                                    funcao_nome
   FROM c
   INNER JOIN cultura.eventos_tipo ON c.evento_tipo_id = cultura.eventos_tipo.evento_tipo_id
   ORDER BY evento_id,
            artista_nome,
            artista_sobrenome,
            funcao_nome);


INSERT INTO cultura.artistas
FROM INFILE 'tables/artistas.csv' FORMAT CSV;


INSERT INTO cultura.funcoes
FROM INFILE 'tables/funcoes.csv' FORMAT CSV;


INSERT INTO cultura.eventos
FROM INFILE 'tables/eventos.csv' FORMAT CSV;


INSERT INTO cultura.eventos_tipo
FROM INFILE 'tables/eventos_tipo.csv' FORMAT CSV;


INSERT INTO cultura.ficha_tecnica
FROM INFILE 'tables/ficha_tecnica.csv' FORMAT CSV;

