SELECT COUNT(*) AS qtde_registros,
        AVG(total) AS media,
        AVG(total) AS media,
        MAX(total) AS maximo,
        MIN(total) AS minimo,
        SUM(total) AS soma,
        MAX(data) AS data_maior,
        MIN(data) AS data_menor
FROM tcontrato;

SELECT * FROM tcontrato;

--Total de contatrato por data
SELECT TO_CHAR(TRUNC(data), 'DD/MM/YYYY') AS data,
    SUM(total) AS Soma,
    AVG(total) AS Media,
    COUNT(*)   AS Qtde
FROM tcontrato
GROUP BY TRUNC(data)
ORDER BY data DESC;

UPDATE tcontrato SET
 desconto = NULL
WHERE cod_contrato = 4;

UPDATE tcontrato SET
 desconto = NULL
WHERE cod_contrato = 3;


SELECT COUNT(*) AS qtde_registros
FROM tcontrato;

-- Ignora os nulos
SELECT COUNT(desconto) AS qtde_registros
FROM tcontrato;

SELECT * FROM taluno;

-- Qtde de estads diferentes
SELECT COUNT(DISTINCT (estado)) FROM taluno;

--Qtde de registros por estado
SELECT estado, COUNT(*)
FROM taluno
GROUP BY estado;

--1º NVL, os nulos vai considerar 0, 2º AVG faz a média e 
--3º ROUND, vai arredondar em 2 casas decimais 
SELECT SUM(desconto),
       AVG(desconto),
       COUNT(desconto),
       ROUND(AVG(NVL(desconto,0) ), 2)
FROM tcontrato;


SELECT cod_aluno, AVG(total) media
FROM tcontrato
WHERE cod_aluno > 0
HAVING AVG(total) > 500
GROUP BY cod_aluno
ORDER BY cod_aluno;

SELECT cod_aluno, AVG(total) media
FROM tcontrato
WHERE cod_aluno > 0
GROUP BY cod_aluno
HAVING SUM(total) > 500
ORDER BY cod_aluno;

-- Media mais alta por aluno
SELECT MAX(AVG(total))
FROM tcontrato
GROUP BY cod_aluno;

COMMIT;