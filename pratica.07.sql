create database Vendas;
use Vendas;

create table clientes (
idCliente int primary key auto_increment,
nome varchar (45),
email varchar(45),
endereço varchar(45),
fkIndicado int,
constraint fkIndic foreign key (fkIndicado)
references clientes (idCliente));

insert into clientes (nome, email, endereço, fkIndicado) values 
('Maria', 'maria.m@sptech.school', 'Rua candido 900', null),
('Maraia', 'maraia@sptech.school', 'Rua laura 25', 2),
('Marula', 'marula@sptech.school', 'Rua Brasil 87', 1),
('Maroca', 'maroca@sptech.school', 'Av Rio pires 25', 1);

select * from clientes;

create table vendas (
idVenda int primary key auto_increment,
totalVenda decimal(10,2),
dtVenda datetime,
fkCliente int,
constraint fkCli foreign key (fkCliente)
references clientes (idCliente));

insert into vendas (totalVenda, dtVenda, fkCliente) values
(10.99, '2023-10-31 11:00:00', 2),
(500.00, '2023-08-04 14:00:00', 1),
(200.00, '2023-04-21 21:00:00', 1),
(25.00, '2023-05-05 10:00:00', 3),
(9.99, '2023-07-14 13:30:00', 4),
(56.00, '2023-10-13 15:45:00', 2);

select * from vendas;

create table produto (
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
precoProd decimal (5,2));

insert into produto (nome, descricao, precoProd) values
('Boleira', 'produto para bolos', 10.99),
('Jogo de pratos', 'Produto domiciliar', 500.00),
('Conjunto de taças', 'Produto domiciliar', 200.00),
('Jarra de suco', 'Produto domiciliar', 25.00),
('Potes', 'Produto domiciliar', 9.99),
('Murano', 'Vaso', 56.00);

select * from produto;

create table historico (
idHistorico int, 
fkVenda int,
fkProduto int,
primary key (idHistorico, fkVenda, fkProduto),
qtdVendido int,
valorDesconto decimal(5,2),
constraint fkHistVenda foreign key (fkVenda)
references vendas(idVenda),
constraint fkHistProd foreign key (fkProduto)
references produto(idProduto));

insert into historico (fkVenda, qtdVendido, valorDesconto, fkProduto, idHistorico) values
(1, 1, 5.00, 1, 1),
(1, 3, 12.00, 2, 2),
(2, 2, 06.00, 3, 3),
(4, 2, 2.00, 4, 4),
(2, 1, 2.00, 5, 5),
(1, 1, 10.00, 6, 6);

select * from historico;

select clientes.nome as NomeCliente,
clientes.email as EmailCliente,
clientes.endereço as Endereço,
vendas.totalVenda as Total,
vendas.dtVenda as DataVenda
from clientes join vendas 
on idCliente = fkCliente; 

select clientes.nome as NomeCliente,
clientes.email as EmailCliente,
clientes.endereço as Endereço,
vendas.totalVenda as Total,
vendas.dtVenda as DataVenda
from clientes join vendas 
on idCliente = fkCliente
where nome like 'Maria%';

select * from clientes as Cliente 
join clientes as ClienteIndic on Cliente.fkIndicado = ClienteIndic.idCliente;

select * from clientes as Cliente 
join clientes as ClienteIndic on Cliente.fkIndicado = ClienteIndic.idCliente
where ClienteIndic.nome = 'Maria';

select * from clientes as Cliente
join clientes as ClienteIndic on Cliente.fkIndicado = ClienteIndic.idCliente
join vendas as venda on venda.fkCliente = Cliente.idCliente
join historico on fkVenda = idVenda
join produto on fkProduto = idProduto;

select vendas.dtVenda as dataVenda, produto.nome as NomeProduto, historico.qtdVendido as qtdVenda
from vendas join historico
on fkVenda = idVenda
join produto on fkProduto = idProduto
where idVenda like '4%';
