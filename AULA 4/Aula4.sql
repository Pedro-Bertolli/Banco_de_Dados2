-- AULA 4
-- PARTE 1

CREATE TABLE EMPREGADO(
	idEmp integer PRIMARY KEY, 
	pNome character varying (20) NOT NULL,
	sNome character varying(20) NOT NULL, 
	idade integer, 
	salario real NOT NULL, 
	cargo character varying(30) NOT NULL
);

-- DROP TABLE EMPREGADO

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


SELECT * FROM empregado;


-- Nomes onde a segunda letra é A
SELECT pnome FROM empregado
	WHERE pnome LIKE '_a%';
	


-- FUNÇÕES AGREGADAS


-- AVG (Média de todos os salários)

-- Exemplo 2
SELECT cargo, AVG(salario) FROM empregado
	GROUP BY cargo; /* Com o GROUP BY se faz a média salarial de cada cargo específico */



-- MAX e MIN

-- Exemplo 3
SELECT MAX(idade) AS "Idade do empregado mais velho", MIN(idade) FROM empregado;



-- COUNT
SELECT COUNT(*) FROM empregado
	WHERE salario > 3000; -- Retorna a quantidade de empregados que possuem o salário maior que 3000
	

-- Exemplo 2
SELECT COUNT(*) AS "Quantidade de Gerentes" FROM empregado
	WHERE cargo = 'Gerente';  -- Retorna a quantidade de empregados que possuem o cargo de gerente


-- SUM (Soma dos salários)

--Exemplo 4
SELECT SUM(salario) AS "Soma salarial" FROM empregado;



-- GROUP BY 
-- Organiza os dados da tabela em grupos


--Exemplo 5
SELECT cargo, COUNT(*) FROM empregado
	GROUP BY cargo /* Retornar a quantidade de empregados para cada cargo */
	ORDER BY COUNT(*) /* Ordena por quem possui a maior quantidade de de empregados */



-- Exemplo 6
SELECT cargo, AVG(salario) FROM empregado
	GROUP BY cargo; /* Retorna a média salarial de cada um dos cargos */
	
	
	
-- Exemplo 7
SELECT cargo, SUM(salario) FROM empregado 
	GROUP BY cargo
	HAVING SUM(salario) > 10000; -- HAVING serve como o WHERE para quando usar o GROUP BY (uma condição)
	/* Retorna a soma/folha salarial de cada cargo o qual tenha 
	sua soma maior que 10000 */



-- Exemplo 8
SELECT cargo, MAX(salario) AS "Maior salário", MIN(salario) AS "Menor salário" FROM empregado
	WHERE cargo <> 'Gerente' -- Essa condição pode ser usada no HAVING também
	GROUP BY cargo
	HAVING MAX(salario) > 2000 AND MIN(salario) < 2500;
	/* Retorna o salário máximo e o salário mínimo de cada cargo, desde que
	o cargo não seja Gerente e que o maior salário seja maior 2000 e o menor
	salário seja menor que 2500 */
	




-- PARTE 2

create table curso (idCurso integer PRIMARY KEY, nomeCurso character varying (30) NOT NULL, nroSemestres integer NOt NULL, dtaFundacao date);
-- drop table curso
--SELECT * FROM curso;

create table aluno(prontuario character varying (20) Primary key, pnome character varying (15) NOT NULL, snome character varying(30) not null, dtaNasc date, sexo char (1));
--DROP TABLE aluno
-- Adicionando chave estrangeira
ALTER TABLE aluno ADD column idCurso integer references curso (idCurso)ON DELETE CASCADE ON UPDATE CASCADE;

--SELECT * FROM aluno;


-- populando a tabela curso

INSERT INTO curso values (1, 'Ciência da Computação', 8, '01/03/1986');
INSERT INTO curso values (2, 'Direito', 8, '14/12/1975');
INSERT INTO curso values (3, 'Medicina', 12, '05/07/2000');
INSERT INTO curso values (4, 'Engenharia Elétrica', 10, '10/12/1996');
INSERT INTO curso values (5, 'Biologia', 8, '06/06/1993');
INSERT INTO curso values (6, 'Matemática', 8, '01/07/1968');

-- populando a tabela aluno

