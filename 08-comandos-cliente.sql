use financa_pessoal;
select * from cliente;
-- Cliente escolhido = 2 João Afonso

-- 1. Uma query que busque todos os meus gastos do mês de agosto de 2022.
select m.*
from movimentacao m
inner join	conta co 		on co.id_conta = m.id_conta
inner join	categoria ca 	on ca.id_categoria = m.id_categoria
where ca.tipo = 'DESPESA'
and   date_format(m.dh_movimentacao, '%m/%Y') = '08/2022'
and   co.id_cliente = 2;

-- 2. Buscar todas as movimentações que tive do bradesco (código do banco 237), com a descrição da categoria.
select m.*, ca.descricao
from movimentacao m
inner join	conta co 		on co.id_conta = m.id_conta
inner join	banco b 		on b.id_banco = co.id_banco
left join	categoria ca 	on ca.id_categoria = m.id_categoria
where b.codigo = '237'
and   co.id_cliente = 2;

/* 3. Buscar todas as minhas categorias que tenham "trabalho" em sua descrição.
** Quero buscar como "Trabalho" ou "trabalho" e traga categorias como:
** "Gasolina para trabalho", "alimentação no Trabalho", "Futebol do trabalho".
*/
select ca.*
from categoria ca
where upper(ca.descricao) like upper('%Trabalho%')
and   ca.id_cliente = 2;

-- 4. Todas movimentações que tive no primeiro semestre deste ano.
select m.*
from movimentacao m
inner join	conta co on co.id_conta = m.id_conta
where quarter( m.dh_movimentacao ) in (1,2) -- Trimestre igual a 1 ou 2
and   year(m.dh_movimentacao) = year(now())
and   co.id_cliente = 2;

/* 5. Buscar as categorias (somente a descrição) que tiveram movimentação na
** primeira semana de setembro, sem repetição, ordenada por ordem alfabética,
** desprezando espaços em branco antes e depois da descrição da categoria.
*/
select distinct trim(ca.descricao) descricao
from categoria ca
inner join	movimentacao m	on m.id_categoria = ca.id_categoria
where week(m.dh_movimentacao) = week( DATE_SUB(m.dh_movimentacao,INTERVAL DAYOFMONTH(m.dh_movimentacao)-1 DAY) )
and   ca.id_cliente = 2
order by 1;
/* Trecho pego da internet "DATE_SUB(d,INTERVAL DAYOFMONTH(d)-1 DAY)"
** Fonte: https://www.oreilly.com/library/view/mysql-cookbook-2nd/059652708X/ch06s14.html
*/

/* 6. Buscar a soma de todas as minhas despesa agrupadas por categoria (descrição),
** que tiveram pelo menos 1000 reais de gasto, arredondando o valor para duas casas após a vírgula
*/
select ca.descricao, round( sum(m.valor), 2) soma_valor
from movimentacao m
inner join	conta co 		on co.id_conta = m.id_conta
inner join	categoria ca 	on ca.id_categoria = m.id_categoria
where ca.tipo = 'DESPESA'
and   co.id_cliente = 2
group by ca.descricao
having sum(m.valor) >= 1000;

-- 7. Buscar as minhas últimas 5 receitas
select ca.descricao, ca.tipo, m.dh_movimentacao, m.valor
from movimentacao m
inner join	conta co 		on co.id_conta = m.id_conta
inner join	categoria ca 	on ca.id_categoria = m.id_categoria
where co.id_cliente = 2
order by dh_movimentacao desc
limit 5;

-- 8. Buscar o valor da minha maior movimentação dentro deste mês.
select max(m.valor) maior_movimentacao
from movimentacao m
inner join	conta co 		on co.id_conta = m.id_conta
where date_format(m.dh_movimentacao, '%m/%Y') = date_format(now(), '%m/%Y')
and   co.id_cliente = 2;

/* 9. Buscar o nome da categoria mais movimentada, por mês, no ano de 2020.
** Ex mes | categoria | valor movimentado janeiro | restaurante | 1200 fevereiro | moradia | 1300 marco | viagem | 5600
** FIQUEI CONFUSO
*/
-- 1ª forma = contagem de movimentações
with src as (
	select month(m.dh_movimentacao) mes, ca.descricao categoria, count(m.id_movimentacao) qt_mov
	from categoria ca
	inner join	movimentacao m	on m.id_categoria = ca.id_categoria
	where year(m.dh_movimentacao) = 2020
	and   ca.id_cliente = 2
	group by month(m.dh_movimentacao), ca.descricao
	order by mes, qt_mov desc
)
select mes, categoria, qt_mov
from src
group by mes
having max(qt_mov) = src.qt_mov;

-- 2ª forma = somatório dos valores das movimentações
with src as (
	select month(m.dh_movimentacao) mes, ca.descricao categoria, sum(m.valor) soma_valor
	from categoria ca
	inner join	movimentacao m	on m.id_categoria = ca.id_categoria
	where year(m.dh_movimentacao) = 2020
	and   ca.id_cliente = 2
	group by month(m.dh_movimentacao), ca.descricao
	order by mes, soma_valor desc
)
select mes, categoria, soma_valor
from src
group by mes
having max(soma_valor) = src.soma_valor;

-- 3ª forma = Apenas a categoria e movimentação do mês com maior valor
with src as (
	select month(m.dh_movimentacao) mes, ca.descricao categoria, m.valor
	from categoria ca
	inner join	movimentacao m	on m.id_categoria = ca.id_categoria
	where year(m.dh_movimentacao) = 2020
	and   ca.id_cliente = 2
	group by month(m.dh_movimentacao), ca.descricao
	order by mes, valor desc
)
select *
from src
group by mes
having max(valor) = src.valor;

-- 10. Quero saber qual o saldo das minhas contas. Exemplo: Nubank | 1200 Itaú | -300 Santander | 450
select ba.codigo, ba.nome, co.tipo, co.saldo
from banco ba
inner join conta co 	on co.id_banco = ba.id_banco
where   co.id_cliente = 2;
