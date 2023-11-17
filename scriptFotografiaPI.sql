create database dbFotografia;

use dbFotografia;

create table clientes (
	idCliente int primary key auto_increment,
	nomeCliente varchar(50) not null,
	telefoneCliente varchar(20) not null,
	emailCliente varchar(50) not null unique,
    cpfCliente varchar(20) not null unique, 
	loginCliente varchar(50) not null unique,
	senhaCliente varchar(255)not null,
	cep varchar(9),
	enderecoCliente varchar(100),
	numeroEndereco varchar(10),
	complemento varchar(20),
	bairro varchar(40),
	cidade varchar(40),
	estado varchar(2)
);

select * from clientes;

create table profissionais (
	idProfissional int primary key auto_increment,
	nomeProfissional varchar(50) not null,
    segmento varchar(255) not null,
    descricao text,
    redesocial varchar(60),
    cnpjProfissional varchar(20) unique,
    cpfProfissional varchar(20) not null unique,
	telefoneProfissional varchar(20) not null,
	emailProfissional varchar(50) not null unique,
	loginProfissional varchar(50) not null unique,
	senhaProfissional varchar(255) not null,
    disponibilidade varchar(255) not null,
	cep varchar(9),
	enderecoProfissional varchar(100),
	numeroProfissional varchar(10),
	complemento varchar(20),
	bairro varchar(40),
	cidade varchar(40),
	estado varchar(2)
);

describe profissionais;

select * from profissionais;


create table servicosProfissional (
	idServicoProfissional int primary key auto_increment,
    nomePacote varchar(50) not null,
	tempoSessao time not null,
	quantidadeFotos int not null,
	descricaoEdicao text,
	categoriaEntrega varchar(100),
	prazoEntrega date,
    idProfissional int not null,
	foreign key (idProfissional) references profissionais(idProfissional)
);

create table ensaio (
	idEnsaio int primary key auto_increment,
    nomeEnsaio varchar(50),
	visibilidade enum("Público", "Privado"),
    foto1 varchar(255),
    foto2 varchar(255),
    foto3 varchar(255),
    foto4 varchar(255),
    idProfissional int not null,
    foreign key (idProfissional) references profissionais(idProfissional)
);

select * from ensaio;

create table salvarEnsaio (
	idSalvarEnsaio int primary key auto_increment,
    idCliente int not null,
    idEnsaio int not null,
    foreign key (idEnsaio) references ensaio(idEnsaio),
    foreign key (idCliente) references clientes(idCliente)
);

select * from salvarEnsaio;


select nomeCliente, nomeEnsaio, foto1, foto2, foto3, foto4, nomeProfissional from clientes inner join salvarEnsaio on clientes.idCliente = salvarEnsaio.idCliente inner join ensaio on salvarEnsaio.idEnsaio = ensaio.idEnsaio inner join profissionais
on profissionais.idProfissional = ensaio.idProfissional