INSERT INTO aluno values ('11aa', 'Paulo', 'Henrique', '01/07/1986','M',1);
INSERT INTO aluno values ('11bb', 'Ana', 'Paula Siqueira', '08/07/1990','F',5);
INSERT INTO aluno values ('11cc', 'Júlio', 'Cesar', '08/05/1980','M',3);
INSERT INTO aluno values ('11dd', 'Carlos', 'Augusto', '10/11/1983','M',2);
INSERT INTO aluno values ('11ee', 'Gabriele', 'Antunes', '08/05/1990','F',3);
INSERT INTO aluno values ('11ff', 'Antônio', 'Fagundes', '15/06/1955','M',4);
INSERT INTO aluno values ('11gg', 'Ana', 'Paula Arósio', '08/12/1975','F',5);
INSERT INTO aluno values ('11hh', 'Mara', 'Maravilha', '07/07/1970','F',1);
INSERT INTO aluno values ('11ii', 'Roberto', 'Carlos', '01/07/1956','M',3);
INSERT INTO aluno values ('11jj', 'Carmen', 'Miranda', '03/02/1950','F',2);
INSERT INTO aluno values ('11kk', 'Rubens', 'Cardoso', '09/11/1974','M',4);
INSERT INTO aluno values ('11ll', 'Joana', 'de Assis', '07/04/1982','F',1);
INSERT INTO aluno values ('11mm', 'Paola', 'de Oliveira', '06/03/1985','F',6);
INSERT INTO aluno values ('11nn', 'Joaquim', 'Silva', '25/10/1968','M',6);
INSERT INTO aluno values ('11oo', 'Padre', 'Irlandês', '30/10/1960','M',5);
INSERT INTO aluno values ('11pp', 'Angelina', 'Jolie', '20/03/1978','F',4);
INSERT INTO aluno values ('11qq', 'Derci', 'Golçalves', '02/04/1920','F',3);
INSERT INTO aluno values ('11rr', 'Túlio', 'Maravilha', '30/08/1972','M',3);
INSERT INTO aluno values ('11ss', 'Carla', 'Ribeiro', '08/03/1988','F',2);
INSERT INTO aluno values ('11tt', 'Olivia', 'Palito', '18/09/1977','F',1);
INSERT INTO aluno values ('11uu', 'Marinheiro', 'Popeye', '21/02/1968','M',2);
INSERT INTO aluno values ('11vv', 'Alberto', 'Roberto', '15/03/1955','M',4);
INSERT INTO aluno values ('11ww', 'Julia', 'Roberts', '07/05/1972','F',5);
INSERT INTO aluno values ('11xx', 'Thais', 'Ferçosa', '16/04/1983','F',6);
INSERT INTO aluno values ('11yy', 'Barack', 'Obama', '18/09/1956','M',1);
INSERT INTO aluno values ('11zz', 'Osama', 'Bin Laden', '13/12/1960','M',1);
INSERT INTO aluno values ('22aa', 'Paula', 'Fernandes', '03/03/1983','F',2);
INSERT INTO aluno values ('22bb', 'Lara', 'Rodrigues', '10/10/1991','F',2);
INSERT INTO aluno values ('22cc', 'Mariana', 'Ximenes', '07/08/1982','F',3);
INSERT INTO aluno values ('22dd', 'Marcos', 'Paulo', '18/06/1975','M',4);
INSERT INTO aluno values ('22ee', 'Beatriz', 'Seagal', '15/12/1965','F',4);
INSERT INTO aluno values ('22ff', 'Luciano', 'Huck', '04/06/1978','M',5);
INSERT INTO aluno values ('22gg', 'Marcelo', 'Taz', '06/04/1972','M',6);
INSERT INTO aluno values ('22hh', 'Sabrina', 'Sato', '08/11/1982','F',6);
INSERT INTO aluno values ('22ii', 'Vovó', 'Mafalda', '04/11/1950','F',5);
INSERT INTO aluno values ('22jj', 'Joana', 'Darc', '07/07/1955','F',3);
INSERT INTO aluno values ('22ll', 'Henrique', 'VIII', '15/03/1942','M',1);
INSERT INTO aluno values ('22kk', 'Charles', 'Chapilin', '03/11/1926','M',2);
INSERT INTO aluno values ('22mm', 'Frodo', 'Baggins', '08/12/1975','M',3);
INSERT INTO aluno values ('22nn', 'Lady', 'Gaga', '23/07/1985','F',4);
INSERT INTO aluno values ('22oo', 'Katherina', 'Zeta Jones', '07/12/1977','F',5);
INSERT INTO aluno values ('22pp', 'Katherina', 'Zeta Jones', '07/12/1977','F',4);


-- tabela professor
CREATE table professor(prontuario integer primary key, pnome character varying(20) NOT NULL, snome character varying(30) NOT NULL, dtaNasc date);
--DROP TABLE professor


