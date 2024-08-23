/* Atividade solicitas via chatgpt para pratica de sql com o banco de dados*/ 

USE PRATICANDO;

SELECT * FROM clientes;
SELECT * FROM servicos;
SELECT * FROM utilizacoes;

/* 1. Selecione todos os clientes que nasceram antes de 1980. */

SELECT Nome, DataNasc as 'Data de Nascimento' from clientes where DataNasc < '1980-01-01';

/* 2. Liste os nomes e telefones dos clientes que moram em "São Paulo". */

SELECT Nome, Telefone, Cidade FROM clientes WHERE Cidade = 'São Paulo';

/* 3. Selecione todos os serviços cujo valor seja maior que '200.00'. */

SELECT NomeServ, Valor FROM servicos WHERE Valor > 200.00;

/* 4. Encontre todos os clientes cujo nome começa com a letra "A". */

SELECT Nome FROM clientes WHERE Nome LIKE 'A%';

/* 5. Selecione todas as utilizações em que o serviço utilizado tem o número "3". */

SELECT * FROM utilizacoes WHERE Ordem LIKE '%3%';

/* 6. Liste todos os clientes do sexo feminino (Sexo = 'F'). */

SELECT Nome, Sexo FROM clientes WHERE Sexo = 'F';

/* 7. Selecione o nome dos clientes que têm "Silva" no sobrenome. */

SELECT Nome FROM clientes WHERE Nome LIKE '%Silva';

/* 8. Encontre todas as utilizações feitas por clientes do sexo masculino (Sexo = 'M'). */

SELECT Ordem, Cliente FROM utilizacoes WHERE Cliente IN (SELECT Cadastro FROM clientes WHERE Sexo = 'M');

/* 9. Selecione todos os serviços cujo valor esteja entre '100.00' e '300.00'. */

SELECT * FROM servicos WHERE Valor > 100.00 AND Valor < 300.00;

/* 10. Liste todos os clientes nascidos após 1º de janeiro de 1990. */

SELECT Nome, DataNasc as 'Data de Nascimento' from clientes where DataNasc > '1990-01-01';

/* 11. Encontre o nome e cidade dos clientes que moram em cidades que começam com "C". */

SELECT Nome, Cidade FROM Clientes WHERE Cidade LIKE 'C%';

/* 12. Selecione todas as utilizações feitas por clientes nascidos antes de 1970. */

SELECT Ordem, Cliente FROM utilizacoes WHERE Cliente IN (SELECT Cadastro FROM clientes WHERE DataNasc < '1970-01-01'); 

/* 13. Liste todos os serviços cujo nome termina com "1". */

SELECT NomeServ FROM Servicos WHERE `NomeServ` LIKE '%1';

/* 14. Encontre todos os clientes que têm "M" como inicial do primeiro nome. */

SELECT Nome FROM clientes WHERE `Nome` LIKE 'M%';

/* 15. Selecione os clientes cujos telefones contêm o código de área "11". */

SELECT Nome, Telefone FROM clientes WHERE `Telefone` LIKE '(11)%';

/* 16. Liste todos os serviços cujo valor não seja igual a '150.00'. */

SELECT NomeServ, `Valor` FROM servicos WHERE `Valor` <> 150.00;

/* 17. Encontre todos os clientes que moram em cidades diferentes de "Rio de Janeiro". */

SELECT `Cadastro`, Nome, Cidade FROM clientes WHERE `Cidade` <> 'Rio de Janeiro';

/* 18. Selecione os serviços que têm um valor menor que '250.00'. */

SELECT NomeServ, Valor FROM servicos WHERE `Valor` < 250.00;

/* 19. Liste as utilizações em que o cliente tenha o número de cadastro maior que 200. */

SELECT Ordem, Cliente FROM utilizacoes WHERE `Cliente` IN (SELECT Cadastro FROM clientes WHERE `Cadastro` > 200);

/* 20. Encontre todos os clientes que têm "Santos" como sobrenome. */

SELECT Nome FROM clientes WHERE `Nome` LIKE '%Santos';

/* 21. Selecione todos os serviços cujo valor seja exatamente '300.00'. */

SELECT NomeServ, Valor FROM servicos WHERE `Valor` = 300.00;

/* 22. Liste todos os clientes que moram em cidades que terminam com "o". */

SELECT Nome, Cidade FROM clientes WHERE `Cidade` like '%o';

/* 23. Encontre todas as utilizações onde o número de ordem é maior que 500. */

SELECT Ordem, Cliente FROM utilizacoes WHERE `Ordem` > 500;

/* 24. Selecione todos os clientes cujo nome completo contém a letra "r". */

SELECT Nome FROM clientes WHERE `Nome` like '%r%';

/* 25. Liste todos os serviços cujo nome tem exatamente 9 caracteres. */

SELECT NomeServ FROM servicos WHERE LENGTH(NomeServ) = 9;

/* 26. Encontre todos os clientes que nasceram entre 1950 e 1970. */

SELECT Nome, DataNasc FROM clientes WHERE `DataNasc` > '1950-01-01' AND `DataNasc` < '1970-01-01';

/* 27. Selecione as utilizações em que o serviço utilizado tem um valor menor que '100.00'. */

SELECT Ordem, Servico FROM utilizacoes WHERE `Servico` IN (SELECT NumServ FROM servicos WHERE `Valor` < 100.00);

/* 28. Liste todos os clientes cujos nomes têm mais de 10 caracteres. */

SELECT Nome FROM clientes WHERE LENGTH(`Nome`) > 10;

/* 29. Encontre os serviços que têm "Serv" no nome. */

SELECT NomeServ FROM servicos WHERE `NomeServ` LIKE 'Serv%';

/* 30. Selecione todas as utilizações onde o cliente tem "Carla" como primeiro nome. */

SELECT Ordem, Cliente FROM utilizacoes WHERE `Cliente` IN (SELECT Cadastro FROM clientes WHERE `Nome` like 'Carla%');