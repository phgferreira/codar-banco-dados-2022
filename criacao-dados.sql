use financa_pessoal;

insert into cliente (nome, cpf, email, senha, dt_nascimento, profissao, genero, is_ativo) values
('Maria Madalena','07458446612','maria.madalena@teste.com', 'maria123', '1988-08-25', 'Costureira', 'F', 1),
('João Afonso','03234310464','joao_157@pessoal.com', 'jopa97', '1997-03-01', 'Vendedor Líder', 'M', 1),
('Landoaldo Lopes','90406606626','land_lopes@emailcomum.com', 'Pufen', '2001-06-13', 'Pintor Caseiro', 'M', 1),
('Rafael Muriel','31630577055','fafa.mumu@profissional.com', '@R!el', '2008-02-27', 'Analista de Infraestrutura', 'M', 1),
('Silvia Ferreira','36704704299','silvia.ferreira@empresa.com', 'sisiF3rreirinha', '1994-08-25', 'Programadora Junior', 'F', 1);

insert into cidade (nome, estado, pais) values
('Fortaleza', 'Ceará', 'Brasil'),
('Brasília', 'Capital do Brasil', 'Brasil'),
('São Paulo', 'São Paulo', 'Brasil'),
('Rio de Janeiro', 'Rio de Janeiro', 'Brasil'),
('Belo Horizonte', 'Minas Gerais', 'Brasil'),
('Manaus', 'Amazonas', 'Brasil'),
('Porto Alegre', 'Rio Grande do Sul', 'Brasil'),
('Goiânia', 'Goiás', 'Brasil'),
('Curitiba', 'Paraná', 'Brasil'),
('Salvador', 'Bahia', 'Brasil');

insert into endereco (id_cliente, id_cidade, cep, rua, numero, complemento, bairro) values
(1, 5, '30688872', 'Avenida Beira Mar', '741', 'Ao lado do restaurante Iracema e Mucuripe', 'Meireles'),
(3, 8, '20470644', 'Rua das Flores', '214', null, 'XV de Novembro'),
(2, 2, '20470644', 'Avenida Afonso Pena', '25 B', 'Condominio Chique de Assis apt xxx, bloco D', 'Belvedere');

insert into banco (codigo, nome, is_ativo) values
('001', 'Banco do Brasil S.A.', 1),
('033', 'Banco Santander (Brasil) S.A.', 1),
('104', 'Caixa Econômica Federal', 1),
('237', 'Banco Bradesco S.A.', 1),
('341', 'Banco Itaú S.A.', 1),
('389', 'Banco Mercantil do Brasil S.A.', 1),
('399', 'HSBC Bank Brasil S.A.', 1);

insert into conta (id_cliente, id_banco, agencia, numero, tipo, saldo, apelido, is_ativo) values
(1, 1, '142', '14527845', 'CORRENTE', 1200.00, 'conta principal', 1),
(1, 1, '142', '14527846', 'POUPANCA', 5000.00, 'reserva', 1),
(2, 3, '574', '14527845', 'CORRENTE', 700.00, 'recebimento salario', 1),
(2, 3, '574', '14527846', 'POUPANCA', 500.00, 'faculdade filho mais novo', 1),
(2, 4, '574', '14527840', 'POUPANCA', 900.00, 'faculdade filho mais velho', 1),
(3, 4, '5857', '14527846', 'CORRENTE', 850.00, 'mesada', 1),
(4, 7, '9687', '485271', 'CORRENTE', 700.00, 'pensão alimenticia', 1);

insert into categoria (id_cliente, descricao, is_ativo, tipo) values
(1, 'Moradia', 1, 'DESPESA'),
(1, 'Crianças', 1, 'DESPESA'),
(1, 'Transporte', 1, 'DESPESA'),
(1, 'Saúde', 1, 'RECEITA'),
(3, 'Faculdade', 1, 'DESPESA'),
(3, 'Festas', 1, 'RECEITA'),
(4, 'Lanches', 1, 'DESPESA'),
(2, 'Gasolina para trabalho', 1, 'DESPESA'),
(2, 'alimentação no Trabalho', 1, 'DESPESA'),
(2, 'Futebol do trabalho', 1, 'DESPESA');

insert into movimentacao (id_conta, id_categoria, dh_movimentacao, valor, descricao) values
(2, 1, '2019-05-30 07:29:55', 87.55, 'Guarda-roupa'),
(2, 3, '2019-06-27 12:35:00', 260.95, 'Visita na vó'),
(2, 3, '2019-06-02 11:16:27', 798.14, 'Visita na casa da mãe'),
(1, 1, '2019-06-14 08:01:34', 18.60, 'Uber até em casa'),
(1, 4, '2020-08-01 21:30:00', 1023.32, 'Consulta com zezinho'),
(3, 8, '2021-08-18 15:15:15', 81.67, 'Ponsto do zezinho'),
(3, 10, '2021-12-30 23:59:59', 786.52, 'Churrasco com os amigos'),
(5, 9, '2022-08-16 05:47:00', 15.31, 'Almoço'),
(5, 10, '2022-02-28 04:15:41', 568.66, 'Churrasco com os amigos'),
(5, 8, '2022-09-01 05:47:00', 15.31, 'Chorinho de gasolina'),
(5, 9, '2018-09-01 05:47:00', 15.31, 'Lanche da tarde'),
(5, 10, '2022-10-05 22:28:27', 3554.47, 'Final de semana curtindo'),
(5, 8, '2022-10-10 22:28:27', 1000.00, 'Preparando para viagem'),
(5, 8, '2020-07-01 05:47:00', 300.15, 'Taxi'),
(5, 9, '2020-07-05 05:47:00', 1241.45, 'Almoço de luxo'),
(5, 9, '2020-07-01 05:47:00', 0.10, 'Bala'),
(5, 10, '2020-7-21 05:47:00', 10.35, 'Só uma gelada'),
(5, 8, '2020-8-21 05:47:00', 100.35, 'Taxi'),
(5, 8, '2020-8-21 05:47:00', 50.35, 'Uber'),
(5, 9, '2020-8-21 05:47:00', 70.35, 'Janta com amigos do trabalho'),
(6, 5, '2022-07-11 22:28:27', 29.21, 'Apostila da faculdade');
