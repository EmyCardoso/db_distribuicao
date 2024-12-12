create database db_distribuicao;
-- drop database db_distribuicao;
use db_distribuicao;

-- drop table tb_produto;
create table tb_produto (
sku int auto_increment primary key, 
descricao varchar(100) not null, 
categoria varchar(100)
);

insert into tb_produto (sku, descricao, categoria)
 values (1, "Oferece qualidade de som e com encaixe perfeitos aos ouvidos", "Eletrônico"),
 (2, "Com uma tela de 40 polegadas Full HD+, oferece uma imagem mais eficaz e nítida", "Eletrônico" ),
 (3, "Com processador de última geração da marca Dell",  "Eletrônico");
 
 select * from tb_produto;

create table tb_fornecedor (
nome varchar(100) primary key,
contato varchar(20) not null
);

insert into tb_fornecedor (nome, contato) values ("Giovanna", "11985879316"),
("Gabriel", "11947256824"),
("Paula","11956329874");

select * from tb_fornecedor;

create table tb_prateleira (
codigo_prateleira int primary key,
capacidade int not null
);

insert into tb_prateleira (codigo_prateleira, capacidade) values (1, 400),
(2, 900),
(3, 360);

select * from tb_prateleira;

create table tb_area_cd (
nome varchar(100) primary key,
tipo_produto varchar(100)
);

insert into tb_area_cd (nome, tipo_produto) values ("TV 65", "Eletrônico"),
("tv", "Eletrônico"),
("celular", "Eletônico");

select * from tb_area_cd;

create table tb_cliente (
 codigo int auto_increment primary key,
 nome varchar(100),
 endereco varchar(100)
 );
 
 insert into tb_cliente (codigo, nome, endereco) values (2, "Giovanna", "Rua largo da estação"),
 (8, "ricardo", "rua Tokio"),
 (10, "Noah" , "rua Leonilda");
 
 select * from tb_cliente;
 
 create table tb_transportadora (
 nome varchar(100)primary key,
 contato varchar(100), 
 doca int not null
 );
 
 insert into tb_transportadora (nome, contato, doca) values ("Buzeira", "1125789641", 2),
 ("Franforetti", "1147256896", 6),
 ("Eldorado", "1123659874", 4);
 
 select * from tb_transportadora;
 
 create table tb_pedido (
 numero_pedido int auto_increment primary key,
 doca int,
 data_pedido date not null
 );
 
 insert into tb_pedido (numero_pedido, doca, data_pedido ) values (1, 8, "251124"),
 (2, 10, "170823"),
 (3, 2, "290922");
 
 select * from tb_pedido;
 
create table tb_ordem_separacao(
numero_ordem int auto_increment primary key,
status int not null,
data_inicio date not null,
data_fim date not null
);
 
 insert into tb_ordem_separaco (numero_ordem, status, data_inicio, data_fim) values (1, "8", "251124", "251224"),
 (2, "10", "170823",  "170823"),
 (3, "2", "290922", "290922");
 
 select * from tb_ordem_separacao;
 
 create table tb_devolucao(
 numero_pedido int,
 data_devolucao date not null
 );
 
 insert into tb_devolucao (numero_pedido, data_devolucao) values (1, "231124"),
 (2, "291122"),
 (3, "050823");
 
 select * from tb_devolucao;
 
 -- drop table tb_fornecedor_produto;
 create table tb_fornecedor_produto(
 sku int,
 nome varchar(100),
 descricao varchar(100) not null,
 categoria varchar(100) not null,
 primary key (sku, nome),
 foreign key (sku) references tb_produto(sku),
 foreign key (nome) references tb_fornecedor(nome)
 );  
 
 insert into tb_fornecedor_produto (sku, nome, descricao, categoria) values (1,  "Giovanna", "Oferece qualidade de som e com encaixe perfeitos aos ouvidos", "Eletrônico"),
 (2, "Gabriel",  "Com uma tela de 40 polegadas Full HD+, oferece uma imagem mais eficaz e nítida", "Eletrônico" ),
 (3, "Paula",  "Com processador de última geração da marca Dell",  "Eletrônico");
 
 select * from tb_fornecedor_produto;
 
 -- drop table devolucao_item_pedido;
 
 create table tb_devolucao_item_pedido(
	numero_pedido int not null,
    sku int not null,
    data_devolucao date not null,
    primary key (numero_pedido),
    foreign key (numero_pedido) references tb_pedido(numero_pedido),
    foreign key (sku) references tb_produto(sku)
 );
 
 insert into tb_devolucao_item_pedido (numero_pedido, sku, data_devolucao) values (1, 1 , "231124"),
 (2, 2, "291122"  ),
 (3, 3, "050823"  );
 
 select * from tb_devolucao_item_pedido;
 
 
 create table tb_ordem_separacao_pedido(
	numero_ordem int auto_increment primary key,
    numero_pedido int,
    data_pedido date not null,
    data_fim date not null,
    foreign key (numero_pedido) references tb_pedido(numero_pedido)
 );
 
 insert into tb_ordem_separacao_pedido (numero_ordem, numero_pedido, data_pedido, data_fim) values (1, 1, "251124", "251224"),
 (2, 2, "170823", "170823" ),
 (3, 3, "290922", "290922");
 
 select * from tb_ordem_separacao_pedido;
 
 create table tb_prateleira_produto(
	codigo_prateleira int auto_increment primary key,
	sku int not null, 
    quantidade_armazenada int not null,
    foreign key (sku) references tb_produto(sku)
 );
 
 insert into tb_prateleira_produto (codigo_prateleira, sku, quantidade_armazenada) values (1, 1, 400),
 (2, 2, 900 ), 
 (3, 3, 360 );
 
 select * from tb_prateleira_produto;
 
 create table tb_pedido_cliente(
	codigo int not null,
    numero_pedido int primary key,
    data_realizada date not null,
    foreign key (codigo) references tb_cliente(codigo)
 );
 
 insert into tb_pedido_cliente (codigo, numero_pedido, data_realizada) values (2, 1 , "251124"),
 (8, 2, "170823"),
 (10, 3, "290922");
 
 select * from tb_pedido_cliente;
 
 create table tb_pedido_entrega(
	nome_transportadora varchar (100),
    numero_pedido int not null,
    data_entrega date not null,
    status int not null,
    foreign key (numero_pedido) references tb_pedido(numero_pedido)
 );

 insert into tb_pedido_entrega (nome_transportadora, numero_pedido, data_entrega) values ("Buzeira", 1, "251224"),
 ("Franforetti", 2, "170823"),
 ("Eldorado", 3, "290922");
 
 select * from tb_pedido_entrega;
 
 create table tb_item_pedido(
	numero_pedido int not null,
    sku int not null,
    quantidade int not null,
    primary key (numero_pedido, sku),
    foreign key (numero_pedido) references tb_pedido(numero_pedido),
    foreign key (sku) references tb_produto(sku)
 );
 
 insert into tb_item_pedido (numero_pedido, sku, quantidade) values (1, 1, 900),
 (2, 2, 400),
 (3, 3, 360);
 
 select * from tb_item_pedido;

 
 