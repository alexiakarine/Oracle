CREATE OR REPLACE VIEW v_aluno AS
SELECT cod_aluno AS codigo, salario, estado,
    nome AS aluno, cidade
FROM taluno
WHERE estado = 'RS';

-- Usando a view
SELECT * FROM v_aluno
ORDER BY aluno;

-- view complexa
CREATE OR REPLACE VIEW v_contrato
AS
 SELECT TRUNC(data) AS data,
        MAX(desconto) maximo,
        MIN(desconto) minimo,
        AVG(desconto) media,
        COUNT(*) qtde
 FROM tcontrato
 GROUP BY TRUNC(data);
 
 --OPERAÇÃO DML NA VIEW
 CREATE OR REPLACE VIEW vcurso1000ck
 AS
   SELECT cod_curso, nome, valor
   FROM tcurso
   WHERE valor = 1000
   WITH CHECK OPTION CONSTRAINT vcursos1000_ck;
   
INSERT INTO vcurso1000ck
        (cod_curso, nome, valor)
VALUES  (52,'Teste Y', 1000);

SELECT * FROM tcurso;

SELECT * FROM v_aluno;

--DELETE em view
DELETE FROM v_aluno WHERE codigo = 4;

--Insert em view
INSERT INTO v_aluno
VALUES (50,500,'SP','LUCAS','SJC');

--VIEW somente leitura (Não permite DML)
CREATE OR REPLACE VIEW v_aluno3
AS
    SELECT cod_aluno codigo,
           nome aluno, cidade
    FROM taluno
    WHERE estado = 'MG'
    WITH READ ONLY;
    
DROP VIEW v_aluno3;

COMMIT;