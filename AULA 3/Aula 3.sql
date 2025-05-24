-- Criando a tabela empregado
CREATE TABLE EMPREGADO(idEmp integer PRIMARY KEY, pNome character varying (20) NOT NULL, sNome character varying(20) NOT NULL, idade integer, salario real NOT NULL, cargo character varying(30) NOT NULL);

--drop table empregado

-- Inserindo os dados na tabela
INSERT INTO empregado VALUES (1,'Carlos','Alberto',24,2500,'Técnico em Segurança');
INSERT INTO empregado VALUES (2,'Pedro','Augusto',32,3500,'Analista de Sistemas');
INSERT INTO empregado VALUES (3,'Mara','Antonia',27,1200,'Secretária');
INSERT INTO empregado VALUES (4,'Derci','Gonçalves',56,6500,'Gerente');
INSERT INTO empregado VALUES (5,'Pedro','Bueno',28,1500,'Estagiário');
INSERT INTO empregado VALUES (6,'Edson','Arantes',60,7500,'Gerente');
INSERT INTO empregado VALUES (7,'Odete','Roitman',54,2000,'Técnico em Segurança');
INSERT INTO empregado VALUES (8,'Antonio','Da Lua',38,2500,'Analista de Sistemas');
INSERT INTO empregado VALUES (9,'Sassa','Mutema',55,3000,'Vendedor');
INSERT INTO empregado VALUES (10,'José','Silvério',42,2800,'Vendedor');
INSERT INTO empregado VALUES (11,'Gabriel','Oliveira',24,2500,'Técnico em Segurança');
INSERT INTO empregado VALUES (12,'Flávia','Camargo',29,4200,'Analista de Sistemas');
INSERT INTO empregado VALUES (13,'Marina','Delbonis',20,1000,'Secretária');
INSERT INTO empregado VALUES (14,'Paulo','Roberto',33,1500,'Vendedor');
INSERT INTO empregado VALUES (15,'José','Carlos da Silva',27,2900,'Analista de Sistemas');
INSERT INTO empregado VALUES (16,'Rúbia','Miranda',29,3500,'Administrador');
INSERT INTO empregado VALUES (17,'Roberto','Andrade Silva',35,3300,'Vendedor');
INSERT INTO empregado VALUES (18,'Ana','Julia',31,2900,'Secretária');
INSERT INTO empregado VALUES (19,'Pedro','Antonio',41,3500,'Administrador');
INSERT INTO empregado VALUES (20,'Ana','Mara',22,2200,'Psicóloga');
INSERT INTO empregado VALUES (21,'João','Augusto',44,5500,'Gerente');

-- Exemplo 1
-- Seleciona todas as colunas e linhas da tabela
SELECT * FROM empregado;


-- Exemplo 2
-- Seleciona apenas as colunas pnome e cargo da tabela empregado
SELECT pnome, cargo FROM empregado;


-- Exercício 1
-- Seleciona apenas as colunas pnome, snome e salário da tabela empregado
SELECT pnome, snome, salario FROM empregado;


-- Exercício 2
-- Seleciona apenas as colunas cargo e idade da tabela empregado
SELECT cargo, idade FROM empregado;



-- WHERE

-- Exemplo 1
-- Seleciona todos os primeiros nomes e idades dos empregados que possuem idade = 32
SELECT pnome, idade FROM empregado
	WHERE idade = 32;
	
	
-- ORDER BY

-- Exemplo 2
/* Seleciona todos os primeiros nomes e salario dos empregados que possuem salário maior que 3000
e ordena eles em ordem crescente pelo salário */
SELECT pnome, salario FROM empregado
	WHERE salario > 3000
	ORDER BY salario;


-- COMANDOS ADICIONAIS

-- Exemplo
SELECT pnome FROM empregado
	WHERE pnome > 'Carlos'
	ORDER BY pnome;


-- Exercício	
SELECT pnome, cargo FROM empregado
	WHERE cargo <> 'Vendedor';
	


-- DISTINCT

-- Exemplos

-- Retorna todos os nomes da tabela empregado, inclusive as duplicatas
SELECT pnome FROM empregado ORDER BY pnome;

-- Retorna os nomes da tabela, eliminando as duplicatas
SELECT DISTINCT (pnome) FROM empregado ORDER BY pnome;


-- EXERCÍCIOS DE FIXAÇÃO

-- Exercício 1
SELECT pnome, snome, idade FROM empregado
	WHERE idade > 30;
	
	
-- Exercício 2
SELECT pnome, cargo, salario FROM empregado
	WHERE cargo = 'Vendedor';
	
	
-- Exercício 3
SELECT DISTINCT cargo FROM empregado;



