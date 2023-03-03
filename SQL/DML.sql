CREATE TABLE tdesconto(
classe VARCHAR(2),
inferior INTEGER,
superior INTEGER);

INSERT INTO tdesconto(classe, inferior, superior)
VALUES ('&classe','&inferior', '&superior');

SELECT * FROM tdesconto;

SELECT * FROM tdesconto 
WHERE classe = '&classe';

UPDATE tdesconto SET
inferior = '&inferior',
superior = '&superior'
WHERE classe = '&classe';

DELETE FROM tdesconto
WHERE classe = '&classe';

--------
-- tabela identica a tdesconto
CREATE TABLE tdesconto2
AS SELECT * FROM tdesconto;


SELECT * FROM tdesconto2;

COMMIT;

DELETE FROM tdesconto2;

ROLLBACK;

--Deleta todos os registros da tabela sem a possibiidade de ROLLBACK;
-- Não tem cláusula WHERE
-- Não gera LOG
TRUNCATE TABLE tdesconto2;

COMMIT;

--SAVEPOINT
SAVEPOINT upd_b; --ponto de restauração

UPDATE tdesconto SET
superior = 88
WHERE classe = 'B';

SAVEPOINT upd_a;

UPDATE tdesconto SET
superior = 99
WHERE classe = 'A';

--ponto de restauração
SAVEPOINT ins_OK;

INSERT INTO tdesconto(classe, inferior, superior)
VALUES ('&classe','&inferior','&superior');

SELECT * FROM tdesconto;

ROLLBACK TO SAVEPOINT ins_OK;
ROLLBACK TO SAVEPOINT upd_a;

DROP TABLE tdesconto2; 

COMMIT;