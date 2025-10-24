#cd mysql/bin
#mysql -h localhost -u root

DROP DATABASE IF EXISTS Eencomendas6;
CREATE database Eencomendas6;

use Eencomendas6;

create table Produtos(
    Sid_produto int primary key,
    Snome varchar(255),
    Spreco float,
    Sdata date
);

create table Clientes (
  Snumero_contribuinte int primary key,
  Snome varchar(255),
  Sendereco varchar(255),
  Stelefone varchar(255)
);

create table Encomendas(
    Snumero_encomenda int primary key,
    Sdata_encomenda date,
    Snumero_contribuinte int,
    FOREIGN KEY (Snumero_contribuinte) REFERENCES clientes(Snumero_contribuinte)
);

create table SDetalhes_Encomendas(
    Snumero_encomenda int,
    Sid_produto int,
    Squantidade int,
    FOREIGN KEY (Snumero_encomenda) REFERENCES Encomendas(Snumero_encomenda),
    FOREIGN KEY (Sid_produto) REFERENCES Produtos(Sid_produto)
);

insert into produtos (sid_produto, snome, spreco, sdata) values
    (1, 'Telemóvel', 299.99, '2024-01-15'),
    (2, 'Portátil', 799.99, '2024-02-20');

insert into clientes (snumero_contribuinte, snome, sendereco, stelefone) values
    (10293581, 'João', 'Rua dos Picanhas', '913457364'),
    (48114356, 'Afonso', 'Rua dos Piranhas', '91435735');

insert into encomendas (snumero_encomenda, sdata_encomenda, snumero_contribuinte) values
    (1, '2024-01-15', 10293581),
    (2, '2024-02-20', 48114356);

insert into sdetalhes_encomendas (snumero_encomenda, sid_produto, squantidade) values
    (1, 2, 8),
    (2, 1, 6);

create user 'cliente1'@localhost identified by 'cliente1';
grant select on Eencomendas6.* to 'cliente1'@localhost;
flush privileges;
create user 'vendedor1'@localhost identified by 'vendedor123';
grant select, insert, update on Eencomendas6.* to 'vendedor1'@localhost;
flush privileges;
create user 'admin1'@localhost identified by 'admin123';
grant select, insert, update on Eencomendas6.* to 'admin1'@localhost;
flush privileges;


create user 'leitor2' identified by 'leitor2';
grant select on Eencomendas6.* to 'leitor2'@localhost;
create user 'editor2' identified by 'editor2';
grant insert, update on Eencomendas6.* to 'editor2'@localhost;
create user 'admin2' identified by 'admin2';
grant all on Eencomendas6.* to 'admin2'@localhost;
flush privileges;
