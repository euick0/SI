DROP DATABASE IF EXISTS Pessoal;
CREATE database Pessoal;

use Pessoal;

create table contactos(
    Nome varchar(100) not null,
    Telefone varchar(20),
    Email varchar(100),
    PRIMARY KEY (Nome)
);
