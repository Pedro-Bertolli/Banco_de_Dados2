CREATE TABLE cliente
(
	cpf VARCHAR (13) NOT NULL,
 	nome VARCHAR (60) NOT NULL,
	constraint pk_cliente primary key (cpf)
);


CREATE TABLE pedido
( 
	cod_pedido integer NOT NULL,
	valor numeric (9,2) NOT NULL,
	cpf_cli VARCHAR (13) NOT NULL,
    CONSTRAINT pk_pedido PRIMARY KEY (cod_pedido),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (cpf_cli)
	REFERENCES cliente ON UPDATE CASCADE ON DELETE CASCADE ON DELETE SET NULL /* Serve para apagar ou alterar um elemneto
	sem que dê erro por causa que o elemento está referenciado a outra tabela */
);


INSERT INTO cliente VALUES ('1A', 'Rafael'), ('2B', 'Pedro');

INSERT INTO pedido VALUES (1, 88.78, '1A'), (2, 100.50, '1A'),
						  (3, 299, '2B');
						
DROP TABLE pedido; -- Deleta a tabela pedido;					  


-- TABELAS 
-- 1x1

CREATE TABLE gerente
(
	cpf_ger integer NOT NULL,
	nome_ger VARCHAR (50) NOT NULL,
	CONSTRAINT pk_gerente PRIMARY KEY (cpf_ger)
);


INSERT INTO gerente VALUES (123456, 'João Gomes'), (222333, 'Carla Maria');


CREATE TABLE departamento
(
	cod_departamento INTEGER NOT NULL,
	nome_departamento VARCHAR (50) NOT NULL,
	gerente_cpf_ger INTEGER NOT NULL UNIQUE, /* UNIQUE garante que seja 1x1 e que nada se repita na tabela */
	CONSTRAINT pk_departamento PRIMARY KEY (cod_departamento),
	CONSTRAINT fk_gerente_cpf_ger FOREIGN KEY (gerente_cpf_ger) REFERENCES gerente
);


INSERT INTO departamento VALUES (1, 'TI', 123456),
								(2, 'RH', 222333);


-- Primeira forma de realizar a junção								
SELECT nome_ger, nome_departamento FROM gerente
	  INNER JOIN departamento -- Junta dados que estão em duas tabelas diferentes
	  ON gerente_cpf_ger = cpf_ger; -- Iguala a chave estrangeira com a primária

-- Segunda forma de realizar a junção
SELECT nome_ger, nome_departamento FROM gerente, departamento
	WHERE gerente_cpf_ger = cpf_ger;




-- 1xN

CREATE TABLE curso
(
	codCurso integer NOT NULL,
	nome VARCHAR (40) NOT NULL,
	valor NUMERIC(6,2),
	CONSTRAINT pk_curso PRIMARY KEY (codCurso)
);


CREATE TABLE aluno
(
	ra VARCHAR (15) NOT NULL,
	curso_codCurso INTEGER NOT NULL,
	nomeAluno VARCHAR (50) NOT NULL,
	endereço VARCHAR (60) NOT NULL,
	CONSTRAINT pk_aluno PRIMARY KEY (ra),
	CONSTRAINT fk_aluno_curso FOREIGN KEY (curso_codCurso) REFERENCES curso
);


-- EXERCÍCIO

-- Tabela Curso
CREATE TABLE curso
(
	codcurso INTEGER,
	nome VARCHAR (50) NOT NULL,
	valor REAL,
	CONSTRAINT pk_curso PRIMARY KEY (codcurso)
);

-- Tabela Aluno
CREATE TABLE aluno
(
	ra VARCHAR (20),
	nomeAluno VARCHAR (50) NOT NULL,
	endereco VARCHAR (100),
	codCurso INTEGER,
	CONSTRAINT pk_aluno PRIMARY KEY (ra),
	CONSTRAINT fk_aluno_curso FOREIGN KEY (codcurso) REFERENCES curso
);

-- Tabela Coordenador
CREATE TABLE coordenador
(
	cod_coord INTEGER,
	nome VARCHAR (50) NOT NULL,
	codCurso INTEGER UNIQUE,
	CONSTRAINT pk_coordenador PRIMARY KEY (cod_coord),
	CONSTRAINT fk_curso_coord FOREIGN KEY (codCurso) REFERENCES curso
);


-- 1xN com entidade fraca





-- NxN

-- Tabela Funcionário
CREATE TABLE funcionario
(
	cpf VARCHAR(13) NOT NULL,
	nome VARCHAR (50) NOT NULL,
	CONSTRAINT pk_func PRIMARY KEY (cpf)
);

INSERT INTO funcionario VALUES ('123456', 'Bianca'),
				   			   ('78910', 'Pablo');
				   

--Tabela Projeto
CREATE TABLE projeto
(
	idProjeto INTEGER NOT NULL,
	nomeProj varchar(40) NOT NULL,
	CONSTRAINT pk_projeto PRIMARY KEY(idProjeto)
);

INSERT INTO projeto VALUES (1, 'Vendas'), (2, 'Expansão');


