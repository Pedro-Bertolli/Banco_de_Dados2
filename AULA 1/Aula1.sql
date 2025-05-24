/* Criando a tabela ALUNO */
CREATE TABLE aluno (
	prontuario VARCHAR(15),
	nomeAluno VARCHAR(40) NOT NULL,
	idade INTEGER,
	CONSTRAINT pk_aluno PRIMARY KEY(prontuario)
);


/* Selecionar a tabela ALUNO para ver os dados */
SELECT * FROM ALUNO; /* O * mostra todos os dados da tabela */


/* Inserir dados(mais de um) na tabela ALUNO especificando a ordem de cada dado */
INSERT INTO aluno (prontuario, nomeAluno, idade)
	VALUES ('12AB', 'Pedro Antônio', 20),
		   ('13CD', 'Ana Vasconcelos', 21),
		   ('14EF', 'Thiago Alves', 19),
		   ('15GH', 'Marcela Silva', 20);


/* Deletar todos os dados da tabela ALUNO */
DELETE FROM aluno;


/* Deletar dados específicos da tabela ALUNO, utilizando o WHERE */
DELETE FROM aluno 
	WHERE idade = 20;


/* Atualiza todos dados da tabela ALUNO */
UPDATE aluno SET idade = 22;


/* Atualiza dados específicos da tabela ALUNO, utilizando uma condição WHERE */
UPDATE aluno SET idade = 22
	WHERE prontuario = '13CD';


/* 
Alterar a chave primária da tabela:

ALTER TABLE aluno DROP CONSTRAINT pk_aluno;

ALTER TABLE aluno ADD CONSTRAINT pk_novachave 
*/

