use financa_pessoal;

delimiter //

create trigger atualiza_saldo_conta
	after insert on movimentacao for each row
begin

	declare var_tipo_categoria varchar(10);
	select tipo into var_tipo_categoria from categoria where id_categoria = new.id_categoria;

    if var_tipo_categoria = 'DESPESA' then
		update conta set saldo = (saldo - new.valor) where id_conta = new.id_conta;
	elseif var_tipo_categoria = 'RECEITA' then
		update conta set saldo = (saldo + new.valor) where id_conta = new.id_conta;
	end if;
    
end //

delimiter ;
