-- Record
DECLARE
    TYPE rec_aluno IS RECORD
    ( cod_aluno NUMBER NOT NULL := 0,
      nome taluno.nome%TYPE,
      cidade taluno.cidade%TYPE
    );
    
    Registro rec_aluno;
BEGIN
    registro.cod_aluno := 50;
    registro.nome      := 'Master';
    registro.cidade    := 'SANJA';
    Dbms_OUTPUT.PUT_LINE('Código: ' || registro.cod_aluno);
    Dbms_OUTPUT.PUT_LINE('Nome: '|| registro.nome);
    Dbms_OUTPUT.PUT_LINE('Cidade: ' || registro.cidade);
END;

-- Record com ROWTYPE 
DECLARE
    reg taluno%ROWTYPE; -- Registro baseado em uma coleção de colunas
    vCep VARCHAR(10) := '9830';
BEGIN
    SELECT cod_aluno, nome, cidade, salario
    INTO reg.cod_aluno, reg.nome, reg.cidade, reg.salario
    FROM taluno 
    WHERE cod_aluno = 2;
    
    reg.cep := '935';
    reg.salario := 1500;
    
    Dbms_OUTPUT.PUT_LINE('Código: ' || reg.cod_aluno);
    Dbms_OUTPUT.PUT_LINE('Nome: ' || reg.nome);
    Dbms_OUTPUT.PUT_LINE('Cidade: ' || reg.cidade);
    Dbms_OUTPUT.PUT_LINE('Cep: ' || reg.cep);
    Dbms_OUTPUT.PUT_LINE('Salario: ' || reg.salario);

END;

SELECT * FROM taluno;

-- Record com TYPE IS TABLE OF (Recebe a mesma estrutura da coluna nome na tabela taluno)
DECLARE 
    TYPE t_aluno IS TABLE OF taluno.nome%TYPE
    INDEX BY BINARY_INTEGER; --Matriz com acesso as variáveis por números inteiros
    
    Registro t_aluno; -- Record
BEGIN
    Registro(1) := 'SATORO';
    Registro(2) := 'YUJI';
    Registro(3) := 'SUKUNA';
    Dbms_OUTPUT.PUT_LINE('Nome 1: ' || registro(1));
    Dbms_OUTPUT.PUT_LINE('Nome 2: ' || registro(2));
    Dbms_OUTPUT.PUT_LINE('Nome 3: ' || registro(3));
    
END;

--
SELECT cod_aluno, nome
FROM taluno WHERE cod_aluno = 1;

-- Record com TYPE IS TABLE OF usando uma instância
DECLARE 
    TYPE nome_type IS TABLE OF taluno.nome%TYPE;
    nome_table nome_type := nome_type(); -- criando instância
BEGIN
    nome_table.EXTEND; --alocando uma nova linha
    nome_table(1) := 'SUZUYA';
    nome_table.EXTEND; --alocando uma nova linha
    nome_table(2) := 'Kaneki';
    Dbms_OUTPUT.PUT_LINE('Nome 1: ' || nome_table(1));
    Dbms_OUTPUT.PUT_LINE('Nome 2: ' || nome_table(2));
END;

-- 
DECLARE
    TYPE tipo IS TABLE OF VARCHAR2(30) INDEX BY VARCHAR2(2);
    uf_capital tipo;
BEGIN
    uf_capital('RS') := 'Porto Alegre';
    uf_capital('RJ') := 'Rio de Janeiro';
    uf_capital('PR') := 'Curitiba';
    uf_capital('MT') := 'Cuiaba';
    Dbms_OUTPUT.PUT_LINE(uf_capital('RS'));
    Dbms_OUTPUT.PUT_LINE(uf_capital('RJ'));
    Dbms_OUTPUT.PUT_LINE(uf_capital('PR'));
    Dbms_OUTPUT.PUT_LINE(uf_capital('MT'));
END;

-- Incluindo limite com o VARRAY
DECLARE
    TYPE nome_varray IS VARRAY(5) OF taluno.nome%TYPE;
    nome_vetor nome_varray := nome_varray();
BEGIN
    nome_vetor.EXTEND;
    nome_vetor(1) := 'SATORO';
    Dbms_OUTPUT.PUT_LINE(nome_vetor(1));
END;