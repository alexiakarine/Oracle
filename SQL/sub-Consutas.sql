SELECT cod_contrato, data, total
FROM tcontrato
WHERE total >
      (SELECT valor FROM tcurso
        WHERE cod_curso = 1);
        
SELECT cod_aluno, nome, cidade, estado
FROM taluno
WHERE (cidade, estado) =
      (SELECT cidade, estado FROM taluno
        WHERE cod_aluno = 1)
AND cod_aluno <> 1;

SELECT cod_curso, MIN(valor), SUM(valor),
        COUNT(*) qtde
FROM titem
WHERE cod_curso > 0
GROUP BY cod_curso
HAVING MIN(valor) >=
        (SELECT AVG(valor)FROM tcurso)
ORDER BY cod_curso;

SELECT cod_aluno, MIN(total), SUM(total)
FROM tcontrato
GROUP BY cod_aluno
HAVING MIN(total) > 
    (SELECT AVG(valor) FROM tcurso);
    

SELECT cod_curso, nome, valor
FROM tcurso
WHERE cod_curso IN (SELECT cod_curso FROM titem);

SELECT cod_curso, nome, valor
FROM tcurso
WHERE cod_curso NOT IN (SELECT cod_curso FROM titem)
ORDER BY nome;


COMMIT;