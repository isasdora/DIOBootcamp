create table Cliente (
	idCliente int primary key,
    nome varchar (45),
    endereco varchar (45)
);

insert into Cliente values (1, 'Carlos Silva', 'Rua A, 123'),
							(2, 'Ana Oliveira', 'Avenida B, 456'),
							(3, 'José Santos', 'Praça C, 789');

create table Veiculo (
	idVeiculo int primary key,
    nome varchar (45),
    idCliente int, 
    placa varchar (45),
    constraint fk_ClienteVeiculo foreign key (idCliente) references Cliente (idCliente)
);

insert into Veiculo values (1, 'Fusca', 1, 'ABC1234'),
							(2, 'Gol', 2, 'XYZ5678'),
							(3, 'Civic', 3, 'MNO9101');

create table Mecanico (
	idMecanico int primary key,
    endereco varchar (45),
    nome varchar (45)
);

insert into Mecanico values (1, 'Rua D, 321', 'João Pereira'),
							(2, 'Rua E, 654', 'Maria Costa'),
							(3, 'Avenida F, 987', 'Lucas Almeida');

create table OS (
	idOs int primary key,
    data_emissao date,
    valor float,
    statusOs varchar (45),
    data_conclusao date
);

insert into OS values (1, '2024-12-01', 350.50, 'Em andamento', '2024-12-05'),
						(2, '2024-12-02', 120.00, 'Concluída', '2024-12-03'),
						(3, '2024-12-03', 450.75, 'Em andamento', NULL);

create table VclMcn (
	idDesignado int primary key,
    idMecanico int,
    idVeiculo int,
    constraint fk_MecanicoVeiculo foreign key (idMecanico) references Mecanico (idMecanico),
    constraint fk_VeiculoMecanico foreign key (idVeiculo) references Veiculo (idVeiculo)
);

insert into VclMcn values (1, 1, 1),
							(2, 2, 2),
							(3, 3, 3);

create table MaoObra (
	idMaoObra int primary key,
    valorPeca float,
    idMecanico int,
    idOs int,
    constraint fk_MecanicoMao foreign key (idMecanico) references Mecanico (idMecanico),
    constraint fk_OSMao foreign key (idOs) references OS (idOs)
);

insert into MaoObra values (1, 100.00, 1, 1),
							(2, 50.00, 2, 2),
							(3, 120.00, 3, 3);

-- Recuperações simples com SELECT Statement;
select nome from Veiculo;

-- Filtros com WHERE Statement;
select nome from Cliente where idCliente in (select idCliente from Veiculo where nome = 'Fusca');

-- Crie expressões para gerar atributos derivados;
select m.idMecanico, o.data_conclusao, mo.valorPeca, o.valor, (o.valor + mo.valorPeca) as valorTotal
	from Mecanico m 
    join MaoObra mo on m.idMecanico = mo.idMecanico
    join OS o on o.idOS = mo.idOs;

-- Defina ordenações dos dados com ORDER BY;
select * from OS
	order by data_conclusao ASC;

-- Condições de filtros aos grupos – HAVING Statement;
select m.nome from Mecanico m where idMecanico in (
	select mo.idMecanico from MaoObra mo
    group by mo.idMecanico
    having max(mo.valorPeca) > 98
);

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;
select c.nome as NomeCliente, v.nome as NomeVeiculo
	from Cliente c
	join Veiculo v on c.idCliente = v.idCliente;

