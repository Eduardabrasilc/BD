create database sala1;
use sala1;

use sala1;
create table aluno(
idaluno int primary key auto_increment,
nome varchar (45)
);

create table grupo(
idgrupo int primary key auto_increment,
nome varchar (45)
);

alter table aluno add column fkgrupo int;

alter table aluno add constraint fknomefk foreign key (fkgrupo) references grupo (idgrupo);

select*from grupo5;


CREATE TABLE `aluno` (
  `idaluno` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `fkgrupo` int DEFAULT NULL,
  PRIMARY KEY (`idaluno`),
  KEY `fknomefk` (`fkgrupo`),
  CONSTRAINT `fknomefk` FOREIGN KEY (`fkgrupo`) REFERENCES `grupo` (`idgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into grupo (nome) values ('grupo4'), ('grupo 1');
select * from grupo;
insert into aluno (fkgrupo, nome ) values
 (1, 'andrey'), (2,'maria'), (2, 'pedro');

select * from aluno;

select *
from aluno a 
join grupo g on g.idgrupo = a.fkgrupo;