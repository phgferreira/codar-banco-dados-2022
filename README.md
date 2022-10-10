# banco-dados-2022

## Bem vindos ao desafio de banco de dados.

A idéia deste desafio é forçar a prática deliberada do nosso conhecimento sobre SQL.
Para isso, iremos trabalhar na criação de um modelo de banco de dados, para atender um software de finanças pessoais.

Imagine que estamos criando um software que será contratado, em forma de assinatura, por pessoas físicas que desejam controlar 
    e organizar sua vida financeira.
Logo, teremos um cadastro do **cliente**, com as seguintes informações: (o) representa um campo obrigatório.
1. Nome completo(o) 
2. CPF(o)
3. Email(o)
4. Senha(o)
5. Data de nascimento
6. Profissão
7. Gênero. 

Também é interessante cadastrarmos seu **endereço**. Cada cliente poderá cadastrar somente um endereço, com as seguintes informações:
1. CEP
2. Rua(o)
3. Número(o)
4. Complemento
5. Bairro(o)
6. Cidade(o)
7. Estado(o)
8. país(o).

Um cliente poderá ter diversas **contas correntes** cadastradas, com as seguintes informações:
1. Código do banco(o)
2. Número da conta(o)
3. Agência(o)
4. Apelido(o)
5. Saldo.

Para um cliente, não faz sentido ter mais de uma conta corrente com o mesmo número da conta e código do banco.

Uma das entidades mais importantes no nosso sistema é a **movimentação financeira**.
A movimentação financeira possui algumas características, como:

1. Valor(o) com duas casas decimais após a vírgula
2. Data(o)
3. A conta corrente é associada a movimentação(o)
4. Categoria(o)

As **categorias** são criadas pelo nosso cliente, como forma de organização.
Por exemplo: 
O cliente Eduardo, pode criar as categorias: Carro, Alimentação, Lazer, Pet e Moradia.
A cliente Camilla, pode criar as categorias: Assinaturas de Televisão, Estudo, Livros.

### Criação ###

O primeiro passo para este desafio será criar um arquivo com os comandos necessários para criarmos a nossa 
estrutura base do banco de dados. O arquivo deverá se chamar "criacao-db". A extensão do arquivo é **.sql**
Sintam-se a vontade para criar colunas, tabelas, associações e todo tipo de estrutura que achem que seria interessante 
para o sistema. Não precisa se limitar exclusivamente ao que foi pedido.
"Acho que seria muito legal guardarmos um apelido para o cliente, para chamarmos ele desta forma
e ter um contato mais pessoal com ele. Vou criar a coluna apelido na tabela cliente, isso é importante". Manda bala!
Perfeito, agora temos nossas tabelas, associações e tudo mais criado!

### Inserções ###

Faça um script que irá popular seu banco de dados com algumas informações para conseguir validar o mesmo, e depois criarmos nossos selects.
Hora de fazer diversos inserts. Faça quantos ache necessário para praticarmos as consultas depois.
Faça pelo menos inserção de 4 clientes, cada um com pelo menos 2 contas correntes e 5 movimentações, em 2 categorias diferentes.
Crie um arquivo chamado "criacao-dados.sql" no projeto.

### Modificações e mais inserções ###

Agora, precisamos modificar algumas coisas (Crie um arquivo chamado "script-modificacao.sql" no projeto.):
1. Entendemos que agora é necessário adicionar uma descrição a uma movimentação, e essa descrição será obrigatória.
ps: E se já tivermos dados inseridos, precisamos ter algum cuidado?
2. Percebemos que precisamos ter mais precisão no valor da movimentação financeira. Agora queremos ter 4 casas após a vírgula.
ps: Extra: E se fossemos diminuir a precisão, digamos de 6 casas decimais para 4, podemos reduzir a precisão? Se sim, como?
3. A categoria precisa ter uma coluna que nos fale se ela é de receita ou despesa. Por padrão toda 
categoria criada é de despesa(gasto), mas podemos criar categorias como SALARIO que é de RECEITA(ganho).

Se precisar, a partir deste ponto faça mais inserts para ter receitas nas movimentações, e valores com 4 casas após a vírgula

### Consultas ###

Vamos as consultas e alterações do dia-a-dia (para todas as consultas relacionadas a um cliente, imagine que iremos
buscar pela sua primary key. Exemplo: Crie uma query que traga todo os dados das contas.
select * from conta_corrente where cliente_key = 123;) Crie um arquivo chamado "comandos-cliente.sql" no projeto

Eu, como um cliente, quero:

1. Uma query que busque todos os meus gastos do mês de agosto de 2022.
2. Buscar todas as movimentações que tive do bradesco (código do banco 237), com a descrição da categoria.
3. Buscar todas as minhas categorias que tenham "trabalho" em sua descrição. Quero buscar como "Trabalho" ou "trabalho"
e traga categorias como: "Gasolina para trabalho", "alimentação no Trabalho", "Futebol do trabalho".
4. Todas movimentações que tive no primeiro semestre deste ano.
5. Buscar as categorias (somente a descrição) que tiveram movimentação na primeira semana de setembro, sem repetição, ordenada por ordem alfabética, 
desprezando espaços em branco antes e depois da descrição da categoria.
6. buscar a soma de todas as minhas despesa agrupadas por categoria (descrição), que tiveram pelo menos 1000 reais de gasto, arredondando o valor para duas casas após a vírgula
7. buscar as minhas últimas 5 receitas.
8. buscar o valor da minha maior movimentação dentro deste mês.
9. buscar o nome da categoria mais movimentada, por mês, no ano de 2020. Ex
    mes | categoria | valor movimentado
    janeiro | restaurante | 1200
    fevereiro | moradia | 1300
    marco | viagem | 5600
10. Quero saber qual o saldo das minhas contas. Exemplo:
    Nubank | 1200
    Itaú | -300
    Santander | 450


#### Como o dono do sistema, quero: ####


1. buscar o nome dos clientes, email, a cidade onde ele mora, que não tiveram nenhuma movimentação dentro do mês atual. 
Quero isso para mandar um e-mail marketing para que eles voltem a usar o nosso sistema.
2. buscar o nome e email dos clientes que mais tiveram a maior movimentação de receita do nosso sistema. Quero o top 5 clientes.
E também a sua maior movimentação, exemplo:
Fulano | fulano@gmail.com | 34000
Ciclano | ciclano@hotmail.com | 29000 e assim por diante. (assim eu acho os clientes que posso oferecer uma assinatura premium)
3. fazer uma busca que descubra em qual dia do mês ocorre a maior parte das movimentações. (este dia é o dia que eu quero mandar meu email
marketing mensal
4. Caso algum cliente cancele a assinatura, e peça para eu excluir ele do sistema, eu como admin preciso, por lei, eliminar ele 
completamente do meu sistema. Me faz um script eu que eu, com posse do CPF do cliente, possa elimininar ele do meu banco de dados.
5. criar um bloqueio, caso a movimentação financeira de algum cliente seja 300% maior do que a maior movimentação já feita pelo cliente, impedir
a movimentação devido a uma possível fraude. Essa validação só faz sentido caso o cliente já possua mais de 10 movimentações.

Crie um arquivo chamado "comandos-admin.sql" no projeto.


Vocês, como dev freelancer, podem usar a criatividade para resolver o problema dos clientes que chegam ao final
do mês e não sabem pra onde o dinheiro foi!
