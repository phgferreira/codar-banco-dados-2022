/* 1. Buscar o nome dos clientes, email, a cidade onde ele mora,
** que não tiveram nenhuma movimentação dentro do mês atual.
** Quero isso para mandar um e-mail marketing para que eles voltem a usar o nosso sistema.
**
** OBS: Levando em consideração que queira saber apenas dos clientes que tem endereco cadastrado, segue:
*/
select distinct cl.nome cliente, cl.email, ci.nome cidade
from cliente cl
inner join endereco e 		on e.id_cliente = cl.id_cliente
inner join cidade ci		on ci.id_cidade = e.id_cidade
left join conta co			on co.id_cliente = cl.id_cliente
left join movimentacao m	on m.id_conta = co.id_conta
							-- O movito de colocar o filtro de data aqui é para não interferir no filtro global (where)
							and date_format(m.dh_movimentacao,'%m/%Y') = date_format( now() ,'%m/%Y')
where m.id_movimentacao is null;

/* 2. buscar o nome e email dos clientes que mais tiveram a maior movimentação de receita do nosso sistema.
** Quero o top 5 clientes. E também a sua maior movimentação, exemplo:
** Fulano | fulano@gmail.com | 34000 Ciclano | ciclano@hotmail.com | 29000 e assim por diante.
** (assim eu acho os clientes que posso oferecer uma assinatura premium)
*/
select cl.nome, cl.email, max(m.valor) maior_movimentacao
from cliente cl
inner join	conta co			on co.id_cliente = cl.id_cliente
inner join	movimentacao m		on m.id_conta = co.id_conta
inner join	categoria ca		on ca.id_categoria = m.id_categoria
where ca.tipo = 'RECEITA'
group by cl.nome, cl.email
limit 5;

/* 3. Fazer uma busca que descubra em qual dia do mês ocorre a maior parte das movimentações.
** (este dia é o dia que eu quero mandar meu email marketing mensal
*/
select dayofmonth(m.dh_movimentacao) dia_do_mes, count(m.id_movimentacao) qt_movimentacoes
from movimentacao m
group by dayofmonth(m.dh_movimentacao)
order by qt_movimentacoes desc
limit 1;

/* 4. Caso algum cliente cancele a assinatura, e peça para eu excluir ele do sistema, eu como admin preciso,
** por lei, eliminar ele completamente do meu sistema. Me faz um script eu que eu, com posse do CPF do cliente,
** possa elimininar ele do meu banco de dados.
*/
select * from cliente where cpf = '31630577055';
call deleta_cliente('31630577055');
select * from cliente where cpf = '31630577055';
/* criei essa procedure inicialmente para varrer todas as tabelas que dependiam do cliente para existir
** mas depois pesquisando descobri o 'on delete cascade' e coloquei na construção das tabelas necessárias
*/

/* 5. Criar um bloqueio, caso a movimentação financeira de algum cliente seja 300% maior do que a maior
** movimentação já feita pelo cliente, impedir a movimentação devido a uma possível fraude. Essa validação
** só faz sentido caso o cliente já possua mais de 10 movimentações.
*/

insert into movimentacao (id_conta, id_categoria, dh_movimentacao, valor, descricao) values
(2, 1, '2019-07-29 07:29:55', 9999999999.9999, 'Compra do jato da mulher maravilha');

