DECLARE
    vNome VARCHAR(30) := 'Outros';
    vCidade VARCHAR(30);
    vEstado VARCHAR(2);
BEGIN
    IF (vNome = 'Gaucho') THEN
        vCidade := 'Porto Alegre';
        vEstado := 'RS';
    ELSIF (vNome = 'Carioca') THEN
        vCidade := 'Rio de Janeiro';
        vEstado := 'RJ';
    ELSE   
       IF (vEstado = 'SP') THEN
            vCidade := 'Paulista';
       ELSE
            vCidade := 'Outros';
            vEstado := 'XX';
       END IF;
    END IF;
    Dbms_OUTPUT.PUT_LINE(vCidade || ' - ' || vEstado);
    
END;

-- Case WHEN
DECLARE
    vEstado VARCHAR(2) := 'RR';
    vNome VARCHAR(30);
BEGIN
    CASE
        WHEN vEstado = 'RS' THEN vNome := 'Gaucho';
        WHEN vEstado = 'RJ' OR vEstado ='ES' THEN vNome := 'Carioca';
    ELSE
        vNome := 'Outros';
    END CASE;
    Dbms_OUTPUT.PUT_LINE('Aplido: ' || vNome);
END;

--LAÇO DE REPETIÇÃO
DECLARE
    vContador INTEGER := 0;
BEGIN
    LOOP
       vContador:= vContador + 1;
       Dbms_OUTPUT.PUT_LINE(vContador);
       EXIT WHEN vContador = 10;
    END LOOP;
    Dbms_OUTPUT.PUT_LINE('Fim do LOOP');
END;

--For loop (mais indicado para laços em tabelas)
DECLARE
    vContador INTEGER;
BEGIN
    FOR vContador IN 1..10
    LOOP
    --vContador := vContador +1
    Dbms_OUTPUT.PUT_LINE('For loop: ' || vContador);
    --Exit WHEN vContador = 5;
    END LOOP;
END;

--WHILE LOOP
DECLARE 
    vContador INTEGER := 0;
    vTexto VARCHAR(10);
BEGIN
    WHILE vContador < 5
    LOOP
        vContador := vContador + 1;
        IF (vContador MOD 2)= 0 THEN
            vTexto := 'Par';
        ELSE
            vTexto := 'Impar';
        END IF;
        Dbms_OUTPUT.PUT_LINE(vContador || ' -> ' || vTexto);
    END LOOP;
END;