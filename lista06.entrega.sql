-- Crie o banco de dados AlunoProjeto e selecione-o
CREATE DATABASE AlunoProjeto;
USE AlunoProjeto;

-- Crie as tabelas equivalentes à modelagem
CREATE TABLE representante (
  idrepre INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45)
);

CREATE TABLE projeto (
  idprojetos INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  descricao VARCHAR(45)
);

CREATE TABLE Alunos (
  idRa INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  telefone VARCHAR(45),
  fkRepresentante INT,
  fkProjeto INT,
  CONSTRAINT fkRepresentante FOREIGN KEY (fkRepresentante) REFERENCES representante(idrepre),
  CONSTRAINT fkProjeto FOREIGN KEY (fkProjeto) REFERENCES projeto(idprojetos)
);

CREATE TABLE acompanhantes (
  idacomp INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  tipodeRelacao VARCHAR(45),
  fkAluno INT,
  CONSTRAINT fkAluno FOREIGN KEY (fkAluno) REFERENCES Alunos(idRa)
);

-- Insira dados nas tabelas
INSERT INTO representante (nome) VALUES
('Representante 1'),
('Representante 2');

INSERT INTO projeto (nome, descricao) VALUES
('Projeto 1', 'Descrição do Projeto 1'),
('Projeto 2', 'Descrição do Projeto 2');

INSERT INTO Alunos (nome, telefone, fkRepresentante, fkProjeto) VALUES
('Aluno 1', '123456789', 1, 1),
('Aluno 2', '987654321', 2, 2);

INSERT INTO acompanhantes (nome, tipodeRelacao, fkAluno) VALUES
('Acompanhante 1', 'Relação 1', 1),
('Acompanhante 2', 'Relação 2', 2);

-- Exiba todos os dados de cada tabela
SELECT * FROM representante;
SELECT * FROM projeto;
SELECT * FROM Alunos;
SELECT * FROM acompanhantes;

-- Exiba os dados dos alunos e dos projetos correspondentes
SELECT Alunos.nome AS NomeAluno, projeto.nome AS NomeProjeto
FROM Alunos
JOIN projeto ON Alunos.fkProjeto = projeto.idprojetos;

-- Exiba os dados dos alunos e dos seus acompanhantes
SELECT Alunos.nome AS NomeAluno, acompanhantes.nome AS NomeAcompanhante
FROM Alunos
LEFT JOIN acompanhantes ON Alunos.idRa = acompanhantes.fkAluno;

-- Exiba os dados dos alunos e dos seus representantes
SELECT Alunos.nome AS nome, representante.nome AS representante
FROM Alunos
LEFT JOIN representante ON Alunos.fkRepresentante = representante.idrepre;


-- Exiba os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes
SELECT Alunos.nome AS nome, projeto.nome AS projeto, acompanhantes.nome AS acompanhante
FROM Alunos
JOIN projeto ON Alunos.fkProjeto = projeto.idprojetos
LEFT JOIN acompanhantes ON Alunos.idRa = acompanhantes.fkAluno;
