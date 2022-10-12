use financa_pessoal;

delimiter //

/* criei essa procedure inicialmente para varrer todas as tabelas que dependiam do cliente para existir
** mas depois pesquisando descobri o 'on delete cascade' e coloquei na construção das tabelas necessárias
*/
create procedure if not exists deleta_cliente ( cpf varchar(11) )
begin

	delete from cliente cl where cl.cpf = cpf;
    
end //

delimiter ;