-- OR

-- Exemplo 1
SELECT pnome, cargo FROM empregado 
	WHERE cargo = 'Secretária' OR cargo = 'Gerente';
	
	
-- Exemplo 2
SELECT pnome, cargo, salario FROM empregado
	WHERE cargo = 'Vendedor' OR salario > 3000;


-- AND

-- Exemplo 1
SELECT pnome, salario, cargo FROM empregado
	WHERE cargo = 'Analista de Sistemas' AND salario > 4000;
	
	
-- Exemplo 2
SELECT pnome, cargo FROM empregado
	WHERE cargo = 'Gerente' AND pnome = 'Pedro';
	
/* Não retornou nenhuma linha pois não há nenhum empregado que seja Gerente e que o primeiro
nome seja Pedro */


-- IN 
-- Usado para quando é necessário retornar valores diferentes de uma mesma coluna

-- Exemplo 1
SELECT pnome, cargo FROM empregado
	WHERE cargo IN ('Gerente', 'Estagiário', 'Vendedor'); -- Utilizando IN
	

SELECT pnome, cargo FROM empregado
	WHERE cargo = 'Gerente' OR cargo = 'Estagiário' OR cargo = 'Vendedor'; -- Utilizando OR
	


-- Exemplo 2
SELECT cargo FROM empregado
	WHERE cargo IN ('Analista de Sistemas', 'Técnico em Segurança') 
	AND salario > 2000;   -- Utilizando IN
	
	
SELECT cargo FROM empregado
	WHERE (cargo = 'Analista de Sistemas' OR cargo = 'Técnico em Segurança')
	AND salario > 2000;  -- Utilizando OR
	
	
-- NOT
-- Usado para negar uma condição

-- Exemplo
SELECT pnome, cargo FROM empregado
	WHERE cargo NOT IN ('Gerente', 'Estagiário', 'Vendedor');
	
	
-- BETWEEN

-- Exemplo
/* Retorna todos os nomes e salários dos empregados que tenham salário 
entre 2500 e 4000 */

SELECT pnome, salario FROM empregado
	WHERE salario BETWEEN 2500 AND 4000
	ORDER BY salario;  -- Utlizando o BETWEEN
	
	
SELECT pnome, salario FROM empregado
	WHERE salario >= 2500 AND salario <= 4000
	ORDER BY salario, pnome;  -- Utilizando AND


-- ORDER BY

SELECT pnome, salario FROM empregado
	WHERE salario >= 2500 AND salario <= 4000
	ORDER BY salario, pnome;
	
/* É possível ter mais de um parâmetro de ordenação, o primeiro sempre é o principal e o resto
vem depois em sequência */


SELECT pnome, salario FROM empregado
	WHERE salario >= 2500 AND salario <= 4000
	ORDER BY salario DESC, pnome;
	
/* DESC é usado para ordenar os dados em ordem decrescente, se nada for colocado após
ORDER BY salario, a ordenação seria crescente automaticamente */


-- Exemplo 1
SELECT pnome, salario, cargo FROM empregado
	ORDER BY pnome;
	
	
-- Exemplo 2
SELECT pnome, salario, cargo FROM empregado
	WHERE salario > 2500
	ORDER BY salario DESC;
	
	
-- ALIAS (AS)
-- Dá um apelido temporário para uma coluna 


-- Exemplo 1
SELECT pnome AS "Primeiro Nome", salario AS "Salário", cargo FROM empregado
	WHERE salario > 2500
	ORDER BY salario DESC;
	
	
-- Exemplo
SELECT AVG(salario) AS "Média dos Salários", SUM(salario) AS "Folha Salarial" FROM empregado;

-- AVG calcula a média dos salários e SUM calcula a sma de todos os salários


-- LIKE 

-- Exemplo 1
SELECT * FROM empregado
	WHERE pnome LIKE 'A%';  -- Nomes que começam com a letra A
	
	
-- Exemplo 2
SELECT pnome, cargo FROM empregado
	WHERE pnome LIKE '%A%';  -- Nomes que tenham a letra A
	
-- Para não diferenciar letras maiúculas e minúsculas, utiliza-se o ILIKE


-- EXERCÍCIOS 


-- Exercício 1
SELECT * FROM empregado
	WHERE pnome LIKE '_e%' OR pnome LIKE '%i_';
	
	
-- Exercício 2
SELECT pnome FROM empregado
	WHERE pnome LIKE '%a%s%';
	

-- Exercício 3
SELECT * FROM empregado
	WHERE pnome ILIKE '_e%' OR pnome ILIKE '%i_';
	
	
SELECT pnome FROM empregado
	WHERE pnome ILIKE '%a%s%';





