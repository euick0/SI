DROP DATABASE IF EXISTS Clientes;
Create DATABASE  Clientes;
\c Clientes;


CREATE TABLE Clientes (
    NIF INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    DataNascimento DATE,
    EmpresaID INT
);

INSERT INTO Clientes (NIF, Nome, Email, DataNascimento, EmpresaID) VALUES
(123456789, 'João Silva', 'joao.silva@example.com', '1985-06-15', 1),
(987654321, 'Maria Santos', 'maria.santos@example.com', '1990-09-23', 2),
(456789123, 'Pedro Costa', 'pedro.costa@example.com', '1978-12-05', 1);

SELECT
    Clientes.Nome,
    empresas.empresas.Nome
FROM
    Clientes
JOIN 
    empresas.empresas ON Clientes.EmpresaID = empresas.empresas.EmpresaID;


