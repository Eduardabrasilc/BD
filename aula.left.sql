-- Aula 9 
-- Tipos de atributo:
-- Atributo simples - por exemplo: genero
-- Atributo composto - deve ser dividido em subpartes
        -- exemplo: endereço (cep, numero, bairro)
-- Atributo monovalorado - apenas um valor
-- Atributo multivalorado - muitos valores 
		-- por exemplo - telefoneCelular e telefoneFixo
-- Atributo identificador - chave primária
-- Atributo derivado - idade

-- Tipos de entidades:
-- Entidade forte - chave primária simples
-- Entidade Fraca - chave primária composta

-- Tipos de relecionamentos:
-- Relacionamento forte - entre duas entidades fortes
-- Relacionamento Fraco - pelo menos 1 entidade fraca
-- Relacionamento Recursivo - 1 tabela se relaciona com ela mesma

-- Criar o banco de dados
create database convenio;
use convenio;

create table funcionario (
idFunc int primary key auto_increment,
nome varchar(45), -- + sobrenome = atributo composto
sobrenome varchar (45),
emailP varchar(45), -- + emailS = atributo multivalorado
emailS varchar(45),
fkSuper int, constraint fkSupervisor foreign key
    (fkSuper) references funcionario(idFunc));

insert into funcionario (nome, emailP) values
('Garoto', 'garoto@choc.com');

insert into funcionario (nome, emailP, fkSuper) values
('Lindt', 'Lindt@choc.com', 1),
('Cacau Show', 'cacaushow@choc.com', 1),
('Toblerone', 'toblerone@choc.com', 2);

select * from funcionario;

-- exibir os funcionarios e seus respectivos supervisores
select f.nome as NomeFunc,
s.nome as NomeSuper
from funcionario as f 
join funcionario as s
on f.fkSuper = s.idFunc;

select funcionario.nome as Funcionario,
supervisor.nome as Supervisor
From funcionario
join funcionario as supervisor
on funcionario.fkSuper = supervisor.idFunc; 

create table dependente (
idDep int,
fkFunc int, 
primary key (idDep, fkFunc),
nome varchar (45),
parentesco varchar (45),
dtNasc date, -- idade é um atributo derivado da dtNasc
constraint fkFuncDep foreign key (fkFunc)
references funcionario(idFunc));

insert into dependente values
(1, 1, 'Lacta', 'irmão', '2000-10-10'),
(2, 1, 'Chokito', 'primo', '2000-10-11'),
(1, 2, 'Lolo', 'pai', '1950-10-12'),
(1, 3, 'Prestigio', 'mãe', '1958-10-12');

select * from dependente;

select f.nome as Funcionario,
s.nome as Supervisor,
d.nome as Dependente
from funcionario as f
join funcionario as s
on f.fkSuper = s.idFunc
join dependente as d
on f.idFunc = d.fkFunc;

select * from funcionario;

select f.nome as NomeFuncionario,
f.emailP as EmailFunc, 
d.nome as NomeDep,
d.parentesco as Parentesco
From funcionario as f 
join dependente as d 
on f.idFunc = d.fkFunc;

select * from funcionario join dependente 
on idFunc = fkFunc;

-- left para aparecer resultados que não foram exibidos na tabela de join 
select * from funcionario left join dependente 
on idFunc = fkFunc;

-- right para aparecer resultados que não foram exibidos na tabela de join 
select * from dependente right join funcionario
on idFunc= fkFunc
where fkFunc is null;

-- para aparecer a idade do funcionario
select nome, timestampdiff (year, dtNasc, now()) as idade 
from dependente;

-- para aparecer em quantidade de dias
select nome, timestampdiff (day, dtNasc, now()) as idade
from dependente;

-- para aparecer em meses 
select nome, timestampdiff (month, dtNasc, now()) as idade 
from dependente;

