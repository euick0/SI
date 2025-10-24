DROP DATABASE IF EXISTS empresas;
CREATE DATABASE empresas;
USE empresas;

CREATE TABLE Empresas (
    EmpresaID INT PRIMARY KEY,
    Nome VARCHAR(100),
    ReceitaAnual DECIMAL(15, 2)
);

INSERT INTO Empresas (EmpresaID, Nome, ReceitaAnual) VALUES
(1,'Tech Solutions', 1500000.00),
(2, 'Health Corp', 2500000.00);
