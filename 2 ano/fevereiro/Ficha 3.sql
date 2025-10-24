DROP DATABASE IF EXISTS BANDAS;
CREATE DATABASE BANDAS;

USE BANDAS;

create table ARTISTAS(
                         cod_artista int auto_increment primary key,
                         nome char(20),
                         nacionalidade char(25),
                         idade int(2)
);

create table TIPO_MUSICAS(
                             cod_tipo int auto_increment primary key,
                             tipo char(20)
);

create table MUSICAS(
                        cod_musica int auto_increment primary key,
                        nome char(30),
                        cod_artista int references
                            Artistas(cod_artista),
                        cod_tipo int references Tipo_Musicas(cod_tipo)
);

insert into ARTISTAS (cod_artista, nome, nacionalidade, idade) VALUES
   (1,'Linda de Suza', 'Portuguesa', 55),
   (2,'José Afonso', 'Portuguesa', 25),
   (3,'Richard Miller', 'Americana', 40),
   (4,'Celine Dion', 'Canadiana', 44),
   (5,'Michael Bocelli', 'Italiana', 38),
   (6,'Adolfo', 'Francesa', 25),
   (7,'Max', 'Alemã', 30),
   (8,'Brandt', 'Alemã', 35),
   (9,'Brad Presley', 'Americana', 30),
   (10,'Vassilis', 'Grega', 60);

insert into TIPO_MUSICAS (cod_tipo, tipo) VALUES
    (1,'Rock'),
    (2,'Romântica'),
    (3,'Jazz'),
    (4,'Clássica'),
    (5,'Pop'),
    (6,'Folk');

insert into MUSICAS (cod_musica, nome, cod_artista, cod_tipo) VALUES
    (1,'Um Português',1,2),
    (2,'Marinheiro',1,2),
    (3,'Canção do mar',2,6),
    (4,'Coro dos caídos',2,6),
    (5,'In the Moon',3,3),
    (6,'Moon Love',3,3),
    (7,'Tell him',4,5),
    (8,'The reason',4,5),
    (9,'Love Tender',9,1),
    (10,'Angel',9,1),
    (11,'Eine Kleine Nachmusik',7,4),
    (12,'Para Elisa',8,4);

update ARTISTAS set nome = 'Ana Moura' where nome = 'Linda de Suza';

ALTER TABLE ARTISTAS ADD email char(20) NOT NULL;
ALTER TABLE ARTISTAS CHANGE COLUMN nacionalidade origem char(20) NOT NULL;
ALTER TABLE  ARTISTAS DROP COLUMN email;
DELETE FROM TIPO_MUSICAS where tipo = 'Romântica';

SELECT * FROM ARTISTAS WHERE origem = 'Americana';
SELECT * FROM ARTISTAS WHERE origem != 'Portuguesa';
SELECT ARTISTAS.nome from ARTISTAS where idade > 30;
SELECT ARTISTAS.nome from ARTISTAS where idade > 30 and idade < 45;
SELECT * FROM TIPO_MUSICAS WHERE tipo LIKE '%a';
SELECT * FROM TIPO_MUSICAS WHERE LENGTH(tipo) = 4;
SELECT * FROM MUSICAS WHERE cod_artista = 1;


SELECT MUSICAS.nome AS Musica, TIPO_MUSICAS.tipo AS Tipo, ARTISTAS.nome AS Artista
FROM MUSICAS
         JOIN ARTISTAS ON MUSICAS.cod_artista = ARTISTAS.cod_artista
         JOIN TIPO_MUSICAS ON MUSICAS.cod_tipo = TIPO_MUSICAS.cod_tipo;