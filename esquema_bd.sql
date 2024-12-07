-- Criação de banco de dados para o cenário de e-commerce.

create database ecommerce;
use ecommerce;

-- Tabela cliente

create table clients(
	  idClient int auto_increment primary key,
      Fname varchar(10),
      Mname varchar(10),
      Lname varchar(15),
      TaxId char(11) not null,
      Address varchar(100),
      BirthDate date not null,
      constraint Unique_TaxId_Client unique(TaxId)
);

-- Tabela produto

create table product(
	  idProduct int auto_increment primary key,
      Pname varchar(10) not null,
      Classification_Kids bool,
      Category enum('Eletrônicos','Vestuário','Brinquedos','Alimentos') not null,
      Rate float,
      Size varchar(10)
);

-- Tabela pedido

create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    oderDescription varchar(255),
    freight float default 10,
    paymentCash bool default false,
    constraint fk_order_client foreign key (idOrderClient) references clients(idClient)
);

-- Tabela pagamento

create table payment(
	idClient int,
    idPayment int,
    typePayment enum('Boleto','Cartão'),
    limitAvailable float,
    primary key (idClient, idPayment)
);

-- Tabela estoque

create table productStorage(
	idStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- Tabela fornecedor

create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- Tabela vendedor

create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstractName varchar(255),
    location varchar(255),
    CNPJ char(15) not null,
    CPF char(9) not null,
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

-- Tabela produto por vendedor

create table productSeller(
	idPseller int auto_increment,
    idProduct int not null,
    prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller (idSeller),
    constraint fk_product_product foreign key (idProduct) references product (idProduct)
);

-- Tabela produto por pedido

create table productOrder(
	idPorder int auto_increment,
    idProduct int not null,
    prodQuantity int default 1,
    PStatus enum ('Disponível','Sem estoque') default 'Disponível',
    primary key (idPorder, idProduct),
    constraint fk_product_order foreign key (idProduct) references product (idProduct),
    constraint fk_product_Porder foreign key (idPorder) references orders (idOrder)
);

-- Tabela produto por fornecedor

create table productSupplier(
	idPsupplier int,
    idPproduct int,
    quantity int not null,
    primary key (idPsupplier, idPproduct),
    constraint fk_product_supplier_supplier foreign key (idPsupplier) references supplier (idSupplier),
    constraint fk_product_supplier_product foreign key (idPproduct) references product (idProduct)
);

-- Tabela local do estoque

create table storageLocation(
	idLstorage int,
    idLproduct int,
    location varchar(255) not null,
    primary key (idLstorage, idLproduct),
    constraint fk_storage_location_product foreign key (idLproduct) references product (idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage (idStorage)
);

alter table clients auto_increment=1;