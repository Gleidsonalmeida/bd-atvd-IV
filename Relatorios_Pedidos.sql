CREATE DATABASE Pedidos;
USE Pedidos;

CREATE TABLE Cliente (
ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL UNIQUE,
Telefone VARCHAR(255) NOT NULL
);

INSERT INTO Cliente(Nome, Email, Telefone) 
VALUES ('Diogo', 'Diogo@gmail.com', "7198922-4002");
INSERT INTO Cliente(Nome, Email, Telefone) 
VALUES ('Gleidson', 'Gleidson@gmail.com', "7198922-4003");
INSERT INTO Cliente(Nome, Email, Telefone) 
VALUES ('Matheus', 'Matheus@gmail.com', "7198922-4004");
INSERT INTO Cliente(Nome, Email, Telefone) 
VALUES ('Guilherme', 'Guilherme@gmail.com', "7198922-4005");
INSERT INTO Cliente(Nome, Email, Telefone) 
VALUES('Jonas', 'Jonas@gmai.com', "7198922-4006");
 
 
CREATE TABLE Pedido (
ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Data_incio DATE NOT NULL,
Valor_total DOUBLE NOT NULL,
Cliente_ID INT NOT NULL,
FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID_Cliente)
);

INSERT INTO Pedido(Nome, Data_incio, Valor_total, Cliente_ID) 
VALUES ('Fone', '2004-02-03', 30.00, 1); 

CREATE VIEW relatorios_pedidos AS
SELECT C.Nome AS NomeCliente, COUNT(ID_Pedido) AS numeroPedido, SUM(Valor_total) AS ValorTotal_Gasto
FROM Cliente c
LEFT JOIN Pedido p ON c.ID_Cliente = p.Cliente_ID
GROUP BY c.Nome;
 
SELECT * FROM relatorios_pedidos_cliente;