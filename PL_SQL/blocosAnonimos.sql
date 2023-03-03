--SET SERVER OUT ON
--Bloco anônimo
DECLARE
   vdesconto NUMBER(6,2) := 0.50;
   vcidade VARCHAR(30)   := 'Tao tao distante';
   vcod_aluno taluno.cod_aluno%TYPE  := 5;
   vtotal NUMBER(8,2) := 134.89;
BEGIN
   vtotal := ROUND(vtotal * vdesconto, 2);
   Dbms_OUTPUT.PUT_LINE('Total: ' || vtotal);
   vdesconto := 1.20;
   vcidade := INITCAP(vcidade);
   Dbms_OUTPUT.PUT_LINE('Cidade: ' || vcidade);
   Dbms_OUTPUT.PUT_LINE('Desconto: ' || vdesconto);
   Dbms_OUTPUT.PUT_LINE('Aluno: ' || vcod_aluno);
END;



DECLARE 
    vPreco1 NUMBER(8,2) :=  10;
    vPreco2 NUMBER(8,2) := 20;
    vFlag BOOLEAN; 
BEGIN
    vFlag := (vPreco1 > vPreco2);
    IF (vFlag = TRUE) THEN 
        Dbms_OUTPUT.PUT_LINE('Verdadeiro');
    ELSE
        Dbms_OUTPUT.PUT_LINE('Falso');
    END IF;
    IF (vPreco1 > vPreco2) THEN
        Dbms_OUTPUT.PUT_LINE('vPreco1 é maior');
    ELSE
        Dbms_OUTPUT.PUT_LINE('vPreco2 é maior');
    END IF;
END;


-- Bind variavel
VARIABLE vdesconto2 NUMBER

DECLARE 
    vcod_aluno NUMBER := 1;
BEGIN
    :vdesconto2 := 0.90;
    Dbms_OUTPUT.PUT_LINE('Desconto 2: ' || :vdesconto2);
    
    UPDATE tcontrato SET
    total = total * :vdesconto2
    WHERE cod_aluno = vcod_aluno;
END;

SELECT * FROM tcontrato;

--Aninhamento de blocos
DECLARE 
    vTeste VARCHAR(10) := 'Jose';
BEGIN
    DECLARE
        vTeste VARCHAR(10) := 'Pedro';
    BEGIN
        Dbms_OUTPUT.PUT_LINE(vTeste);
        END;
        Dbms_OUTPUT.PUT_LINE(vTeste);
END;