/* 1 */
CREATE TABLE curso (
	idCurso INTEGER,
	nomeCurso VARCHAR(30),
	nroSemestres INTEGER,
	dtaFundacao date,
	CONSTRAINT pk_idCurso PRIMARY KEY (idCurso)
);

CREATE TABLE aluno (
	prontuario VARCHAR(30),
	nome VARCHAR(30),
	dtaNasc DATE,
	sexo CHAR(1),
	idCurso INTEGER, /* Chave estrangeira vinda da tabela CURSO */
	CONSTRAINT pk_prontuario PRIMARY KEY (prontuario),
	CONSTRAINT fk_aluno_curso FOREIGN KEY (idCurso) REFERENCES curso
);


/* 2 */
INSERT INTO curso (idCurso, nomeCurso, nroSemestres, dtaFundacao)
	VALUES (1, 'Ciênciada Computação', 8, '01/03/1986'),
	       (2, 'Direito', 8, '14/12/1975'),
		   (3, 'Medicina', 12, '05/07/2000'),
		   (4, 'Engenharia Elétrica', 10, '10/12/1996'),
		   (5, 'Biologia', 8, '06/06/1993'),
		   (6, 'Matemática', 8, '01/07/1968');
		   

INSERT INTO aluno (prontuario, nome, dtaNasc, sexo, idCurso)
	VALUES ('11aa', 'Paulo', '01/07/1986', 'M', 1),
	       ('11bb', 'Ana', '08/07/1990', 'F', 5),
		   ('11cc', 'Júlio', '08/05/1980', 'M', 3),
		   ('11dd', 'Carlos', '10/11/1983', 'M', 2),
		   ('11ee', 'Gabriele', '08/05/1990', 'F', 3),
		   ('11ff', 'Ântonio', '15/06/1955', 'M', 4),
		   ('11gg', 'Ana', '08/12/1975', 'F', 5),
		   ('11hh', 'Mara', '07/07/1970', 'F', 1),
		   ('11ii', 'Roberto', '01/07/1956', 'M', 3),
		   ('11jj', 'Carmen', '03/02/1950', 'F', 2);
		   
		   
/* 3 */
INSERT INTO aluno (prontuario, nome, dtaNasc, sexo, idCurso)
	VALUES ('11kk', 'Pedro Roberto', '11/01/2000', 'M', 3);
	
	
/* 4 */
DELETE FROM curso
	WHERE idCurso = 2; 
	
/* Não dará certo, pois o curso de direito está associado à alunos da tabela ALUNO, então seria necesário
excluir todos os alunos da tabela ALUNO antes, e somente depois excluir o curso, pois assim, o mesmo não
estará associado mais nenhum aluno. */


/* 5 */
DELETE FROM aluno
	WHERE idCurso = 2;
	
	
/* 6 */
DELETE FROM curso
	WHERE idCurso = 2;
	
/* Agora sim dará certo, pois o curso de Direito não possui mais nenhuma ligação com a tabela ALUNO já
que os alunos que faziam Direito foram deletados. */


/* 7 */
UPDATE curso SET idCurso = 10
	WHERE idCurso = 3;
	
/* Não dará para alterar, porque a tabela CURSO está se relacionando com a tabela ALUNO através do idCurso(chave estrangeira)*/


/* 8 */
UPDATE aluno SET nome = 'Ana Paula'
	WHERE prontuario = '11gg';


