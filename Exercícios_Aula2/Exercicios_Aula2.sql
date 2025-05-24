-- 1)

-- Tabela Ator
CREATE TABLE ator
(
	idAtor INTEGER,
	nome VARCHAR (40),
	dtaNasc DATE,
	CONSTRAINT pk_ator PRIMARY KEY (idAtor)
);

		   
--Tabela Filme
CREATE TABLE filme
(
	codFilme INTEGER,
	nome VARCHAR (40),
	genero VARCHAR (20),
	dtaLanc DATE,
	CONSTRAINT pk_filme PRIMARY KEY (codFilme)
);

		   

-- Tabela Exemplar
CREATE TABLE exemplar
(
	nroExemplar INTEGER,
	codFilme INTEGER,
	CONSTRAINT pk_exemplar PRIMARY KEY (nroExemplar, codFilme),
	CONSTRAINT fk_exemp_film FOREIGN KEY (codFilme) REFERENCES filme
);


-- Tabela Cliente
CREATE TABLE cliente
(
	codCliente INTEGER,
	nome VARCHAR (40),
	Rua VARCHAR (50),
	nro INTEGER,
	Cidade VARCHAR (40),
	CEP VARCHAR (8),
	CONSTRAINT pk_cliente PRIMARY KEY (codCliente)
);


-- Tabela Estrela
CREATE TABLE estrela
(
	idAtor INTEGER,
	codFilme INTEGER,
	CONSTRAINT pk_atorEstrelaFilme PRIMARY KEY (idAtor, codFilme),
	CONSTRAINT fk_estrelaAtor FOREIGN KEY (idAtor) REFERENCES ator,
	CONSTRAINT fk_estrelaFilme FOREIGN KEY (codFilme) REFERENCES filme
);


-- Tabela Aluga
CREATE TABLE aluga
(
	codCliente INTEGER,
	codFilme INTEGER,
	nroExemplar INTEGER,
	dtaEmpr DATE,
	dtadev DATE,
	CONSTRAINT pk_aluga PRIMARY KEY (codCliente, codFilme, nroExemplar, dtaEmpr),
	CONSTRAINT fk_aluga_cli FOREIGN KEY (codCliente) REFERENCES cliente,
	CONSTRAINT fk_aluga_Exemplar FOREIGN KEY (codFilme, nroExemplar) REFERENCES exemplar
);


-- Tabela TelefoneCliente
CREATE TABLE telefoneCliente
(
	nroTelefone INTEGER,
	codCliente INTEGER,
	CONSTRAINT pk_telefoneCli PRIMARY KEY (nroTelefone, codCliente),
	CONSTRAINT fk_clienteTel FOREIGN KEY (codCliente) REFERENCES cliente
);






-- 2)

-- Tabela Proprietário
CREATE TABLE proprietário
(
	cod_propri INTEGER,
	nome VARCHAR (40),
	CONSTRAINT pk_proprietario PRIMARY KEY (cod_propri)
);


-- Tabela Veículo
CREATE TABLE veiculo
(
	placa VARCHAR (15),
	modelo VARCHAR (30),
	ano_fabricacao DATE,
	CONSTRAINT pk_veiculo PRIMARY KEY (placa)
);


-- Tabela Físico
CREATE TABLE físico
(
	cod_propri INTEGER,
	cpf VARCHAR (15),
	CONSTRAINT pk_fisico PRIMARY KEY (cod_propri),
	CONSTRAINT fk_propriFis FOREIGN KEY (cod_propri) REFERENCES proprietário
);


-- Tabela Jurídico
CREATE TABLE jurídico
(
	cod_propri INTEGER,
	CNPJ VARCHAR (15),
	CONSTRAINT pk_juridico PRIMARY KEY (cod_propri),
	CONSTRAINT fk_propriJur FOREIGN KEY (cod_propri) REFERENCES proprietário
);