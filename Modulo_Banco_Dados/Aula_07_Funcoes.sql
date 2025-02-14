--- Exerc�cios utilizando Fun��es
--- 1. Trazer o nome do funcion�rio com, somente, as inicias em mai�sculo
SELECT
    INITCAP(NM_FUNCIONARIO)
FROM DB_FUNCIONARIO;

--- 2. Trazer o nome do funcion�rio, a data de nascimento e calcular a idade dele em anos
SELECT
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    FLOOR(MONTHS_BETWEEN(SYSDATE, DT_NASCIMENTO)/12) AS IDADE_ATUAL
FROM DB_FUNCIONARIO;

--- 3. Informar se o funcion�rio possui uma idade par ou �mpar
SELECT
    NM_FUNCIONARIO,
    DT_NASCIMENTO,
    FLOOR(MONTHS_BETWEEN(SYSDATE, DT_NASCIMENTO)/12) AS IDADE_ATUAL,
    MOD(FLOOR(MONTHS_BETWEEN(SYSDATE, DT_NASCIMENTO)/12), 2) AS IDADE_PAR_IMPAR
FROM DB_FUNCIONARIO;

--- 4. Trazer o nome do funcion�rio e o sal�rio, criando uma regra de arrendondamento salarial para cima
SELECT 
    NM_FUNCIONARIO,
    CEIL(VL_SALARIO_BRUTO)
FROM DB_FUNCIONARIO;

---Desafios
--- 1. Supondo que, com 55 anos de idade, uma pessoa se aposente. Quais sao os profissionais que estar�o aposentados em 2025?
SELECT
    NM_FUNCIONARIO,
    CEIL(MONTHS_BETWEEN(SYSDATE, DT_NASCIMENTO)/12) AS IDADE_ATUAL,
    CEIL(MONTHS_BETWEEN('31-12-2025', DT_NASCIMENTO)/12) AS IDADE_2025
    FROM DB_FUNCIONARIO
    WHERE CEIL(MONTHS_BETWEEN(ADD_MONTHS(SYSDATE,48), DT_NASCIMENTO)/12)>= 55
ORDER BY CEIL(MONTHS_BETWEEN('31-12-2025', DT_NASCIMENTO)/12);

--- 2. Quais funcion�rios n�o estar�o aposentados em 2025 e quantos anos faltar�o para se aposentarem?
SELECT
    NM_FUNCIONARIO,
    CEIL(MONTHS_BETWEEN(SYSDATE, DT_NASCIMENTO)/12) AS IDADE_ATUAL,
    CEIL(MONTHS_BETWEEN(ADD_MONTHS(SYSDATE,48), DT_NASCIMENTO)/12) AS IDADE_2025,
    CEIL(MONTHS_BETWEEN(ADD_MONTHS(SYSDATE,48), DT_NASCIMENTO)/12) - CEIL(MONTHS_BETWEEN(SYSDATE, DT_NASCIMENTO)/12) AS QTD_ANOS_APOSENT
    FROM DB_FUNCIONARIO
    WHERE CEIL(MONTHS_BETWEEN(ADD_MONTHS(SYSDATE,48), DT_NASCIMENTO)/12) < 55
    ORDER BY CEIL(MONTHS_BETWEEN(ADD_MONTHS(SYSDATE,48), DT_NASCIMENTO)/12);
    
--- 3. Supondo que, ap�s se aposentar, o funcion�rio passe a receber 70% do valor de seu sal�rio atual, quanto ele receber�?
SELECT
    NM_FUNCIONARIO,
    CEIL(MONTHS_BETWEEN(SYSDATE, DT_NASCIMENTO)/12) AS IDADE_ATUAL,
    CEIL(MONTHS_BETWEEN('31-12-2025', DT_NASCIMENTO)/12) AS IDADE_2025,
    VL_SALARIO_BRUTO * 0.70 AS SAL_APOS
    FROM DB_FUNCIONARIO
    WHERE CEIL(MONTHS_BETWEEN(ADD_MONTHS(SYSDATE,48), DT_NASCIMENTO)/12)>= 55
ORDER BY CEIL(MONTHS_BETWEEN('31-12-2025', DT_NASCIMENTO)/12);



