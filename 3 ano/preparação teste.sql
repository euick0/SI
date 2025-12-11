Drop database if exists teste_preparacao;
create database teste_preparacao;
use teste_preparacao;

create table Clientes(
    ID_Cliente int primary key,
    Nome       varchar(100),
    NIF        int
);

create table Produtos(
    ID_Produto int primary key,
    Preco      float,
    Nome_Produto  varchar(100)
);

create table Encomendas(
    ID_Cliente int,
    ID_Produto int,
    Qunatidade int,
    PRIMARY KEY (ID_Cliente, ID_Produto),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID_Produto)
);

