-- fun��es de convers�o entre Mai�sculas/Min�sculas
SELECT * FROM taluno;

-- Concatena duas colunas
SELECT CONCAT(cod_aluno,nome) FROM taluno; 
SELECT cod_aluno ||' '|| nome FROM taluno;

-- Transforma APENAS a 1� letra de cada palavra em Mai�scula
SELECT INITCAP(cidade) FROM taluno;

-- Verifica em que posi��o se encontra a letra R (caso de � encontrado ele retorn 0)
SELECT INSTR(nome, 'R') FROM taluno; 

--Conta quantos caracteres tem 
SELECT nome, LENGTH(nome) FROM taluno;

--Exibe tudo pra min�sculo
SELECT LOWER(nome) FROM taluno;

--Exibe tudo pra mai�sculo
SELECT UPPER(nome) FROM taluno;

--LEFT - Preenche a coluna cod_aluno com zeros at� chegar 5 caracteres a esquerda
SELECT cod_aluno, LPAD(cod_aluno,5, '0') FROM taluno;

--RIGHT - Preenche a coluna cod_aluno com zeros at� chegar 6 caracteres a direita
SELECT nome, salario, RPAD(salario, 6,'0')FROM taluno;

-- Preenche os espa�os com $ at� completar 10 caracteres
SELECT RPAD(nome, 10, '$') FROM taluno;

-- Copia parte de um texto (campo texto,apartir da posi��o, copia a qtde de caracteres)
SELECT SUBSTR(nome,1,3) FROM taluno;

--Subsitui na visualiza��o as letras R por $
SELECT REPLACE(nome, 'R', '$') FROM taluno;

-- Conta quantos caracteres tem e exibe o �ltimo
SELECT nome, SUBSTR(nome,LENGTH(nome),1) FROM taluno;


-- Round(arredonda,n� de casas) e Trunc (arredonda pra baixo) 
SELECT ROUND(45.925, 2), --45.93
       TRUNC(45.29,2), --45.92
       MOD(10,2) AS resto_divisao,
       TRUNC(1.99), --exibe a parte inteira
       TRUNC(1.99,2)
FROM DUAL;

--Fun��es data/hora
SELECT data, SYSDATE, data + 5 FROM tcontrato; 

SELECT SYSDATE - data AS dif_dias FROM tcontrato;

SELECT data, SYSDATE, TRUNC(SYSDATE - data) AS dias FROM tcontrato;

-- Somando horas em uma data 
SELECT SYSDATE, SYSDATE + 5 /24 AS add_horas FROM tcontrato;

-- Somando minutos
SELECT data, SYSDATE + 15 / 1440 AS add_minutos FROM tcontrato; -- 1400 s�o quantos minutos tem em um dia

-- Somando segundos
SELECT data, SYSDATE, SYSDATE + 30 / (3600 * 24) AS add_segundos FROM tcontrato; -- 3600 s�o qto segundos tem em um dia

-- Hora fica 00:00:00
SELECT SYSDATE, TRUNC(SYSDATE) FROM DUAL;

--Diferen�a de meses entre datas
SELECT SYSDATE, MONTHS_BETWEEN(SYSDATE,SYSDATE-90) AS dif_mes FROM DUAL;

-- Adiciona meses
SELECT ADD_MONTHS(SYSDATE,5) AS adiciona_mes_data FROM DUAL;

--Pr�xima data a partir de um dia da semana 
SELECT NEXT_DAY(SYSDATE, 'QUARTA-FEIRA') AS proxima_quarta_data FROM DUAL;

--�ltimo dia do m�s
SELECT LAST_DAY(SYSDATE) AS ultimo_dia_mes FROM DUAL;

-- Primeiro dia do pr�ximo m�s (At� dia 15do m�s exibe o 1� dia do m�s atual,
-- a partir do dia 16, retorna o 1� dia do pr�ximo m�s)
SELECT ROUND(SYSDATE, 'MONTH') AS primeiro_dia_proximo_mes FROM DUAL;

