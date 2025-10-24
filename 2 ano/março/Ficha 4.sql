/*  1)  O select serve para fazer consultas da base de dados
2)* - Especifica que todos os campos de uma determinada tabela ou consulta devem ser selecionados
Tabela - 	Nome da tabela ou consulta de onde são selecionados os campos
Campo - Nome dos campos a serem selecionados
Alias - Um nome específico para o campo. Na Folha de Dados o nome aparece como o título da coluna
tableexpression	- Nome da tabela de onde os campos serão selecionados
externaldatabase -Nome da Base de Dados que contém a tabela, caso não seja a base de dados atual

3) Select all seleciona todas os campos de uma tabela, enquanto que select distcint seleciona os campos sem repetições
    */
DROP DATABASE IF EXISTS FICHA4;
CREATE DATABASE FICHA4;
USE FICHA4;

CREATE TABLE VENDAS (
    e_cod INT PRIMARY KEY,
    e_nome CHAR(50) NOT NULL,
    e_data DATE NOT NULL,
    e_produto CHAR(50) NOT NULL,
    e_preço DECIMAL(10,2) NOT NULL
);

INSERT INTO VENDAS (e_cod, e_nome, e_data, e_produto, e_preço) VALUES
    (1, 'Joaquim', '2008-11-12', 'Calças', 50),
    (2, 'Joaquim', '2008-11-12', 'Camisa', 35),
    (3, 'Fátima', '2008-11-16', 'Calças', 50),
    (4, 'António', '2008-11-16', 'Calças', 50),
    (5, 'Fátima', '2008-11-18', 'Botas', 80);

CREATE TABLE Cliente (
    c_id INT PRIMARY KEY,
    c_nome CHAR(100),
    c_endereco CHAR(100),
    c_telefone CHAR(20)
);

CREATE TABLE Produto (
    p_id INT PRIMARY KEY,
    p_nome CHAR(100),
    p_modelo CHAR(50),
    p_preco DECIMAL
);

CREATE TABLE Encomenda (
    e_id INT PRIMARY KEY,
    e_c_id INT,
    e_p_id INT,
    e_data DATE,
    e_quant INT
);

INSERT INTO Cliente (c_id, c_nome, c_endereco, c_telefone) VALUES
    (11, 'Silva', 'Lisboa', '21676978'),
    (12, 'Santos', 'Porto', '224650899'),
    (13, 'Costa', 'Coimbra', '236808787'),
    (14, 'Castro', 'Faro', '289443677'),
    (15, 'Antunes', 'Porto', '226879000'),
    (16, 'Andrade', 'Espinho', '226760775'),
    (17, 'Pinto', 'Lisboa', '214675689'),
    (18, 'Pato', 'Coimbra', '234765969'),
    (19, 'Prata', 'Lisboa', '216697897'),
    (20, 'Bento', 'Aveiro', '234895657');

INSERT INTO Produto (p_id, p_nome, p_modelo, p_preco) VALUES
    (101, 'Martelo', 'M1', 2.50),
    (111, 'Alicate', 'A1', 2.70),
    (121, 'Tesoura', 'T1', 5.00),
    (131, 'Serra', 'S1', 50.00),
    (141, 'Serrote', 'S2', 10.00),
    (151, 'Arame', 'A2', 15.00);

INSERT INTO Encomenda (e_id, e_c_id, e_p_id, e_data, e_quant) VALUES
    (1, 11, 111, '2005-08-12', 5),
    (2, 12, 101, '2005-08-21', 10),
    (3, 12, 131, '2005-09-23', 2),
    (4, 13, 121, '2005-09-30', 5),
    (5, 14, 121, '2005-10-03', 5),
    (6, 15, 101, '2005-10-01', 10),
    (7, 15, 111, '2005-11-25', 5),
    (8, 15, 141, '2005-11-25', 4),
    (9, 16, 121, '2005-11-20', 7),
    (10, 16, 131, '2005-11-20', 10),
    (11, 17, 141, '2005-12-28', 5),
    (12, 17, 151, '2005-11-10', 1),
    (13, 18, 121, '2005-12-10', 21),
    (14, 18, 151, '2005-12-03', 7),
    (15, 19, 111, '2005-12-03', 10),
    (16, 20, 101, '2005-11-30', 8),
    (17, 20, 131, '2005-12-10', 12);

SELECT c_nome FROM Cliente;
SELECT p_modelo FROM Produto;
SELECT * FROM Produto;
SELECT c_endereco, c_telefone FROM Cliente;
SELECT p_nome, p_preco FROM Produto;
SELECT e_data, e_quant FROM Encomenda;

SELECT Produto.p_nome, Encomenda    .e_data
FROM Produto
JOIN Encomenda  ON Produto.p_id = Encomenda.e_p_id
JOIN Cliente ON Cliente.c_id = Encomenda.e_c_id;

SELECT * FROM Produto;
SELECT DISTINCT c_endereco FROM Cliente;
