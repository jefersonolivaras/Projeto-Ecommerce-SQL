use ecommerce;

show tables;

-- Inserir dados na tabela cliente
INSERT INTO clients (Fname, Mname, Lname, TaxId, Address, BirthDate) VALUES
('John', 'A.', 'Doe', '12345678901', '123 Main St, Springfield', '1985-01-15'),
('Jane', 'B.', 'Smith', '10987654321', '456 Elm St, Shelbyville', '1990-06-20');

-- Inserir dados na tabela produto
INSERT INTO product (Pname, Classification_Kids, Category, Rate, Size) VALUES
('Tablet', false, 'Eletrônicos', 4.5, 'Medium'),
('T-Shirt', false, 'Vestuário', 4.0, 'Large'),
('Doll', true, 'Brinquedos', 5.0, 'Small');

-- Inserir dados na tabela pedido
INSERT INTO orders (idOrderClient, orderStatus, oderDescription, freight, paymentCash) VALUES
(1, 'Confirmado', 'Order of electronics and toys', 15.0, true),
(2, 'Em processamento', 'Order of clothing', 10.0, false);

-- Inserir dados na tabela pagamento
INSERT INTO payment (idClient, idPayment, typePayment, limitAvailable) VALUES
(1, 101, 'Cartão', 2000.00),
(2, 102, 'Boleto', 1500.00);

-- Inserir dados na tabela estoque
INSERT INTO productStorage (storageLocation, quantity) VALUES
('Warehouse A', 100),
('Warehouse B', 50);

-- Inserir dados na tabela fornecedor
INSERT INTO supplier (socialName, CNPJ, contact) VALUES
('Tech Distributors Ltd.', '12345678901234', '9876543210'),
('Clothing Co.', '43210987654321', '8765432109');

-- Inserir dados na tabela vendedor
INSERT INTO seller (socialName, abstractName, location, CNPJ, CPF, contact) VALUES
('Gadget Sellers Ltd.', 'Gadgets', 'Downtown Springfield', '11122233344455', '123456789', '9123456780'),
('Fashion Outlet', 'Trendy Fashion', 'Uptown Shelbyville', '55566677788899', '987654321', '9876543211');

-- Inserir dados na tabela produto por vendedor
INSERT INTO productSeller (idProduct, prodQuantity) VALUES
(1, 20),
(2, 30);

-- Inserir dados na tabela produto por pedido
INSERT INTO productOrder (idProduct, prodQuantity, PStatus) VALUES
(1, 2, 'Disponível'),
(3, 1, 'Sem estoque');

-- Inserir dados na tabela produto por fornecedor
INSERT INTO productSupplier (idPsupplier, idPproduct, quantity) VALUES
(1, 1, 50),
(2, 2, 100);

-- Inserir dados na tabela local do estoque
INSERT INTO storageLocation (idLstorage, idLproduct, location) VALUES
(1, 1, 'Shelf 1A'),
(2, 2, 'Shelf 2B');
