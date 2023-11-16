CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Livro(
ID_Livro INT AUTO_INCREMENT PRIMARY KEY,
Titulo VARCHAR(255) NOT NULL,
Autor VARCHAR(255) NOT NULL,
Quantidade_estoque INT NOT NULL
);

INSERT INTO Livro (Titulo, Autor, Quantidade_estoque) 
VALUES ('The walking dead', 'Noé', 11);
INSERT INTO Livro (Titulo, Autor, Quantidade_estoque) 
VALUES ('One pice', 'Eichiiro Oda', 150);

CREATE TABLE Emprestimo(
ID_Emprestimo INT AUTO_INCREMENT PRIMARY KEY,
ID_Livro INT,
FOREIGN KEY (LivroID) REFERENCES Livro (ID_Livro),
Data_Emprestimo DATETIME,
Data_devolucao DATETIME 
);

INSERT INTO Emprestimo (ID_Livro, Data_Emprestimo, Data_devolucao) 
VALUES (1, '2023-03-02 12:00:00', '2023-02-02 12:00:01');
INSERT INTO Emprestimo (ID_Livro, Data_Emprestimo, Data_devolucao) 
VALUES (2, '2023-01-02 12:00:02', '2023-01-02 12:00:03');


DELIMITER //

CREATE TRIGGER att_estoque
AFTER INSERT ON Emprestimo
FOR EACH ROW
	BEGIN
	UPDATE Livro
	SET QntdE = QntdE -1
	WHERE IdLivro = NEW.LivroId;
END;

// DELIMITER ;

SELECT * FROM Livro;