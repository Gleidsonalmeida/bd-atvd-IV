CREATE DATABASE Estoque;
USE GerenciamentoEsto;

CREATE TABLE Produtos(
ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Quantidade_estoque INT NOT NULL
);

INSERT INTO Produtos (NomeProduto, QntdE) 
VALUES ('Computador', 10);
INSERT INTO Produtos (NomeProduto, QntdE)
VALUES ('Headset', 35);
INSERT INTO Produtos (NomeProduto, QntdE)
VALUES ('Mouse', 75);


CREATE TABLE Vendas(
ID_Venda INT AUTO_INCREMENT PRIMARY KEY,
Data_Venda DATETIME NOT NULL
);

INSERT INTO Vendas (DataVenda) 
VALUES ('2023-12-23 12:30:00');
INSERT INTO Vendas (DataVenda) 
VALUES ('2023-12-22 12:40:00');
INSERT INTO Vendas (DataVenda) 
VALUES ('2023-12-21 12:50:00');

CREATE TABLE Itens_Vendas(
ID_Item INT AUTO_INCREMENT PRIMARY KEY,
Venda_ID INT,
FOREIGN KEY (Venda_ID) REFERENCES Vendas (ID_Venda),
Produto_ID INT,
FOREIGN KEY (Produto_ID) REFERENCES Produtos(ID_Produto),
Quantidade INT NOT NULL
);

INSERT INTO Itens_Vendas (Venda_ID, Produto_ID, Quantidade) VALUES (1, 1, 3);
INSERT INTO Itens_Vendas (Venda_ID, Produto_ID, Quantidade) VALUES (2, 3, 7);
INSERT INTO Itens_Vendas (Venda_ID, Produto_ID, Quantidade) VALUES (3, 1, 8);



DELIMITER //
CREATE TRIGGER verify_estoque
BEFORE INSERT ON Itens_Vendas
FOR EACH ROW 
BEGIN
    DECLARE Quantidade INT;
        SELECT Quantidade_estoque INTO Quantidade
    FROM produtos
    WHERE ID_Produto = NEW.Produto_ID;
	IF Quantidade < NEW.Quantidade_estoque THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'ERRO: Produto fora do estoque.';
    END IF;
END;
// DELIMITER ;

SELECT * FROM Produtos;