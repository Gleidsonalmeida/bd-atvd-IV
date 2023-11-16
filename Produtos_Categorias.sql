CREATE DATABASE Relatorio_Prod;
USE Relatorio_Prod;

CREATE TABLE Categorias(
ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL, 
Descricao VARCHAR(255) NOT NULL
);

INSERT INTO Categorias (ID_Categoria, Nome, Descricao)
VALUES (1, 'Tecnologia', 'Sei la');
INSERT INTO Categorias (ID_Categoria, Nome, Descricao) 
VALUES (2, 'Tecnologia', 'Sei la');
INSERT INTO Categorias (ID_Categoria, Nome, Descricao) 
VALUES (3, 'Tecnologia', 'Sei la');
    
    
CREATE TABLE Produtos(
ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
Categoria_ID INT NOT NULL,
FOREIGN KEY (Categoria_ID) REFERENCES Categorias(ID_Categoria),
Nome VARCHAR(255) NOT NULL, 
Preco_unitario DOUBLE NOT NULL
);

INSERT INTO Produtos (ID_Produto, Nome, Preco_unitario, Categoria_ID) 
VALUES (1, 'Fone', 30.00, 1);
INSERT INTO Produtos (ID_Produto, Nome, Preco_unitario, Categoria_ID) 
VALUES (2, 'Monitor', 750.00, 2);
INSERT INTO Produtos (ID_Produto, Nome, Preco_unitario, Categoria_ID) 
VALUES (3, 'Mouse', 35.00, 1);
   

CREATE VIEW relatorio_produtos AS
SELECT c.Nome AS nome_categoria, COUNT(p.ID_Produto) AS quantidade_de_produtos
FROM Categorias c
LEFT JOIN Produtos p ON c.ID_Categoria = p.Categoria_ID
GROUP BY c.Nome;

SELECT * FROM relatorio_produtos;