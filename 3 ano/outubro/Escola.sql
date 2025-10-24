DROP DATABASE IF EXISTS Escola;
create database Escola;

use Escola;

create table Alunos(
    id int PRIMARY KEY ,
    nome varchar(50),
    turma varchar(50)
);

create table Professores(
    id int PRIMARY KEY,
    nome varchar(50),
    disciplinas varchar(50)
);

create table Notas(
    id_aluno int,
    id_professor int,
    nota varchar(50),
    PRIMARY KEY(id_aluno, id_professor),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id),
    FOREIGN KEY (id_professor) REFERENCES Professores(id)
);

insert into alunos (id, nome, turma) values (1, 'Eric', '3ºPIS');
insert into professores(id, nome, disciplinas) values (1, 'Eric', 'Matematica');

/*
Create user 'professor1' IDENTIFIED  by 'professor1';
Grant SELECT, Insert on Escola.Notas to 'professor1';
Create user 'secretaria' identified  by 'secretaria';
Grant SELECT, Insert on Escola.Alunos to 'secretaria';
Grant SELECT, Insert on Escola.Professores to 'secretaria';
create user 'direcao' identified  by 'direcao';
Grant all on Escola.* to 'direcao';

mysql -h localhost -u professor1
insert into notas(id_aluno, id_professor, nota) values(1,1,20);
Query OK, 1 row affected (0.002 sec)

delete from notas where id_aluno =1;
ERROR 1142 (42000): DELETE command denied to user 'professor1'@'localhost' for table `escola`.`notas`

Revoke Select On escola.professores from secretaria;
Drop user 'professor1';

1) É importante ter utilizadores com diferentes permissões porque garante a segurança da base de dados.
2) Quando todos os utilizadores têm todas as permissões, qualquer  pessoa poderia modificar e aceder a base de dados.
3) Grant da acesso a certas permissões a um utilizador, enquanto Revoke retira permissões a um utilizador.
*/


