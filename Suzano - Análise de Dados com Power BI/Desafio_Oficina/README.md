## Modelagem de uma oficina - Narrativa

- Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica
- Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões  periódicas
- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra
- O valor de cada peça também irá compor a OSO cliente autoriza a execução dos serviços
- A mesma equipe avalia e executa os serviços
- Os mecânicos possuem código, nome, endereço e especialidade
- Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.


### Lógica

Foi adicionado a lógica SQL para manipulação dos dados, além de serem criadas queries SQL para as cláusulas:
- Recuperações simples com SELECT Statement: `Quais são os nomes de todos os veículos registrados no banco de dados?`
- Filtros com WHERE Statement: `Qual é o nome do cliente que possui um Fusca?`
- Crie expressões para gerar atributos derivados: `Qual é o valor total de cada serviço?`
- Defina ordenações dos dados com ORDER BY: `Quais ordens ainda estão pendentes (NULL) quando comparadas às demais?`
- Condições de filtros aos grupos – HAVING Statement: `Quais mecânicos participaram de ordens de serviço onde o valor máximo de peças foi superior a 98?`
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados: `Quais clientes possuem quais veículos registrados no sistema?`

#### Objetivo

Criar um esquema conceitual, lógico e `ScriptSQL` para o contexto de oficina com base na narrativa.
