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
(1, 1, '142', '14527845', 'CORRENTE', 0.00, 'conta principal', 1),
(1, 1, '142', '14527846', 'POUPANCA', 0.00, 'reserva', 1),
(2, 3, '574', '14527845', 'CORRENTE', 0.00, 'recebimento salario', 1),
(2, 3, '574', '14527846', 'POUPANCA', 0.00, 'faculdade filho mais novo', 1),
(2, 4, '574', '14527840', 'POUPANCA', 0.00, 'faculdade filho mais velho', 1),
(3, 4, '5857', '14527846', 'CORRENTE', 0.00, 'mesada', 1),
(4, 7, '9687', '485271', 'CORRENTE', 0.00, 'pensão alimenticia', 1);

insert into categoria (id_cliente, descricao, is_ativo) values
(1, 'Moradia', 1),
(1, 'Crianças', 1),
(1, 'Transporte', 1),
(1, 'Saúde', 1),
(3, 'Faculdade', 1),
(3, 'Festas', 1),
(4, 'Lanches', 1);

insert into movimentacao (id_conta, id_categoria, dh_movimentacao, valor) values
(2, 1, '2019-05-30 07:29:55', 87.55),
(2, 3, '2019-06-27 12:35:00', 260.95),
(2, 3, '2019-06-02 11:16:27', 798.14),
(1, null, '2019-06-14 08:01:34', 18.60),
(1, 4, '2020-01-01 21:30:00', 1023.32),
(3, null, '2021-04-18 15:15:15', 81.67),
(3, null, '2021-12-30 23:59:59', 786.52),
(5, 6, '2022-01-16 05:47:00', 15.31),
(5, null, '2022-02-28 04:15:41', 568.66),
(6, null, '2022-07-11 22:28:27', 29.21);