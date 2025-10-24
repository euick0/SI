DROP DATABASE IF EXISTS FICHA5;
CREATE DATABASE FICHA5;
USE FICHA5;

CREATE TABLE Vencimentos (
    Cod_Venc INT PRIMARY KEY,
    Salario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Equipas (
    Cod_Equipa INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data DATE
);

CREATE TABLE Jogadores (
    Cod_Jogador INT PRIMARY KEY,
    Numero INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Idade INT,
    Cod_Venc INT,
    Cod_Equipa INT
);


-- a) Qual a média de idades dos jogadores?
SELECT AVG(Idade) AS MediaIdadesJogadores FROM Jogadores;

-- b) Qual o maior salário?
SELECT MAX(Salario) AS MaiorSalario FROM Vencimentos;

-- c) Qual a equipa mais antiga?
SELECT MIN(Data) AS EquipaMaisAntiga FROM Equipas;

-- d) E qual foi formada mais recentemente?
SELECT MAX(Data) AS EquipaMaisRecente FROM Equipas;

-- e) Quantos jogadores existem?
SELECT COUNT(*) AS NumeroJogadores FROM Jogadores;

-- f) E quantas equipas?
SELECT COUNT(*) AS NumeroEquipas FROM Equipas;

-- g) Qual a idade do jogador mais novo?
SELECT MIN(Idade) AS IdadeJogadorMaisNovo FROM Jogadores;
