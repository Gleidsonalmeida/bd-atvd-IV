CREATE DATABASE Relatorio_Pay;
USE Relatorio_Pay;

CREATE TABLE Clientes (
ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Endereco VARCHAR(255) NOT NULL,
Cidade VARCHAR(255) NOT NULL
);

INSERT INTO Clientes (ID_Cliente, Nome, Endereco, Cidade) 
VALUES (1, 'João', 'Rua dos Beija Flores', 'Salvador');
INSERT INTO Clientes (ID_Cliente, Nome, Endereco, Cidade) 
VALUES (2, 'Pedro', 'Rua da Saudade', 'Conde');
INSERT INTO Clientes (ID_Cliente, Nome, Endereco, Cidade) 
VALUES (3, 'Thalita', 'Ruas dos Antes', 'Barra Itariri');
INSERT INTO Clientes (ID_Cliente, Nome, Endereco, Cidade) 
VALUES (4, 'Maria', 'Rua das Gaivotas', 'Arembepe');
INSERT INTO Clientes (ID_Cliente, Nome, Endereco, Cidade) 
VALUES (5, 'Camila', 'Rua das Flores', 'Jauá');

 CREATE TABLE Pagamentos (
ID_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
Cliente_ID INT NOT NULL,
FOREIGN KEY (Cliente_ID) REFERENCES Clientes(ID_Cliente),
Data_pagamento DATE NOT NULL,
Valor_pagamento DOUBLE NOT NULL
);

INSERT INTO Pagamentos (ID_Pagamento, Cliente_ID, Data_pagamento, Valor_pagamento)
VALUES (1, 1, '2023-03-08', 300.00);
INSERT INTO Pagamentos (ID_Pagamento, Cliente_ID, Data_pagamento, Valor_pagamento) 
VALUES (2, 1, '2023-03-08', 300.50);
INSERT INTO Pagamentos (ID_Pagamento, Cliente_ID, Data_pagamento, Valor_pagamento) 
VALUES (3, 2, '2023-03-08', 300.00);
INSERT INTO Pagamentos (ID_Pagamento, Cliente_ID, Data_pagamento, Valor_pagamento) 
VALUES (4, 3, '2023-03-08', 300.00);
INSERT INTO Pagamentos (ID_Pagamento, Cliente_ID, Data_pagamento, Valor_pagamento) 
VALUES (5, 4, '2023-03-08', 300.00); 
    
CREATE VIEW relatorios_pagamentos AS
SELECT c.Cidade AS nome_cidade, SUM(p.Valor_pagamento) AS valor_total_pagamentos
FROM Clientes c
LEFT JOIN Pagamentos p ON c.ID_Cliente = p.Cliente_ID
GROUP BY c.Cidade;   
    
SELECT * FROM relatorios_pagamentos;    