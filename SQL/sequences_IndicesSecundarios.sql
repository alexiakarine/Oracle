CREATE TABLE tcidade(
cod_cidade INTEGER NOT NULL,
nome VARCHAR2(40),
CONSTRAINT pk_cidade PRIMARY KEY(cod_cidade)
);

CREATE TABLE tbairro(
cod_cidade INTEGER NOT NULL,
cod_bairro INTEGER NOT NULL,
nome VARCHAR2(40),
CONSTRAINT pk_bairro PRIMARY KEY(cod_cidade,cod_bairro)
);

ALTER TABLE tbairro ADD CONSTRAINT fk_cod_cidade
FOREIGN KEY (cod_cidade)
REFERENCES tcidade(cod_cidade);

CREATE TABLE tlogradouro(
cod_log INTEGER NOT NULL,
cod_cidade INTEGER,
cod_bairro INTEGER,
nome VARCHAR(40),
CONSTRAINT pk_log PRIMARY KEY(cod_log)
);

ALTER table tlogradouro ADD CONSTRAINT fk_cidadebairro
FOREIGN KEY (cod_cidade, cod_bairro)
REFERENCES tbairro(cod_cidade, cod_bairro);

SELECT * FROM tlogradouro;

CREATE TABLE tpessoa(
cod_pessoa INTEGER NOT NULL,
tipo VARCHAR2(1) NOT NULL,
nome VARCHAR2(30)NOT NULL,
pessoa VARCHAR2(1) NOT NULL,
cod_logradouro INTEGER NOT NULL,
cpf VARCHAR2(15),
CONSTRAINT pk_pessoa PRIMARY KEY (cod_pessoa)
);

ALTER TABLE tpessoa ADD CONSTRAINT uk_cpf UNIQUE(cpf);
DELETE FROM tpessoa;

ALTER TABLE tpessoa ADD CONSTRAINT fk_pessoa_rua
FOREIGN KEY (cod_logradouro)
REFERENCES tlogradouro;

INSERT INTO tcidade VALUES (1,'Novo hamburgo');
INSERT INTO tcidade VALUES (2,'Shibuya');
INSERT INTO tcidade VALUES (3,'Springfield');
INSERT INTO tcidade VALUES (4,'Fenda do biquini');

INSERT INTO tbairro(cod_cidade,cod_bairro,nome) VALUES ('&cod_cidade','&cod_bairro','&nome');

INSERT INTO tlogradouro VALUES (1,1,1,'Flor de laranjeira');
INSERT INTO tlogradouro VALUES (2,2,1,'Flor de cerejeira');
INSERT INTO tlogradouro VALUES (3,3,1,'Flor de lótus');
INSERT INTO tlogradouro VALUES (4,3,1,'Flor de maracujá');

SELECT * FROM tlogradouro;

-- Check
ALTER TABLE tpessoa ADD CONSTRAINT ck_pessoa_tipo
CHECK (tipo IN ('C','F'));

ALTER TABLE tpessoa ADD CONSTRAINT ck_pessoa_jf
CHECK (pessoa IN ('J','F'));

-- EXCLUIR CONSTRAINT
ALTER TABLE tpessoa DROP CONSTRAINT nome_constraint;

INSERT INTO tpessoa VALUES (1,'C','SUZUYA','F',1,'1234');
INSERT INTO tpessoa VALUES (2,'F','CORUJA','F',2,'123');
INSERT INTO tpessoa VALUES (3,'F','KANEKI','F',4,'12345');
INSERT INTO tpessoa VALUES (4,'C','TOUKA','J',3,'12');

SELECT * FROM tpessoa; 

-- Apagar a conostraint com FK
ALTER TABLE tcontrato DROP CONSTRAINT nome_da_constraint;
CASCADE CONSTRAINT; -- APAGAR CONSTRAINT RELACIONADAS COM OUTRAS TABELAS

ALTER TABLE tcontrato ADD CONSTRAINT clk_contrato_desconto
CHECK(desconto BETWEEN 0 AND 30);

SELECT * FROM tcontrato; 

--Desabilitando/habilitando constraint
ALTER TABLE tpessoa DISABLE CONSTRAINT uk_cpf;
ALTER TABLE tpessoa ENABLE CONSTRAINT uk_cpf;

--Excluir constraint
ALTER TABLE tpessoa DROP CONSTRAINT uk_cpf;

--Mostra todas as constraints da tabela
SELECT * FROM user_constraints
WHERE table_name = 'tpessoa';

--Constraint e as colunas associadas
SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = 'tpessoa';

--
SELECT object_name, object_type
FROM user_objects
WHERE object_name IN ('tpessoa');

COMMIT;
