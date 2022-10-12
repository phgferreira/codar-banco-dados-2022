use financa_pessoal;

alter table movimentacao add column descricao varchar(100) not null default 'Precisa informar uma descrição depois';
/* ps: E se já tivermos dados inseridos, precisamos ter algum cuidado?
** R: Para preencher a coluna descricao com um alerta pedindo para o usuário preencher essa informação depois,
** usamos o default e para que o default não atrapalhe o not null que será utilizado para as próximas inserções
** usamos o comando abaixo para só remover o default.
*/
alter table movimentacao alter column descricao drop default;

alter table movimentacao modify valor decimal(15,4);
/* ps: Extra: E se fossemos diminuir a precisão, digamos de 6 casas
** decimais para 4, podemos reduzir a precisão? Se sim, como?
*/

alter table categoria add column tipo enum ('DESPESA','RECEITA') default 'DESPESA';
