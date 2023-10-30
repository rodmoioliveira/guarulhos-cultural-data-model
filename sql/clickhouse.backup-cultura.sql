SELECT *
FROM cultura.artistas INTO OUTFILE 'tables/artistas.csv' FORMAT CSVWithNames;


SELECT *
FROM cultura.funcoes INTO OUTFILE 'tables/funcoes.csv' FORMAT CSVWithNames;


SELECT *
FROM cultura.eventos INTO OUTFILE 'tables/eventos.csv' FORMAT CSVWithNames;


SELECT *
FROM cultura.eventos_tipo INTO OUTFILE 'tables/eventos_tipo.csv' FORMAT CSVWithNames;


SELECT *
FROM cultura.ficha_tecnica INTO OUTFILE 'tables/ficha_tecnica.csv' FORMAT CSVWithNames;


SELECT *
FROM cultura.ficha_tecnica_joined INTO OUTFILE 'views/ficha_tecnica_joined.csv' FORMAT CSVWithNames;

