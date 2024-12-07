use ecommerce;

-- RECUPERAÇÕES SIMPLES COM SELECT STATEMENT

-- Recuperar todos os clientes
SELECT * FROM clients;

-- Recuperar nomes e categorias dos produtos
SELECT Pname, Category FROM product;

-- FILTROS COM WHERE STATEMENT

-- Recuperar clientes nascidos após o ano 1990
SELECT Fname, Lname, BirthDate FROM clients
	WHERE BirthDate > '1990-01-01';

-- Recuperar produtos da categoria 'Eletrônicos' com avaliação maior que 4.0
SELECT Pname, Rate FROM product
	WHERE Category = 'Eletrônicos' AND Rate > 4.0;

-- EXPRESSÕES PARA GERAR ATRIBUTOS DERIVADOS

-- Calcular a idade dos clientes com base na data de nascimento
SELECT Fname, Lname, YEAR(CURDATE()) - YEAR(BirthDate) AS Age FROM clients;

-- Adicionar 10% ao valor do frete dos pedidos
SELECT idOrder, freight, freight * 1.1 AS Freight_With_Increase FROM orders;

-- ORDENAÇOES DOS DADOS COM ORDER BY

-- Ordenar os clientes pelo sobrenome em ordem alfabética
SELECT Fname, Lname FROM clients
	ORDER BY Lname ASC;

-- Ordenar os produtos pela avaliação em ordem decrescente
SELECT Pname, Rate FROM product
	ORDER BY Rate DESC;

-- FILTROS COM HAVING STATEMENT

-- Recuperar categorias de produtos com taxa média de avaliação acima de 4.0
SELECT Category, AVG(Rate) AS AvgRate FROM product
	GROUP BY Category
	HAVING AVG(Rate) > 4.0;

-- Mostrar locais de armazenamento com mais de 50 itens
SELECT storageLocation, SUM(quantity) AS TotalQuantity FROM productStorage
	GROUP BY storageLocation
	HAVING SUM(quantity) > 50;

-- JUNÇÕES ENTRE TABELAS

-- Exibir pedidos com as informações do cliente
SELECT o.idOrder, c.Fname, c.Lname, o.oderDescription, o.orderStatus FROM orders o
	JOIN clients c ON o.idOrderClient = c.idClient;

-- Listar produtos vendidos por fornecedores
SELECT p.Pname, s.socialName FROM productSupplier ps
	JOIN product p ON ps.idPproduct = p.idProduct
	JOIN supplier s ON ps.idPsupplier = s.idSupplier;

-- Mostrar pedidos com detalhes do produto e cliente
SELECT o.idOrder, c.Fname AS ClientName, p.Pname AS ProductName, po.prodQuantity
	FROM productOrder po
	JOIN orders o ON po.idPorder = o.idOrder
	JOIN product p ON po.idProduct = p.idProduct
	JOIN clients c ON o.idOrderClient = c.idClient;
