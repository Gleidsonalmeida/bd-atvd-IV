CREATE DATABASE RH;
USE RH;

CREATE TABLE Funcionarios(
ID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Data_admissao DATE,
Data_atual DATE 
);

INSERT INTO Funcionarios (Nome, DataAdmissao, DataAtual) 
VALUES ('Diogo Santos', '2023-05-07', '2023-06-01');
INSERT INTO Funcionarios (Nome, DataAdmissao, DataAtual) 
VALUES ('Matheus Lima', '2023-05-06', '2023-06-01');

DELIMITER //
CREATE TRIGGER verify_data
BEFORE INSERT ON Funcionarios
FOR EACH ROW
BEGIN
    IF NEW.Data_admissao <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A data de admissão deve ser maior que a data atual.';
    END IF;
END;
//
DELIMITER ;

SELECT * FROM Funcionarios;