-- Primeiro dia do m�s
SELECT TRUNC(SYSDATE, 'MONTH') AS primeiro_dia_mes_corrente FROM DUAL;

-- Formata��o de data

--Conversor to_char(data, formato)
--
SELECT SYSDATE, TO_CHAR(SYSDATE,'DD') FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE,'DD/MM/YYYY') data FROM DUAL;

SELECT TO_CHAR(SYSDATE,'DD/MM') dia_mes FROM DUAL;

SELECT TO_CHAR(SYSDATE,'DD') dia FROM DUAL;

SELECT TO_CHAR(SYSDATE,'MM') mes FROM DUAL;

SELECT TO_CHAR(SYSDATE,'YYYY') ano FROM DUAL;

SELECT TO_CHAR(SYSDATE,'YY') ano FROM DUAL;

-- 
SELECT TO_CHAR(SYSDATE,'MONTH') mes1 FROM DUAL;

--
SELECT TO_CHAR(SYSDATE,'D') dia_semana FROM DUAL;

--
SELECT TO_CHAR(SYSDATE,'DY') dia_semana FROM DUAL; --QUA

-- QUARTA-FEIRA
SELECT TO_CHAR(SYSDATE,'DAY') dia_semana1 FROM DUAL; 

--ANO POR EXTENSO EM INGL�S
SELECT TO_CHAR(SYSDATE,'YEAR') ano FROM DUAL; 

-- CIDADE, DIA DA SEMANA, DIA, MES e ANO
SELECT TO_CHAR(SYSDATE,'"JACARE�", fmDAY "," DD "de" fmMONTH "de" YYYY') FROM DUAL; 

--
SELECT TO_CHAR(SYSDATE,'HH24:MI') hora_min FROM DUAL;

--
SELECT TO_CHAR(SYSDATE,'HH24:MI:SS') hora_min_seg FROM DUAL;

--
SELECT TO_CHAR(SYSDATE,'DD/MM HH24:MI') data_hora FROM DUAL;

-- 
SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY HH24:MI:SS') data_hora FROM DUAL;


--
SELECT * FROM taluno;

--L -> R$ / G -> Ponto / D -> Casas Decimais
-- TRIM tira os espa�os em branco
SELECT TRIM(TO_CHAR(salario,'L99999.99')) salario, TRIM(TO_CHAR(salario,'L99G999D99')) 
FROM taluno;

--
SELECT 'R$ ' || (ROUND(salario,2)) AS salario FROM taluno;

-- 
SELECT LPAD(TRIM((TO_CHAR(5000,'L99999.99'))),'12',' ')FROM DUAL;


----
--NVL (COLUNA, VALOR A SER EXIBIDO CASO SEJA NULL)e NVL2(COLUNA, VALOR A SER EXIBIDO CASO NAO SEJA NULL, VALOR EXIBIDO SE FOR NULL)

SELECT total,
       desconto,
       NVL(desconto,0),
       NVL(desconto,0) + total,
       NVL2(desconto, -1, total) --Se o desconto for null o resultado vai ser total se n�o vai ser -1
FROM tcontrato;

UPDATE taluno SET
nome = NULL
WHERE cod_aluno = 4;

SELECT * FROM taluno;

SELECT cod_aluno, NVL(nome, 'Sem nome') FROM taluno;

-- CASE
SELECT nome,estado,
       CASE
        WHEN estado = 'SP' THEN 'Paulista'
        WHEN UPPER(estado) = 'AC' THEN 'n�o existe'
        WHEN estado = 'RJ' AND salario > 500 THEN 'carioca'
        ELSE 'Outros'
       END AS Apelido
FROM taluno;

--DECODE
SELECT nome,estado,
    DECODE(estado, 'SP', 'Paulita',
                   'RS', 'Ga�cho',
                         'Outros') AS Apelido
FROM taluno;

COMMIT;

