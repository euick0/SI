DROP DATABASE IF EXISTS FICHA5;
CREATE DATABASE FICHA5;
USE FICHA5;


CREATE TABLE CURSO (
    C_ID INT PRIMARY KEY,
    C_NOME VARCHAR(100) NOT NULL,
    C_CARGA_HORARIA INT NOT NULL
);

CREATE TABLE ALUNO (
    A_ID INT PRIMARY KEY,
    A_NOME VARCHAR(100) NOT NULL,
    A_MORADA VARCHAR(100) NOT NULL,
    A_DN DATE,
    A_NUM_BI VARCHAR(20) NOT NULL,
    A_C_ID INT NOT NULL,
    FOREIGN KEY (A_C_ID) REFERENCES CURSO(C_ID)
);

CREATE TABLE DISCIPLINA (
    D_ID INT PRIMARY KEY,
    D_NOME VARCHAR(100) NOT NULL,
    D_CARGA_HORARIA INT NOT NULL
);

INSERT INTO CURSO (C_ID, C_NOME, C_CARGA_HORARIA) VALUES
    (33, 'Curso Geral de Ciências Naturais', 54),
    (23, 'Curso Geral de Artes Visuais', 54),
    (37, 'Curso Geral de Ciências Sociais e Humanas', 54),
    (15, 'Curso Geral de Línguas e Literaturas', 54),
    (46, 'Curso Tecnológico de Construção Civil', 90),
    (89, 'Curso Tecnológico de Desporto', 90),
    (39, 'Curso Tecnológico de Informática', 90);

INSERT INTO ALUNO (A_ID, A_NOME, A_MORADA, A_DN, A_NUM_BI, A_C_ID) VALUES
    (13, 'António Pereira', 'Rua Rainha nº 13', '1984-02-28', '12345675', 33),
    (18, 'Jorge Almeida', 'Rua Nova nº 190', '1985-02-08', '9876543', 23),
    (16, 'Anabela Pires', 'Rua Velha nº 5', '1986-01-14', '1287458', 23),
    (1, 'Afonso Sampaio', 'Rua Almeida nº 9', NULL, '13568934', 37),
    (4, 'Adélia Almirante', 'Rua da Alegria nº 7', '1989-04-15', '9985374', 46),
    (9, 'António Pereira', 'Rua Torta nº256', '1985-02-05', '13468906', 37),
    (15, 'José Aguiar', 'Rua Aha Mia nº75', '1983-02-17', '14579001', 37),
    (6, 'Vitorino Forte', 'Rua Verde nº 222', '1988-08-05', '1345679', 89),
    (23, 'Andreia Santos', 'Rua Milhares nº 347', '1986-07-24', '18965421', 23),
    (17, 'Marta Fonseca', 'Rua Velha nº18', '1988-10-11', '13567888', 15),
    (2, 'Mário Santos', 'Rua Triste nº56', '1989-11-15', '14455664', 89),
    (8, 'Diogo Mota', 'Rua Silva nº89', '1985-09-04', '123336656', 33),
    (3, 'Ana Marques', 'Rua da Alegria nº33', NULL, '132434343', 37);

INSERT INTO DISCIPLINA (D_ID, D_NOME, D_CARGA_HORARIA) VALUES
    (408, 'Desenho e Geometria Descritiva A', 4),
    (409, 'Desenho e Geometria Descritiva B', 4),
    (110, 'Desenho Técnico de Construção Civil', 3),
    (247, 'Espanhol', 3),
    (114, 'Filosofia', 3),
    (115, 'Física', 4),
    (217, 'Francês', 3),
    (119, 'Geografia', 4),
    (120, 'Geologia', 4),
    (123, 'História', 4),
    (250, 'Inglês', 3),
    (130, 'Introdução à Economia', 3),
    (128, 'Introdução ao Desenvolvimento Económico-social', 3),
    (129, 'Introdução ao Direito', 3),
    (138, 'Português', 3),
    (140, 'Psicologia', 4),
    (142, 'Química', 4),
    (144, 'Sociologia', 4),
    (201, 'Alemão', 3),
    (102, 'Biologia', 3),
    (99, 'Educação Física', 3);

#1. Qual a carga horária do Curso Geral de Ciências Sociais e Humanas.
Select CURSO.C_CARGA_HORARIA from CURSO where C_NOME = 'Curso Geral de Ciências Sociais e Humanas';
#2. Mostre o número, nome e BI dos alunos cujo número seja superior ou igual a 5.
Select A_ID, A_NOME, A_NUM_BI from ALUNO where A_ID >= 5;
#3. Mostre o número, o nome, a morada e a data de nascimento do aluno n.º13.
Select ALUNO.A_ID, ALUNO.A_NOME, ALUNO.A_MORADA, ALUNO.A_DN from ALUNO where A_ID = 13;
#4. Consulte a morada, BI e data de nascimento da aluna Ana Marques.
SELECT ALUNO.A_MORADA, ALUNO.A_NUM_BI, ALUNO.A_DN from ALUNO where A_NOME = 'Ana Marques''';
#5. Mostre os nomes dos alunos cujo primeiro nome começa por um “A”.
Select A_NOME from ALUNO where A_NOME like 'A%';
#6. Mostre as disciplinas cujo código seja superior a 100 e inferior a 300.
SELECT DISCIPLINA.D_NOME from DISCIPLINA where D_ID > 100 and D_ID < 300;
#7. Quais as disciplinas que começam por “I”.
SELECT DISCIPLINA.D_NOME from DISCIPLINA where DISCIPLINA.D_NOME like 'I%';
#8. Mostre as disciplinas que começam a partir do “P”.
SELECT DISCIPLINA.D_NOME from DISCIPLINA where D_NOME like  'P%';
#9. Quais são os cursos Tecnológicos.
SELECT * From CURSO where C_NOME like 'Curso Tecnológico%';
#10. Quais os alunos que nasceram entre 01-01-1985 e 31-12-1988.
Select * from ALUNO where A_DN between '1985-01-01' and '1988-12-31';
#11. Quais os alunos que têm o número do BI entre 13000000 e 15000000.
Select * from Aluno where A_NUM_BI between  13000000 and 15000000;
#12. Mostre as disciplinas que contêm as letras “ra” no nome.
Select DISCIPLINA.D_NOME FROM DISCIPLINA WHERE D_NOME like '%ra%';
#13. Qual o código do Curso Tecnológico de Informática.
select  C_ID from CURSO where C_NOME = 'Curso Tecnológico de Informática';
#14. Quais as disciplinas que existem.
select DISCIPLINA.D_NOME from DISCIPLINA;
#15. Quais os alunos que moram na “Rua da Alegria”.
select ALUNO.A_NOME from ALUNO where A_MORADA like 'Rua da Alegria%';
#16. Mostre o nome e BI dos alunos cujo número de bilhete de identidade esteja entre 13000000 e
#200000000.
Select A_NOME, A_NUM_BI from ALUNO where A_NUM_BI between 13000000 and 200000000;
#17. Quais os alunos que têm no nome as letras “sa”.
Select A_NOME from ALUNO where A_NOME like '%sa%';
#18. Qual o número, o nome e a morada dos alunos que não têm o campo da data de nascimento
#preenchido
Select A_ID, A_NOME, A_MORADA from ALUNO where A_DN is NULL;
#19. Mostre o número, o nome, a morada, a data de nascimento e o BI dos alunos “António Pereira” e
#“Jorge Almeida”.*/
Select * from ALUNO where A_NOME = 'António Pereira' or A_NOME = 'Jorge Almeida';