create table TerceiroVendedor (
	idTerceiroVendedor int primary key,
	razaoSocial varchar(45),
	localizacao varchar (45)
);

insert into TerceiroVendedor values (1, 'magalu', 'Rua Maga num 1');

create table Produto (
	idProduto int primary key,
	categoria varchar (45),
	descricao varchar (45),
	valor varchar (45)
);

insert into Produto values (1, 'Calcado', 'Produto A', '20.50');
insert into Produto values (2, 'Vestuario', 'Produto B', '30.00');
insert into Produto values (3, 'Calcado', 'Produto C', '15.75');

create table Fornecedor (
	idFornecedor int primary key,
	razaoSocial varchar (45),
	cnpj varchar (45)
);

create table prodVend (
	idTerceiroVendedor int,
	idProduto int,
	qtd int,
	constraint fk_TerceiroVendedor foreign key (idTerceiroVendedor) references TerceiroVendedor(idTerceirovendedor),
	constraint fk_Produto foreign key (idProduto) references Produto (idProduto)
);

insert into prodVend values (1, 1, 2), 
							(1, 3, 1),
							(1, 2, 3),
							(1, 1, 1);

create table DspnProd (
	idFornecedor int,
	idProduto int,
	constraint fk_Fornecedor foreign key (idFornecedor) references Fornecedor (idFornecedor),
	constraint fk_Produtodspn foreign key (idProduto) references Produto (idProduto)
);

create table Estoque (
	idEstoque int primary key,
	localizacao varchar (45)
);

create table ProdEstoque (
	idProduto int,
	idEstoque int,
	constraint fk_ProdutoEst foreign key (idProduto) references Produto (idProduto),
	constraint fk_Estoque foreign key (idEstoque) references Estoque (idEstoque)
);

create table Cliente (
	idCliente int primary key,
	nome varchar (45),
	identificacao varchar(45),
	endereco varchar (45),
	tipoCliente enum ('PJ', 'PF')
);

insert into Cliente values (1, 'C1', '001', 'Rua A, num 1', 'PF');
insert into Cliente values (2, 'C2', '002', 'Rua B, num 2', 'PJ');
insert into Cliente values (3, 'C3', '003', 'Rua C, num 3', 'PF');

create table Pedido (
	idPedido int primary key,
	statusPedido varchar (45),
	descricao varchar (45),
	fk_idCliente int,
	frete float,
	constraint fk_Cliente foreign key (fk_idCliente) references Cliente (idCliente)
);

insert into Pedido values (1, 'Em andamento', 'Pedido para cliente C1', 1, 15.50);
insert into Pedido values (2, 'Finalizado', 'Pedido para cliente C2', 2, 30.00);
insert into Pedido values (3, 'Cancelado', 'Pedido para cliente C3', 3, 20.75);
insert into Pedido values (4, 'Finalizado', 'Pedido para cliente C1', 1, 15.50);

create table ProdPedido (
	fk_idProduto int,
    fk_idPedido int,
    qtd varchar (45),
    constraint fk_ProdutoPedido foreign key (fk_idProduto) references Produto (idProduto),
    constraint fk_PedidoProduto foreign key (fk_idPedido) references Pedido (idPedido)
);

create table Pagamento (
	idPagamento int primary key,
    fk_idCliente int,
    tipoPagamento varchar (45),
    constraint fk_ClientePagamento foreign key (fk_idCliente) references Cliente (idCliente)
);

create table Entrega (
	idEntrega int primary key,
    fk_idPedido int,
    statusEntrega varchar (45),
    codRastreamento varchar (45),
    constraint fk_PedidoEntrega foreign key (fk_idPedido) references Pedido (idPedido)
);

-- Recuperações simples com SELECT Statement
select * from Cliente;

select nome, identificacao from Cliente 
	where tipoCliente = 'PF' 
	order by identificacao DESC;
    
-- Filtros com WHERE Statement
select * from Pedido
	where fk_idCliente in (select idCliente from Cliente where tipoCliente = 'PF');
    
-- Crie expressões para gerar atributos derivados
select c.nome, sum(p.frete) as totalFrete from Cliente c
	join Pedido p on c.idCliente = p.fk_idCliente
    group by c.nome;

-- Defina ordenações dos dados com ORDER BY
select * from Pedido
	order by frete ASC;
    
select * from Pedido
	order by frete DESC;

-- Condições de filtros aos grupos – HAVING Statement
select avg(frete) AS mediaFrete, statusPedido
	from Pedido
	group by statusPedido
	having avg(frete) > 18;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
select c.nome, p.statusPedido from Cliente c
	join Pedido p on c.idCliente = p.fk_idCliente;