-- populando tabela professor
INSERT INTO professor values (1,'Rafael','Miani','11/01/1984');
INSERT INTO professor values (2,'Pedro','Antonio','15/07/1980');
INSERT INTO professor values (3,'Natal','Henrique','22/12/1981');
INSERT INTO professor values (4,'Carla','Joana','30/10/1972');
INSERT INTO professor values (5,'Raquel','Silva','03/04/1980');
INSERT INTO professor values (6,'Ana','Carla','07/08/1978');
INSERT INTO professor values (7,'Roberto','Silva','13/07/1960');
INSERT INTO professor values (8,'Mariana','Cunha','18/05/1982');
INSERT INTO professor values (9,'Sebastião','Roberto','15/03/1980');
INSERT INTO professor values (10,'Mauro','Augusto','21/03/1978');


-- tabela professorLecionaAluno
create table professorLecionaAluno (prontuarioAluno character varying(20) NOT NULL references aluno (prontuario) ON DELETE CASCADE ON UPDATE CASCADE,
		prontuarioProfessor integer NOT NULL references professor (prontuario) ON DELETE CASCADE ON UPDATE CASCADE,
		 ano integer not null, semestre integer not null, nota real, PRIMARY KEY (prontuarioAluno,prontuarioProfessor,ano,semestre));
		 
-- drop table professorLecionaAluno
--ALTER TABLE professorLecionaAluno ADD column nota real;

-- populando tabela professorLecionaAluno
INSERT INTO professorLecionaAluno VALUES ('11aa',1,2009,2,8.5);
INSERT INTO professorLecionaAluno VALUES ('11aa',3,2011,1,7);
INSERT INTO professorLecionaAluno VALUES ('11bb',4,2008,2,6.5);
INSERT INTO professorLecionaAluno VALUES ('11cc',1,2010,1,9);
INSERT INTO professorLecionaAluno VALUES ('11dd',5,2009,1,4.5);
INSERT INTO professorLecionaAluno VALUES ('11ee',4,2008,2,7.5);
INSERT INTO professorLecionaAluno VALUES ('11ff',3,2011,2,9.5);
INSERT INTO professorLecionaAluno VALUES ('11bb',6,2010,1,5.5);
INSERT INTO professorLecionaAluno VALUES ('11cc',9,2009,1,6);
INSERT INTO professorLecionaAluno VALUES ('11gg',7,2009,2,8);
INSERT INTO professorLecionaAluno VALUES ('11bb',5,2010,1,7.5);



-- PRODUTO CARTESIANO
SELECT pnome, nomeCurso FROM curso, aluno; -- NÃO DEVE SER USADO, usa-se junção no lugar dele



-- JUNÇÃO
-- Junta os dados de mais de uma tabela


-- Exemplo 1

-- Primeira Forma
SELECT pnome, nomeCurso FROM curso C, aluno A
	WHERE C.idCurso = A.idCurso;
	
	
-- Segunda Forma
SELECT pnome, nomeCurso FROM curso C
	INNER JOIN aluno A
	ON C.idCurso = A.idCurso;
	
	
-- Exemplo 2

-- Primeira Forma
SELECT pnome FROM professor P, professorLecionaAluno L
	WHERE P.prontuario = L.professorLecionaAluno
	WHERE ano = 2009;

-- Segunda Forma
SELECT pnome FROM professor P
	INNER JOIN professorLecionaAluno L
	ON P.prontuario = L.prontuarioProfessor
	WHERE ano = 2009; -- o WHERE tem que vir depois da junção!
	
	
-- Exemplo 3

-- Primeira Forma
SELECT pnome, nomeCurso, nota, ano FROM aluno A, curso C, professorLecionaAluno L
	WHERE C.idCurso = A.idCurso AND A.prontuario = L.ProntuarioAluno
	AND nota >7;

-- Segunda Forma
SELECT pnome, nomeCurso, nota, ano FROM aluno A
	INNER JOIN curso C
	ON C.idCurso = A.idCurso
	INNER JOIN professorLecionaAluno L
	ON A.prontuario = L.prontuarioAluno
	WHERE nota > 7;
	
	
-- Exemplo 4
SELECT A.pnome AS "Nome Aluno", nomeCurso AS "Nome Curso", nota AS "Nota", ano AS "Ano", P.pnome AS "Nome Professor" FROM aluno A  -- Quando é necessário retornar duas informações cujo nome é igual em duas tabelas															
	INNER JOIN curso C                                      -- é necessário indicar no começo a qaul tabela esse dado pertence colocando o apelido
	ON C.idCurso = A.idCurso								-- e o ponto em frente de cada dado referente a tabela que ele pertence
	INNER JOIN professorLecionaAluno L
	ON A.prontuario = L.prontuarioAluno
	INNER JOIN professor P
	ON P.prontuario = L.prontuarioProfessor
	WHERE nota > 7;
	


