use financa_pessoal;

delimiter //

create trigger bloqueia_movimentacao_muito_alta
	before insert on movimentacao for each row
begin

	declare var_id_cliente int;
	declare var_maior_valor_cliente decimal(15,4);
    
    select id_cliente into var_id_cliente from conta where id_conta = new.id_conta;

    select max(m.valor) into var_maior_valor_cliente
	from movimentacao m
	inner join conta co	on co.id_conta = m.id_conta
	where co.id_cliente = var_id_cliente;
    
    if var_maior_valor_cliente is not null and new.valor > (var_maior_valor_cliente * 3) then
		set @message_text = concat('Valor ', var_maior_valor_cliente, ' muito alto com base no seu histórico.');
		signal sqlstate '45000' set message_text = @message_text;
	end if;
    
end //

delimiter ;
