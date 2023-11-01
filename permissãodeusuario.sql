use bd1adsa;

create table clube (
idClube int primary key auto_increment,
nome varchar(45),
estado char (2));

insert into clube values 
(null, 'São Paulo', 'SP'),
(null, 'Corinthians', 'SP');

SELECT*FROM clube;

create table jogador (
idJogador int primary key auto_increment,
nome varchar (45),
posição char (3),
fkClube int
) auto_increment= 1000;

alter table jogador add constraint fkClubeJogador foreign key (fkClube) references clube(idClube); 

insert into jogador values 
(null, 'Calleri', 'ATA', 1),
(null, 'Lucas', 'ATA', 1),
(null, 'Cássio', 'GOL', 2);

select * from jogador;

select * from jogador join clube 
on idClube = fkClube;


-- Colocar caminho no terminal e acessar o sql
-- copiar caminho até a pasta C:\Users\dudab>cd C:\Program Files\MySQL\MySQL Server 8.0\bin
-- adicionar pasta que irá progaramar C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u jogador -p
-- -u = user jogador -p = senha
-- Enter password: ************
-- Welcome to the MySQL monitor.  Commands end with ; or \g.