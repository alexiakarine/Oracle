DECLARE 
    vValor NUMBER(8,2);
    vNome VARCHAR2(30);
BEGIN
    SELECT valor, nome
    INTO vValor, vNome
    FROM tcurso
    WHERE cod_curso = &cod_curso;
    Dbms_OUTPUT.PUT_LINE('Valor: '|| TO_CHAR(vValor,'fm9999.99'));
    Dbms_OUTPUT.PUT_LINE('Curso: '|| INITCAP(vNome));
END;

SELECT * FROM tcurso;

DECLARE
    vDt_compra tcontrato.data%TYPE;
    vDt_curso tcontrato.data%TYPE;
BEGIN
    SELECT data, data + 10
    INTO vDt_compra, vDt_curso
    FROM tcontrato
    WHERE cod_contrato = &Contrato;
    Dbms_OUTPUT.PUT_LINE('Data compra: '|| vDt_compra);
    Dbms_OUTPUT.PUT_LINE('Data curso: ' || vDt_curso);
END;

SELECT MAX(cod_contrato) FROM tcontrato;
CREATE SEQUENCE seq_contrato START WITH 8;

DECLARE
    vcod tcontrato.cod_contrato%TYPE;
BEGIN
    SELECT seq_contrato.NEXTVAL
    INTO vcod FROM DUAL;
    
    INSERT INTO tcontrato(cod_contrato, data, 
                          cod_aluno, desconto)
    VALUES(vcod, SYSDATE, 2, NULL);
    
    DBMS_OUTPUT.PUT_LINE('Criado contrato: ' || vcod);
END;

--Pegar o valor atual
SELECT seq_contrato.CURRVAL FROM DUAL;

SELECT * FROM tcontrato;

--Update
DECLARE
    vValor tcurso.valor%TYPE := &valor;
BEGIN
    UPDATE tcurso SET
    valor = valor + vValor
    WHERE carga_horaria >= 30;
END;

SELECT * FROM tcurso; 

--DELETE
DECLARE
    vContrato tcontrato.cod_contrato%TYPE := &contrato;
BEGIN
    DELETE FROM tcontrato
    WHERE cod_contrato = vContrato;
END;

SELECT * FROM tcontrato;

DECLARE
    vContrato NUMBER := &cod_contrato;
    vtexto VARCHAR2(50);
BEGIN
    UPDATE tcontrato SET
    desconto = desconto + 2
    WHERE cod_contrato >= vContrato;
    
    vtexto := SQL%ROWCOUNT;
    --Retorna a qtde de registro afetados pelo comando SQL
    
    DBMS_OUTPUT.PUT_LINE(vtexto || 'linhas atuaizadas.');
END;