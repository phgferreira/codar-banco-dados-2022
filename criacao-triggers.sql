use financa_pessoal;

delimiter //

create trigger apenas_um_endereco_por_cliente
	before insert on endereco for each row
begin

	declare var_id_cliente integer;
	select id_cliente into var_id_cliente from endereco where id_cliente = new.id_cliente;
    
    if var_id_cliente is not null then
		signal sqlstate '45000' set message_text = 'Só pode existir um endereco por cliente.';
    end if;
    
end //

delimiter ;