-- Tabela Trabalha (criada pois uma relação NxN sempre dá origem a uma nova tabela)
CREATE TABLE trabalha
(
	cpf_func VARCHAR (13) NOT NULL,
	idProjeto INTEGER NOT NULL,
	CONSTRAINT pk_trabalha PRIMARY KEY(cpf_func, idProjeto),
	CONSTRAINT fk_trabalha_func FOREIGN KEY (cpf_func) REFERENCES Funcionario,
	CONSTRAINT fk_trabalha_proj FOREIGN KEY (idProjeto) REFERENCES Projeto
);

INSERT INTO trabalha VALUES ('123456', 1),
							('78910', 2),
							('123456', 2),
							('78910', 1);
							
							
													
SELECT nome, nomeProj FROM funcionario
		INNER JOIN trabalha
		ON cpf_func = cpf 
		INNER JOIN projeto
		ON trabalha.idProjeto = projeto.idProjeto; -- Quando o nome é igual em duas tabelas
		
		
		

-- Multivalorado

-- Tabela Empregado
CREATE TABLE empregado
(
	idEmp SERIAL, /* Serve para não precisar inserir os valores, pois a cada inserção o valor aumneta 
	de um em um */
	pNome VARCHAR (30),
	sNome VARCHAR (30),
	salario REAL,
	sexo VARCHAR (1),
	CONSTRAINT pk_empregado PRIMARY KEY (idEmp)
); /* Não se cria o telefone nessa tabela, pois, assim, poderia ser adicionado apenas um
telefone, já criando o telefone na tabela telefone_empregado, poderá ser armazenado mais de um telefone */


INSERT INTO empregado (pNome, sNome, salario, sexo) /* Com foi colocado o SERIAL, aqui terá que ser
especificado a ordem dos dados, senão o pNome será jogado no lugar do idEmp e dará erro! */
	VALUES ('Pedro', 'Augusto', 2500, 'M'),
		   ('Joana', 'de Assis', 3000, 'F'),
		   ('Carla', 'Roberta', 1500, 'F'),
		   ('João', 'Antônio', 4500, 'M');


-- Tabela Telefone_Empregado
CREATE TABLE telefone_empregado
(
	Empregado_idEmp INTEGER,
	telefone VARCHAR (15),
	CONSTRAINT pk_telefone PRIMARY KEY (Empregado_idEmp, telefone),
	CONSTRAINT fk_tel_emp FOREIGN KEY (Empregado_idEmp) REFERENCES empregado
);

DROP TABLE telefone_empregado;

INSERT INTO telefone_empregado 
	VALUES (1, '(17)9999-8888'),
		   (1, '(17)9999-9999'),
		   (2, '(17)9999-5555'),
		   (2, '(17)9999-7777'),
		   (3, '(16)9999-9999'),
		   (4, '(18)9999-9999');
		   

SELECT pNome, telefone FROM empregado
	INNER JOIN telefone_empregado
	ON Empregado_idEmp = idEmp;
	
	
	

-- Generalização/Especialização
-- Tabela Pessoa
CREATE TABLE pessoa
(
	cpfPes VARCHAR (13),
	nome VARCHAR (50),
	dtaNASC DATE,
	CONSTRAINT pk_pessoa PRIMARY KEY (cpfPes)
);

-- Tabela Aluno
CREATE TABLE aluno
(
	ra VRACHAR (15),
	cpfPes VARCHAR (13),
	CONSTRAINT pk_aluno PRIMARY KEY (cpfPes, ra),
	CONSTRAINT fk_pes_aluno FOREIGN KEY (cpfPes) REFERENCES pessoa
);

-- Tabela Engenheiro
CREATE TABLE engenheiro
(
	crea INTEGER,
	cpfPes VARCHAR (13),
	CONSTRAINT pk_engenheiro PRIMARY KEY (cpfPes, crea),
	CONSTRAINT fk_pes_engenheiro FOREIGN KEY (cpfPes) REFERENCES pesssoa
);



-- EXEMPLO
-- Tabela Médico
CREATE TABLE medico
(
	crm VRACHAR (15),
	nome VARCHAR (40),
	CONSTRAINT pk_medico PRIMARY KEY (crm)
);


-- Tabela Paciente 
CREATE TABLE paciente
(
	cpf VARCHAR (15),
	nome VARCHAR (40),
	CONSTRAINT pk_paciente PRIMARY KEY (cpf)
);


--Tabela Consulta
CREATE TABLE consulta
(
	crm VARCHAR (15),
	cpf VARCHAR (15),
	dtaCons DATE,
	CONSTRAINT pk_consulta PRIMARY KEY (crm, cpf, dtaCons),
	CONSTRAINT fk_medico_cons FOREIGN KEY (crm) REFERENCES medico,
	CONSTRAINT fk_paciente_cons FOREIGN KEY (cpf) REFERENCES paciente
);



-- Table Exame
CREATE TABLE exame
(
	idExame INTEGER,
	nome VARCHAR (40),
	CONSTRAINT pk_exame PRIMARY KEY (idExame)
);



-- Tabela ExamesConsulta
CREATE TABLE examesConsulta
(
	idExame INTEGER,
	crm VARCHAR (15),
	cpf VARCHAR (15),
	dtaCons DATE,
	CONSTRAINT pk_examesConsulta PRIMARY KEY (idExame, crm, cpf, dtaCons)
	CONSTRAINT fk_examesConsulta1 FOREIGN KEY (idExame) REFERENCES exame 
	CONSTRAINT fk_examesConsulta2 FOREIGN KEY (crm, cpf, dtaCons) REFERENCES consulta							
);