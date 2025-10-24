drop database if exists Eric_6;
create database Eric_6;

use Eric_6;

create table Clube (
    Nome_Clube varchar(50) PRIMARY KEY ,
    Morada varchar (150),
    Atividade varchar(50),
    Idade_Clube int );

create table Atleta (
    Nome_Atleta varchar(50) PRIMARY KEY ,
    BI varchar(50) UNIQUE,
    Idade_Atleta int,
    Valor_Passe int,
    telefone int(9));

create table Clube_Atleta (
    Nome_Clube varchar(50) ,
    Nome_Atleta varchar(50) ,
    PRIMARY KEY (Nome_Clube, Nome_Atleta),
    FOREIGN KEY (Nome_Clube) REFERENCES Clube(Nome_Clube),
    FOREIGN KEY (Nome_Atleta) REFERENCES Atleta(Nome_Atleta));

insert into Clube(Nome_Clube, Morada, Atividade, Idade_Clube) values
('Sporting','Alvalade','Futebol', 116),
('Águias','Estadio da Luz','Futebol', 118),
('Bracarense','Estadio do Bracarense','Futebol', 124);

insert into Atleta(Nome_Atleta, BI, Idade_Atleta, Valor_Passe, telefone) values
('Ronaldo','12345678', 39, 100000000, 912345678),
('Anselmo',NULL, 20, 120000000, 987654321),
('Neymar','11223344', 20, 95000000, NULL);

insert into Clube_Atleta(Nome_Clube, Nome_Atleta) values
('Sporting','Ronaldo'),
('Águias','Anselmo'),
('Bracarense','Neymar');

Select * from Atleta where Idade_Atleta < 25;
Select Atleta.Nome_Atleta, Clube_Atleta.Nome_Clube from Atleta join Clube_Atleta On Clube_Atleta.Nome_Atleta = Atleta.Nome_Atleta;
Select Count(*) as Total_Atletas from Clube_Atleta where Nome_Clube = 'Águias';
Select AVG(Valor_Passe) as MediaValor from Atleta join Clube_Atleta on Atleta.Nome_Atleta = Clube_Atleta.Nome_Atleta where Clube_Atleta.Nome_Clube = 'Bracarense';
Select Nome_Atleta from Atleta where Idade_Atleta = 20 and Nome_Atleta NOT IN (Select Nome_Atleta from Clube_Atleta where Nome_Clube= 'Bracarense');
Select Nome_Atleta from Atleta where telefone IS NULL;

Select * from Clube where Idade_Clube > 10;
Update Atleta Set Valor_Passe = 1000000 where Nome_Atleta = 'Neymar';
#Nao da para fazer este porque e uma chave estrangeira: Delete from Atleta where Idade_Atleta > 35;
Select * from Atleta where BI IS NULL;
Select * from Atleta where Nome_Atleta Like 'A%';
Select Clube_Atleta.Nome_Clube from Clube_Atleta group by Nome_Clube Having count(Nome_Atleta) > 3;
Select Atleta.Valor_Passe, Atleta.Nome_Atleta from atleta order by Atleta.Valor_Passe DESC;
Select * from atleta where Idade_Atleta >= 18 and Idade_Atleta <= 30;
Select Clube.Nome_Clube from Clube where Nome_Clube not in (Select distinct Nome_Clube from clube_atleta);
Select Atleta.Nome_Atleta, Clube_Atleta.Nome_Clube from Atleta join Clube_Atleta on Atleta.Nome_Atleta = Clube_Atleta.Nome_Atleta order by Clube_Atleta.Nome_Clube;