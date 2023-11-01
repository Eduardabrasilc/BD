-- Tirar o mandatorio quando eu quero 0 para 1 
-- ex: jogador é vinculado a nenhum time (não mandatório)

-- criar usuário jogador 
-- @ é qual servidor o usuário criado vai poder acessar
-- identified by é a senha que irá utilizar
-- localhost é o ip da máquina, para que você possa utilizar de qualquer lugar obtendo a senha
create user 'jogador'@'localhost' identified by 'copadobrasil';

-- permissões do usuário
-- permitir todos os comandos
 grant all privileges on bd1adsa.* to 'jogador'@'localhost';
 
 -- confirma o ultimo comando, não existe grant all sem flush privileges, pois comprova o feito.
 flush privileges;
 
 -- retirar as permissões 
 revoke all privileges on bd1adsa.*
 from 'jogador'@'localhost';
 flush privileges;
 
 -- dar permissão apenas para uma coisa 
 grant select on bd1adsa.* to 'jogador'@'localhost';
 
 -- dar permissão
 -- grant SELECT, UPDATE, DELETE, INSERT on bd1adsa.
 -- to 'jogador'@'localhost';
 
 -- excluir usuario 
 -- drop user 'jogador'@'localhost'
 
 