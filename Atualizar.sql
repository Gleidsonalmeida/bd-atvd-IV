CREATE DATABASE Atualizar;
USE Atualizar;

CREATE TABLE Produtos (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL,
  Estoque INT NOT NULL
);

CREATE TABLE Vendas (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  IDProduto INT,
  Qtde INT NOT NULL
);

DELIMITER //
CREATE TRIGGER AtualizarEstoque
AFTER INSERT ON Vendas
FOR EACH ROW
BEGIN
  UPDATE Produtos
  SET Estoque = Estoque - NEW.Qtde
  WHERE ID = NEW.IDProduto;
END;
//
DELIMITER ;


INSERT INTO Produtos (Nome, Estoque) VALUES ('Armário', 100);
INSERT INTO Vendas (IDProduto, Qtde) VALUES (1, 5);

SELECT NomeProduto, Estoque FROM Produtos WHERE Id = 1;