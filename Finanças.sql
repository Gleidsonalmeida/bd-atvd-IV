CREATE DATABASE Financas; 
USE Financas;

CREATE TABLE Contas(
ID_Conta INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Saldo DECIMAL(10,2) NOT NULL
);

INSERT INTO Contas(Nome, Saldo) 
VALUES ('Diogo', 4000.00);
INSERT INTO Contas(Nome, Saldo)
VALUES ('Gleidson', 5000.00);


CREATE TABLE Transacoes(
ID_Transacao INT AUTO_INCREMENT PRIMARY KEY,
Conta_ID INT,
FOREIGN KEY (Conta_ID) REFERENCES Contas (ID_Conta),
Tipo VARCHAR(20) NOT NULL,
Valor DECIMAL(10,2) NOT NULL
);

INSERT INTO Transacoes(Conta_ID, Tipo, Valor) 
VALUES (1, 'Conta Corrente', 3150.00);
INSERT INTO Transacoes(Conta_ID, Tipo, Valor) 
VALUES (2, 'Conta Corrente', 4200.00);


DELIMITER //

CREATE TRIGGER att_saldo
AFTER INSERT ON Transacoes
FOR EACH ROW
BEGIN
	IF NEW.tipo = 'entrada' THEN
		UPDATE Contas
		SET Saldo = Saldo + NEW.Valor
		WHERE ID_Conta = NEW.Conta_ID;
    ELSE
    UPDATE Contas
    SET Saldo = Saldo - NEW.Valor
    WHERE ID_Conta = NEW.Conta_ID;
    
END IF;
END
    
// DELIMITER ;

SELECT * FROM Transacoes;