SELECT * FROM taluno;

-- Todos os registros j� existentes ir�o ficar com o valor de SP
-- Se incluir um registro sem valor, RS ser� incluso como padr�o
ALTER TABLE taluno ADD estado CHAR(2) DEFAULT ('SP'); 

ALTER TABLE taluno ADD salario NUMBER(5,2) DEFAULT 620;

UPDATE taluno SET
estado = 'AC', salario = 250
WHERE cod_aluno = 1;

UPDATE taluno SET
estado = 'CE', salario = 750
WHERE cod_aluno = 3;

UPDATE taluno SET
estado = 'RS', salario = 150
WHERE cod_aluno = 4;

SELECT * FROM taluno
WHERE estado <> 'RS'
AND salario <= 700
ORDER BY salario DESC;

INSERT INTO taluno (cod_aluno, nome, cidade)
VALUES (SEQ_aluno.NEXTVAL,'Beatriz', 'Londres');

INSERT INTO taluno (cod_aluno, nome, cidade)
VALUES (SEQ_aluno.NEXTVAL,'Zenitsu', 'San Andr�s');

UPDATE taluno SET
estado = 'SP', salario = 900, nome = 'Pedro'
WHERE cod_aluno = 25;

SELECT estado, salario, nome FROM taluno
ORDER BY estado, salario DESC;

ALTER TABLE taluno ADD nascimento DATE DEFAULT SYSDATE - 1000; --Pega a data de hoje menos 1.000 dias

SELECT SYSDATE - SYSDATE - 100 FROM DUAL; --

SELECT * FROM taluno;

UPDATE taluno SET 
nascimento = '10/05/2001'
WHERE cod_aluno = 3;

UPDATE taluno SET 
nascimento = '16/05/1998'
WHERE cod_aluno = 2;

SELECT cod_aluno, nascimento, TRUNC(nascimento), nome -- Trunc na coluna data ele ignora a hora
FROM taluno
WHERE TRUNC(nascimento) ='24/05/20';

SELECT cod_aluno, nascimento, TRUNC(nascimento), nome 
FROM taluno
WHERE nascimento
-- DD/MM/YYYY � a formata��o de data que eu desejo que exiba
    BETWEEN TO_DATE('10/05/1998 22:00','DD/MM/YYYY HH24:MI') -- HH24 Vai exibir 22h e n�o 10 
     AND TO_DATE('10/05/2001 23:00','DD/MM/YYYY HH24:MI');
     
COMMIT;     

SELECT * FROM tcontrato;

SELECT * FROM tcontrato
WHERE desconto IS NULL; --S� vai trazer registros onde desconto � null  

SELECT * FROM tcontrato
WHERE desconto IS NOT NULL; --S� vai trazer registros onde desconto N�O � null 

SELECT * FROM tcontrato
WHERE desconto BETWEEN 0 AND 5; --S� vai trazer desconto entre 0 e 5 

SELECT * FROM tcontrato -- al�m dos registro antre 0 e 10 ele tamb�m traz os registros com desconto null
WHERE desconto >= 0
AND desconto <=10
OR desconto IS NULL;


SELECT * FROM titem
WHERE cod_curso IN(1, 2, 4); --Retorna apenas os registros onde cod_curso for 1,2, e 4

SELECT * FROM titem
WHERE cod_curso NOT IN(1, 2, 4); --Retorna apenas os registros onde cod_curso N�O for 1,2, e 4

SELECT * FROM tcurso
WHERE nome LIKE 'D%'; --Registros que COME�AM com a letra D

SELECT * FROM tcurso 
WHERE nome LIKE '%ORACLE%'; --Registros que CONTENHAM a palavra ORACLE

SELECT * FROM tcurso
WHERE nome LIKE '%SQL'; --Registros que TERMINAM com a palavra SQL

SELECT * FROM tcurso;

ALTER TABLE tcurso ADD pre_req INTEGER;

UPDATE tcurso SET
pre_req = 1
WHERE cod_curso = 2;

UPDATE tcurso SET
pre_req = 3
WHERE cod_curso = 4;

SELECT * FROM tcurso 
WHERE pre_req IS NULL;

SELECT * FROM tcurso 
WHERE pre_req IS NOT NULL;

COMMIT;
