SELECT cod_aluno, nome, cidade FROM taluno;

SELECT cod_aluno AS "Código", nome AS "Nome do aluno"
FROM taluno;

SELECT cidade FROM taluno;

SELECT DISTINCT cidade FROM taluno;

SELECT cidade, cod_aluno FROM taluno
ORDER BY cidade;

SELECT nome AS curso,
    valor,
    valor/carga_horaria,
    Round(valor/carga_horaria,2) AS valor_hora -- Arredonda com o tanto de casa decimais informadas 
FROM tcurso
ORDER BY valor_hora;

SELECT * FROM tcontrato;

UPDATE tcontrato SET 
desconto = NULL
WHERE cod_contrato = 4;

SELECT cod_contrato,
    total,
    desconto,
    total+desconto
FROM tcontrato;
    
SELECT cod_contrato,
    desconto,
    NVL(desconto,0),--se a coluna for nula ele arredonda pra 0
    total,
    total + NVL(desconto,0) AS total_mais_deconto
FROM tcontrato;

SELECT cod_aluno || '-' || nome || '//' || cidade AS aluno
FROM taluno
ORDER BY cod_aluno;


