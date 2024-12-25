## E-Commerce

Este projeto foi desenvolvido para aprimorar conhecimentos em modelagem de banco de dados e gerenciamento de sistemas para 
e-commerce. O foco principal está em compreender como estruturar dados de forma eficiente para suportar operações comerciais, como 
cadastro de clientes, controle de estoque, gestão de pedidos e entregas.

### Modelagem

O sistema é baseado em um modelo relacional, com as seguintes tabelas principais:

- Cliente: Cadastro de clientes PF e PJ, com informações básicas como nome, identificação (CPF/CNPJ) e endereço.
- Produto: Registro de produtos com informações de categoria, descrição e valor.
- Pedido: Controle de pedidos realizados pelos clientes, incluindo frete e descrição.
- Pagamento: Cadastro de múltiplas formas de pagamento associadas a um cliente.
- Entrega: Informações sobre o status e o rastreio das entregas associadas aos pedidos.
- Estoque: Controle da quantidade de produtos disponíveis.
- Fornecedor: Cadastro de fornecedores e seus produtos associados.

### Lógica

Foi adicionado a lógica SQL para manipulação dos dados, além de serem criadas queries SQL para as cláusulas:
- Recuperações simples com SELECT Statement: `Quais são todos os clientes registrados no banco de dados?` e `Quais são os clientes do tipo Pessoa Física (PF), ordenados por identificação em ordem decrescente?`
- Filtros com WHERE Statement: `Quais pedidos foram feitos por clientes do tipo Pessoa Física (PF)?`
- Crie expressões para gerar atributos derivados: `Qual é o valor total de frete pago por cada cliente?`
- Defina ordenações dos dados com ORDER BY: `Quais pedidos têm o frete mais baixo?` e `Quais pedidos têm o frete mais alto?`
- Condições de filtros aos grupos – HAVING Statement: `Quais status de pedidos têm uma média de frete superior a 18?`
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados: `Quais são os nomes dos clientes e o status de seus respectivos pedidos?`

### Objetivo do Projeto

O principal objetivo deste projeto é aprender e praticar conceitos de banco de dados relacionais, além de compreender como 
aplicar esses conceitos em um contexto de e-commerce. Por ser parte de um bootcamp, o foco está em consolidar habilidades técnicas 
e expandir conhecimentos na área.
