drop database if exists financa_pessoal;
create database if not exists financa_pessoal;
use financa_pessoal;

create table cliente (
	id_cliente int auto_increment primary key,
    nome varchar(50) not null,
    cpf varchar(11),
    email varchar(70),
    senha varchar(50),
    dt_nascimento date,
    profissao varchar(50),
    genero char(1),
    is_ativo bit(1) not null
);

create table cidade (
	id_cidade int auto_increment primary key,
    nome varchar(50) not null,
    estado varchar(50) not null,
    pais varchar(50) not null
);

create table endereco (
	id_endereco int auto_increment primary key,
    id_cliente int not null,
    id_cidade int,
    cep varchar(8),
    rua varchar(100),
    numero varchar(10),
    complemento varchar(150),
    bairro varchar(50),
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (id_cidade) references cidade(id_cidade)
);

create table banco (
	id_banco int auto_increment primary key,
    codigo varchar(3) unique not null,
    nome varchar(50) unique not null,
    is_ativo bit(1) not null
);

create table conta (
	id_conta int auto_increment primary key,
    id_cliente int not null,
    id_banco int not null,
    agencia varchar(20) not null,
    numero varchar(50) not null,
    tipo enum ('CORRENTE','POUPANCA') not null,
    saldo decimal(15,2) not null,
    apelido varchar(50),
    is_ativo bit(1) not null,
    unique (id_banco, numero),
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (id_banco) references banco(id_banco)
);

create table categoria (
	id_categoria int auto_increment primary key,
    id_cliente int not null,
    descricao varchar(50) not null,
    is_ativo bit(1) not null,
    foreign key (id_cliente) references cliente(id_cliente)
);

create table movimentacao (
	id_movimentacao int auto_increment primary key,
    id_conta int not null,
    id_categoria int not null,
    dh_movimentacao datetime,
    valor decimal(15,2) not null,
    foreign key (id_conta) references conta(id_conta),
    foreign key (id_categoria) references categoria(id_categoria)
);