SELECT cod_aluno, total FROM tcontrato
WHERE COD_ALUNO = 5; 

SELECT * FROM tcontrato; 

SELECT taluno.cod_aluno, taluno.nome, tcontrato.total
FROM taluno, tcontrato
WHERE taluno.cod_aluno = tcontrato.cod_aluno;

UPDATE tcontrato SET
cod_aluno = 6
WHERE total = 1800;


CREATE TABLE tdesconto(
classe VARCHAR(1) PRIMARY KEY,
inferior NUMBER(4,2),
superior NUMBER(4,2)
);

INSERT INTO tdesconto VALUES ('A',00,10);
INSERT INTO tdesconto VALUES ('B',11,15);
INSERT INTO tdesconto VALUES ('C',16,20);
INSERT INTO tdesconto VALUES ('D',21,25);
INSERT INTO tdesconto VALUES ('E',26,30);

SELECT * FROM tdesconto;

COMMIT;

UPDATE tcontrato SET
desconto = 27
WHERE cod_contrato = 6;

UPDATE tcontrato SET
desconto = 18
WHERE cod_contrato = 5;

SELECT con.cod_contrato AS contrato,
    des.classe AS desconto
FROM tcontrato con, tdesconto des
WHERE NVL(con.desconto,0) BETWEEN des.inferior
     AND des.superior
ORDER BY con.cod_contrato;

INSERT INTO tcurso VALUES (6,'PHP',1000,100,0);
INSERT INTO tcurso VALUES (7,'Logica',100,20,0);

ALTER TABLE tcurso ADD pre_req INTERGER;

UPDATE tcurso SET pre_req = 7
WHERE cod_curso = 1;

UPDATE tcurso SET pre_req = 7
WHERE cod_curso = 3;

UPDATE tcurso SET pre_req = 1
WHERE cod_curso = 2;

SELECT * FROM tcurso;

