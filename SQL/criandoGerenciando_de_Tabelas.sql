CREATE TABLE TESTE(
codigo INTEGER NOT NULL PRIMARY KEY,
data DATE DEFAULT SYSDATE
);

INSERT INTO teste(codigo) VALUES (1);
INSERT INTO teste(codigo,data) VALUES (2,'28/02/2023');

SELECT * FROM teste;


--Mostra todas as tabelas criadas pelo usuário
SELECT * FROM USER_TABLES;

--Mostra todas as tabelas do banco.
SELECT * FROM ALL_TABLES;


CREATE TABLE tcontrato_vip AS
SELECT * FROM tcontrato WHERE total > 500;

SELECT * FROM tcontrato_vip;

ALTER TABLE tcontrato_vip ADD valor NUMBER(5,2);

ALTER TABLE tcontrato_vip MODIFY valor NUMBER(8,2);

ALTER TABLE tcontrato_vip MODIFY valor NUMBER(12,2) DEFAULT 0;

ALTER TABLE tcontrato_vip RENAME COLUMN valor TO valor2;

ALTER TABLE tcontrato_vip DROP COLUMN valor2;

DROP TABLE tcontrato_vip;

--Comentário na tabela
COMMENT ON TABLE tcontrato IS 'Informações de contrato';

--Comentário na coluna da tabela
COMMENT ON COLUMN tcontrato.cod_contrato IS 'Código do contrato';

COMMENT ON COLUMN tcontrato.data IS 'Data de emissão do contrato';

SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME = 'tcontrato';

SELECT * FROM USER_TAB_COMMENTS WHERE TABLE_NAME = 'tcontrato';

--Desabilitar a coluna
ALTER TABLE tcontrato ADD total2 NUMERIC(8,2);

ALTER TABLE tcontrato SET UNUSED (total2);

SELECT * FROM tcontrato;

-- Excluir colunas desabilitadas
ALTER TABLE tcontrato DROP UNUSED COLUMNS;