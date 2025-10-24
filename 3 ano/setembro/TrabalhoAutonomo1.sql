drop database if exists Matriculas;
create database Matriculas;

use Matriculas;

create table Cursos(
    CodCurso int PRIMARY KEY ,
    NomeCurso varchar(50),
    CargaHoraria int
);

create table Alunos(
    CodAluno int PRIMARY KEY ,
    NomeAluno varchar(100),
    Morada varchar(150),
    CodCurso int,
    Idade int,
    FOREIGN KEY (CodCurso) REFERENCES Cursos(CodCurso)
);

create table Disciplinas(
    CodDisciplina int PRIMARY KEY ,
    NomeDisciplina varchar(50),
    CargaHoraria int
);

create table ALunos_Disciplinas(
    CodAluno int,
    CodDisciplina int,
    PRIMARY KEY (CodAluno, CodDisciplina),
    FOREIGN KEY (CodAluno) REFERENCES Alunos(CodAluno),
    FOREIGN KEY (CodDisciplina) REFERENCES Disciplinas(CodDisciplina)
);

insert into Cursos (CodCurso, NomeCurso, CargaHoraria) values
    (1, 'PIS', 3600),
    (2, 'PGI', 3000),
    (3, 'Artes', 3200),
    (4, 'Desporto', 3100),
    (5, 'CLL', 2800);

insert into Disciplinas (CodDisciplina, NomeDisciplina, CargaHoraria) values
    (10, 'Português', 120),
    (11, 'Algoritmos', 150),
    (12, 'Cálculo I', 90),
    (13, 'Álgebra Linear', 100),
    (14, 'Sistemas Operativos', 130),
    (15, 'Física I', 110);

insert into Alunos (CodAluno, NomeAluno, Morada, CodCurso, Idade) values
    (1, 'Alice Silva', 'Rua Nova', 1, 19),
    (2, 'Bruno Costa', 'Rua B 22', 1, 20),
    (3, 'Carla Mendes', 'Avenida Central 5', 2, 21),
    (4, 'Diego Ramos', 'Travessa Norte 8', 3, 22),
    (5, 'Eva Santos', 'Rua das Flores 12', 4, 20),
    (6, 'Filipe Lopes', 'Praça Sul 3', 1, 23);

insert into ALunos_Disciplinas (CodAluno, CodDisciplina) values
    (1, 10),
    (1, 11),
    (2, 10),
    (2, 14),
    (3, 10),
    (3, 12),
    (4, 12),
    (4, 13),
    (5, 15),
    (6, 10),
    (6, 11),
    (6, 14);



Select Count(Disciplinas.NomeDisciplina) as DisciplinasSemCarga from Disciplinas where CargaHoraria = 0;
Select * from Alunos order by idade desc limit 1;
Select Alunos.NomeAluno from Alunos order by Alunos.NomeAluno limit 1;
#carga horaria total do aluno de codigo 5;
Select AVG(Alunos.Idade) from alunos join ALunos_Disciplinas on Alunos.CodAluno = ALunos_Disciplinas.CodAluno where ALunos_Disciplinas.CodDisciplina = 10;
#Determinar, para cada CodCurso, a média das idades. Ordenar o resultado por ordem decrescente da média.
Select COUNT(Alunos.CodAluno) as TotalAlunos from Alunos;
Select * from Alunos order by idade limit 1;
SELECT AVG(Alunos.Idade) as MediaIdadeRuaNova FROM Alunos WHERE Alunos.Morada LIKE 'Rua Nova%';
Select Count(Cursos.NomeCurso) as TotalCursos from Cursos ;
Select Count(Cursos.NomeCurso) as TotalCursos from Cursos where Cursos.CargaHoraria > 0;
SELECT AVG(Alunos.Idade) as MediaIdade FROM Alunos where CodCurso = 1;
Select Count(Alunos.NomeAluno) from Alunos where Idade < 21;
#Determinar, para cada aluno do Curso Cientifico-humanistico de Linguas e Literaturas, o número de disciplinas em que está inscrito. A listagem deverá apresentar apenas os alunos inscritos em mais de uma disciplina. Ordenar o resultado por ordem decrescente do número de disciplinas
#Determinar o número de alunos inscritos por disciplina. Ordenar o resultado pelo número de alunos por ordem decrescente.
Select Alunos.Idade from Alunos order by Alunos.Idade limit 1;
#Determinar, para cada aluno do Curso Cientifico-humanistico de Linguas e Literaturas, o número de disciplinas em que está inscrito. Ordenar o resultado por ordem decrescente do número de disciplinas.
#Determinar, para cada CodCurso, a média das idades. A listagem deverá só apresentar os cursos com médias inferiores a 19. Ordenar o resultado por ordem decrescente da média.
Select Alunos.NomeAluno, Cursos.NomeCurso from Alunos    join Cursos on Alunos.CodCurso = Cursos.CodCurso order by Alunos.NomeAluno;