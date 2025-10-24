DROP DATABASE IF EXISTS Ficha1;
CREATE DATABASE Ficha1;

USE Ficha1;

CREATE TABLE EQUIPAS (
    e_numero INT NOT NULL PRIMARY KEY,
    e_nome TEXT(20),
    e_cidade TEXT(20),
    e_diretor TEXT(50)
);

INSERT INTO EQUIPAS (e_numero, e_nome, e_cidade, e_diretor) VALUES
    (12, 'Académico', 'Porto', 'Mário'),
    (15, 'Universitário', 'Coimbra', 'João'),
    (20, 'Juventude', 'Braga', 'Silva'),
    (24, 'Tigres', 'Espinho', 'Cardoso');

CREATE TABLE TREINADORES (
    t_numero INT NOT NULL PRIMARY KEY,
    t_nome TEXT(50),
    t_telefone INT,
    t_equipa INT
);

INSERT INTO TREINADORES (t_numero, t_nome, t_telefone, t_equipa) VALUES
    (1, 'António', 5551524, 12),
    (2, 'Barbosa', 5553690, 12),
    (3, 'Tavares', 5554820, 15),
    (4, 'Joaquim', 5552444, 20),
    (5, 'Vítor', 5559327, 24),
    (6, 'Duarte', 5557321, 24);

CREATE TABLE EXPERIÊNCIA (
    ex_equipa INT NOT NULL,
    ex_treinador INT,
    ex_tipo TEXT(20),
    ex_anos INT
    );

INSERT INTO EXPERIÊNCIA (ex_equipa, ex_treinador, ex_tipo, ex_anos) VALUES
    (12, 1, 'juniores', 10),
    (12, 1, 'seniores', 5),
    (12, 2, 'iniciados', 2),
    (12, 2, 'juniores', 3),
    (12, 2, 'juvenis', 4),
    (15, 3, 'juniores', 15),
    (24, 5, 'juvenis', 12);

CREATE TABLE BOLAS (
    b_equipa INT NOT NULL,
    b_ref INT,
    b_fabricante TEXT(20)
);

INSERT INTO BOLAS (b_equipa, b_ref, b_fabricante) VALUES
    (12, 1, 'Adidas'),
    (12, 9, 'Reebok'),
    (12, 13, 'Adidas'),
    (15, 1, 'Adidas'),
    (20, 3, 'Olimpic'),
    (20, 4, 'Nike'),
    (24, 18, 'Reebok'),
    (24, 21, 'Olimpic');

CREATE TABLE JOGADORES (
    j_numero INT NOT NULL PRIMARY KEY,
    j_nome TEXT(50),
    j_idade INT
);

INSERT INTO JOGADORES (j_numero, j_nome, j_idade) VALUES
    (358, 'Silva', 21),
    (523, 'David', 32),
    (1131, 'Joaquim', 28),
    (1779, 'João', 25),
    (2007, 'Domingos', 27),
    (4280, 'Carlos', 25),
    (4319, 'Rui', 24),
    (5410, 'Santos', 27),
    (6564, 'Luis', 24),
    (8093, 'Santos', 21),
    (8366, 'Gomes', 33);

CREATE TABLE FILIAÇÃO (
    f_jogador INT NOT NULL,
    f_equipa INT NOT NULL,
    f_anos INT,
    f_media DECIMAL(4,3),
    PRIMARY KEY (f_jogador, f_equipa)
);

INSERT INTO FILIAÇÃO (f_jogador, f_equipa, f_anos, f_media) VALUES
    (358, 15, 5, 0.3),
    (358, 20, 3, 0.32),
    (523, 12, 10, 0.257),
    (1131, 20, 1, 0.283),
    (1779, 12, 1, 0.223),
    (1779, 15, 7, 0.246),
    (1779, 24, 2, 0.24),
    (2007, 24, 3, 0.29),
    (4280, 15, 1, 0.195),
    (4280, 20, 3, 0.227),
    (4319, 15, 4, 0.298),
    (5410, 12, 6, 0.307),
    (6564, 20, 12, 0.31),
    (6564, 24, 3, 0.28),
    (8093, 12, 5, 0.25),
    (8093, 20, 2, 0.24),
    (8093, 24, 8, 0.265),
    (8366, 20, 7, 0.283);



select  * from  EQUIPAS;
select * from EQUIPAS where e_numero = 12;
select  EQUIPAS.e_numero, EQUIPAS.e_nome from EQUIPAS;
select  JOGADORES.j_idade, JOGADORES.j_nome from JOGADORES where j_idade >30;

SELECT TREINADORES.t_nome FROM  TREINADORES, EXPERIÊNCIA WHERE ex_tipo = 'juniores' and ex_anos >= 5;

select * FROM EXPERIÊNCIA where ex_tipo = 'juniores' or ex_anos > 10;
select BOLAS.b_equipa FROM BOLAS where b_fabricante = 'Adidas';
select * FROM BOLAS where b_fabricante = 'Reebok' or b_fabricante = 'Olimpic';
select * From JOGADORES where LEFT(j_nome, 1) = 'S';
select j_nome, j_idade from JOGADORES where j_idade < 30 and j_idade > 20;
select j_nome from JOGADORES where LEFT(j_nome, 1) = 'S' and Right(j_nome, 1) = 'a';
