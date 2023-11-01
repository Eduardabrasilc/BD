create database sprint2;
use sprint2;

create table curso (
idCurso int primary key auto_increment,
nome varchar(50),
sigla char (3),
coordenador char(40));

insert into curso values
(null, 'Análise e Desenvolvimento de sistemas', 'ADS', 'Gerson'),
(null, 'Sistemas da Informação', 'SIS', 'Alex'),
(null, 'Ciências da Computação', 'CCO', 'Marise');

create table Aluno (
idAluno int primary key auto_increment, 
nome varchar(45),
sobrenome varchar(45),
idade int, 
sala varchar(20));

alter table Aluno add column fkCurso int;
alter table Aluno add constraint foreign key (fkCurso) references curso (idCurso);

select * from curso as c join Aluno as a on a.fkCurso = c.idCurso;
select * from curso as c join Aluno as a on a.fkCurso where sobrenome = "";

ALTER TABLE aluno ADD COLUMN semestre varchar(40);

ALTER TABLE Aluno ADD constraint chksemestre
	CHECK (semestre in ('1', '2', '3', '4'));

drop table Aluno;
drop table curso;
