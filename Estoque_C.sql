CREATE DATABASE EstoqueC;
USE Loja;

CREATE TABLE Produto (
ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Preco_unitario DOUBLE NOT NULL,
Categoria VARCHAR(255) NOT NULL
);

INSERT INTO Produto (ID_Produto, Nome, PrecoUnitario, Categoria) 
VALUES (1, 'Fone', 40.00, 'Tecnologia');
INSERT INTO Produto (ProdutoId, Nome, PrecoUnitario, Categoria) 
VALUES (2, 'Mouse', 30.00, 'Tecnologia');
INSERT INTO Produto (ProdutoId, Nome, PrecoUnitario, Categoria) 
VALUES (3, 'Computador', 5.000, 'Tecnologia');
INSERT INTO Produto (ProdutoId, Nome, PrecoUnitario, Categoria) 
VALUES (4, 'Teclado', 25.00, 'Tecnologia');
INSERT INTO Produto (ProdutoId, Nome, PrecoUnitario, Categoria) 
VALUES (5, 'Mouse pad', 10.00, 'Tecnologia');


CREATE TABLE Estoque (
Produto_ID INT NOT NULL,
FOREIGN KEY (Produto_ID) REFERENCES Produto (ID_Produto),
Quantidade INT NOT NULL
);

INSERT INTO Estoque (Produto_ID, Quantidade) 
VALUES (1, 10);
INSERT INTO Estoque (Produto_ID, Quantidade) 
VALUES (1, 9);
INSERT INTO Estoque (Produto_ID, Quantidade) 
VALUES (2, 2);
INSERT INTO Estoque (Produto_ID, Quantidade) 
VALUES (3, 4);
INSERT INTO Estoque (Produto_ID, Quantidade) 
VALUES (4, 5);
INSERT INTO Estoque (Produto_ID, Quantidade) 
VALUES (5, 13);


CREATE VIEW estoque_critico AS
SELECT p.Nome AS p_nome, e.quantidade AS e_Quantidade
FROM Produto p
INNER JOIN Estoque e ON p.ID_Produto = e.Produto_ID
WHERE e.quantidade < 15000;


SELECT * FROM estoque_critico;