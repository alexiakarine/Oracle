CREATE SEQUENCE seq_aluno1
START WITH 60
--valor inicial
INCREMENT BY 2
--qte a incrementar
MINVALUE 60
--valor mínimo
MAXVALUE 100
--valor máximo
NOCACHE
--não guarda em cache faixa de valores
NOCYCLE;

INSERT INTO taluno(cod_aluno, nome) VALUES (seq_aluno1.NEXTVAL,'Master Training 2');

SELECT * FROM taluno;
COMMIT;

SELECT * FROM USER_SEQUENCES;

--valor atual
SELECT seq_aluno1.CURRVAL FROM DUAL;

ALTER SEQUENCE seq_aluno1 MAXVALUE 500;

----------------------------------------
--ÍNDICE

SELECT nome FROM taluno
WHERE nome LIKE'%A%';

CREATE INDEX ind_taluno_nome1 ON taluno(nome);

CREATE INDEX ind_talu_nomecidade
ON taluno(nome, cidade);

SELECT nome FROM taluno
WHERE nome LIKE '%A%' AND cidade LIKE '%A%';

SELECT * FROM USER_INDEXES;

DROP INDEX ind_talu_nomecidade;

--Sinonimos
CREATE SYNONYM alu for taluno;

SELECT * FROM alu;