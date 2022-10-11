alter table movimentacao add column descricao varchar(100) not null;
/* ps: E se já tivermos dados inseridos, precisamos ter algum cuidado?
** R: O MySQL preenche a coluna descricao com um valor default '' mas
** para realmente preencher esses campos seria necessário pedir esse
** histórico ao usuário
*/

alter table movimentacao modify valor decimal(15,4);
/* ps: Extra: E se fossemos diminuir a precisão, digamos de 6 casas
** decimais para 4, podemos reduzir a precisão? Se sim, como?
** R: NÃO ENTENDI A PERGUNTA MUITO BEM.
*/

alter table categoria add column tipo enum ('DESPESA','RECEITA') default 'DESPESA';