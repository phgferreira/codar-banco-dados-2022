/* ps: Extra: E se fossemos diminuir a precisão, digamos de 6 casas
** decimais para 4, podemos reduzir a precisão? Se sim, como?
** R: O certo não é diminuir a precisão diretamente porque o MySQL simplesment vai truncar as últimas casas
** então o ideal seria fazer um update antes arredondando todos os valores da tabela (de todos os clientes)
** para depois não ter uma perda de valor tão significativa.
*/

alter table movimentacao modify valor decimal(15,6);

insert into movimentacao (id_conta, id_categoria, dh_movimentacao, valor, descricao) values
(2, 1, '2022-07-30 07:29:55', 100.555499, 'teste'),
(2, 3, '2019-08-27 12:35:00', 101.954599, 'teste'),
(2, 3, '2019-09-02 11:16:27', 102.144799, 'teste');
select * from movimentacao where descricao = 'teste';

update movimentacao set valor = round(valor, 4);
select * from movimentacao where descricao = 'teste';

alter table movimentacao modify valor decimal(15,4);
/* Essa é a mensagem de alerta quando truncamos sem realizar o update antes:
** 1	45	16:04:21	alter table movimentacao modify valor decimal(15,4)	24 row(s) affected, 3 warning(s):
** 1265 Data truncated for column 'valor' at row 22
** 1265 Data truncated for column 'valor' at row 23
** 1265 Data truncated for column 'valor' at row 24
** Records: 24  Duplicates: 0  Warnings: 3	0.094 sec
*/
 
 select * from movimentacao where descricao = 'teste';
 
 --delete from movimentacao where descricao = 'teste';