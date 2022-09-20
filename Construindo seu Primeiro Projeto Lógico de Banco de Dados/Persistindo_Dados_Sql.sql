# ========================================= INSERINDO OS DADOS ================================================
USE E_COMMERCE;

# 1) Tabela Cliente________________________________________
/*
TABLE CLIENTE
	Id_Cliente INT NOT NULL AUTO_INCREMENT,
    Tipo_de_Cliente ENUM('Pessoa Física', 'Pessoa Jurídica') NOT NULL,  
*/
#SELECT * FROM CLIENTE;
#DELETE FROM CLIENTE;
INSERT INTO 
	CLIENTE (Id_Cliente, Tipo_de_cliente) 
VALUES
	(1, 'Pessoa Física'),
    (2, 'Pessoa Jurídica'),
    (3, 'Pessoa Física');

# 2) Tabela Pessoa Física___________________________________
/*
TABLE PESSOA_FISICA
	Id_PF_Id_Cliente INT,
    Pnome VARCHAR(20) NOT NULL,
    InicialNomeMeio CHAR(1) NOT NULL,
    Unome VARCHAR(20) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Endereço VARCHAR(45) NOT NULL,
    Data_Nascimento DATE,    
*/    
#SELECT * FROM PESSOA_FISICA;
#DELETE FROM PESSOA_FISICA; 
INSERT INTO 
	PESSOA_FISICA (Id_PF_Id_Cliente, Pnome, InicialNomeMeio, Unome, CPF, Endereço, Data_Nascimento)
VALUES
		(1, 'Aeronauta', 'M', 'Barata', '11111111111', 'Avenida AMB',  '1991-01-01'),
        (3, 'Beterraba  ', 'B', 'Fonseca', '22222222222', 'Rua BBF',  '1998-07-22');

# 3) Tabela Pessoa Jurídica______________________________________
/*
TABLE PESSOA_JURIDICA
	Id_PJ_Id_Cliente INT,
    CNPJ CHAR(14) NOT NULL,
    Razao_Social VARCHAR(65) NOT NULL,
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ),
    FOREIGN KEY (Id_PJ_Id_Cliente) REFERENCES CLIENTE(Id_Cliente) ON UPDATE CASCADE,
    PRIMARY KEY (Id_PJ_Id_Cliente)
*/
#SELECT * FROM PESSOA_JURIDICA; 
INSERT INTO
	PESSOA_JURIDICA (Id_PJ_Id_Cliente, CNPJ, Razao_Social)
VALUES
	(2, 3336665552222, 'Eu Tenho Produtos LTDA');


# 4) Tabela Entrega__________________________________________________
/*
TABLE ENTREGA
	Id_Entrega INT NOT NULL AUTO_INCREMENT,
    Data_pedido DATE NOT NULL,
    Data_Entrega DATE NOT NULL,
    Endereco_Entrega VARCHAR(65) NOT NULL,
    Codigo_Rastreio CHAR(13) NOT NULL,
    Status_Entrega ENUM('Entregue', 'Não Entregue') NOT NULL,
    PRIMARY KEY (Id_Entrega)
*/
#SELECT * FROM ENTREGA;
#DELETE FROM ENTREGA;
INSERT INTO 
	ENTREGA (Id_Entrega, Data_pedido, Data_Entrega, Endereco_Entrega, Codigo_Rastreio, Status_Entrega)
VALUES
	(1, '2022-08-02', '2022-08-03', 'Avenida AMB', 'SL123456789BR', 'Entregue'),
    (2, '2022-09-13', '2022-09-13', 'Rua Beira Rio', 'BB123456789GT', 'Não Entregue'),
    (3, '2022-01-25', '2022-03-01', 'Rua BBF', 'AA123456789RE', 'Não Entregue');


# 5) Tabela Pedido__________________________________________________
/*
TABLE PEDIDO
	Id_Pedido INT NOT NULL AUTO_INCREMENT,
    Status_Pedido ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue') NOT NULL DEFAULT 'Processando',
	Descrição_Pedido VARCHAR(225),
    Frete FLOAT DEFAULT 10,
    Tipo_Pagamento ENUM('Dinheiro', 'Cartão') DEFAULT 'Dinheiro',
    
    PedClien_IdCliente INT,
    FOREIGN KEY (PedClien_IdCliente) REFERENCES CLIENTE(Id_Cliente) ON UPDATE CASCADE,
    
    PedEntre_IdEntrega INT,
    FOREIGN KEY (PedEntre_IdEntrega) REFERENCES ENTREGA(Id_Entrega) ON UPDATE CASCADE,
    
    PRIMARY KEY (Id_Pedido)
*/
#SELECT * FROM PEDIDO;
#DELETE FROM PEDIDO; 
INSERT INTO
	PEDIDO (Id_Pedido, Status_Pedido, Descrição_Pedido, Frete, Tipo_Pagamento, PedClien_IdCliente, PedEntre_IdEntrega)
VALUES
	(1, 'Enviado', 'ssd Crucial bx500 500gb', default, 'Cartão', 1, 1),
    (2, DEFAULT, 'Laptop dell core i7', 48.90, DEFAULT, 2, 2),
    (3, 'Em andamento', 'Pulseira inteligente Mi Band 7', 16.50, 'Cartão', 3, 3);

# 6) Tabela Produto____________________________________________________
/*
TABLE PRODUTO
	Id_Produto INT NOT NULL AUTO_INCREMENT,
    Categoria VARCHAR(45) NOT NULL,
	Descrição VARCHAR(225),
	Valor VARCHAR(45) NOT NULL,
    PRIMARY KEY (Id_Produto)
*/
#SELECT * FROM PRODUTO;
#DELETE FROM PRODUTO; 
INSERT INTO
	PRODUTO (Id_Produto, Categoria, Descrição, Valor)
VALUES
	(1, 'Eletrônico', 'ssd Crucial bx500 500gb', '258.77'),
    (2, 'Eletrônico', 'Laptop dell core i7',  '6325.90'),
    (3, 'Eletrônico', 'Pulseira inteligente Mi Band 7', '169.76');


# 7) Tabela Estoque_________________________________________________________
/*
TABLE ESTOQUE
	Id_Estoque INT NOT NULL AUTO_INCREMENT,
    Localizacao VARCHAR(65) NOT NULL,
    Quantidade INT NOT NULL DEFAULT 0,
    PRIMARY KEY (Id_Estoque)
*/
#SELECT * FROM ESTOQUE;
#DELETE FROM ESTOQUE;
INSERT INTO
	ESTOQUE(Id_Estoque, Localizacao, Quantidade)
VALUE
	(1, 'A1', 10),
    (2, 'A2', 5),
    (3, 'A3', 20);


# 8) Tabela Fornecedor_________________________________________________________
/*
TABLE FORNECEDOR
	Id_Fornecedor INT NOT NULL AUTO_INCREMENT,
    Razao_Social VARCHAR(65),
    CNPJ CHAR(14) NOT NULL,
    UNIQUE (CNPJ),
    PRIMARY KEY (Id_Fornecedor)
*/
#SELECT * FROM FORNECEDOR;
#DELETE FROM FORNECEDOR;
INSERT INTO
	FORNECEDOR(Id_Fornecedor, Razao_Social, CNPJ)
VALUES
	(1, 'Lojão dos Eletrônicos', '12121212121212'),
    (2, 'Fornecedor de Produtos', '45454545454545'),
    (3, 'Direto da China', '78787878787878');


# 9) Tabela Pedido_Produto_________________________________________________________
/*
TABLE PEDIDO_PRODUTO
	PedProd_Id_Pedido INT,
    PedProd_Id_Produto INT,
    Status_Ped_Prod ENUM('Disponível', 'Sem estoque'),
    FOREIGN KEY (PedProd_Id_Pedido) REFERENCES PEDIDO(Id_Pedido) ON UPDATE CASCADE,
    FOREIGN KEY (PedProd_Id_Produto) REFERENCES PRODUTO(Id_Produto) ON UPDATE CASCADE,
    PRIMARY KEY(PedProd_Id_Pedido, PedProd_Id_Produto)
*/
#SELECT * FROM PEDIDO_PRODUTO;
INSERT INTO
	PEDIDO_PRODUTO(PedProd_Id_Pedido, PedProd_Id_Produto, Status_Ped_Prod)
VALUES
	(1, 1, 'Disponível'),
    (2, 2,'Disponível'),
    (3, 3, 'Sem estoque');


# 10) Tabela Produto_Fornecedor_________________________________________________________
/*
TABLE PRODUTO_FORNECEDOR
	ProdForn_Id_Produto INT,
    ProdForn_Id_Fornecedor INT,
    FOREIGN KEY (ProdForn_Id_Produto) REFERENCES PRODUTO(Id_Produto) ON UPDATE CASCADE,
    FOREIGN KEY (ProdForn_Id_Fornecedor) REFERENCES FORNECEDOR(Id_Fornecedor) ON UPDATE CASCADE,
    PRIMARY KEY (ProdForn_Id_Produto, ProdForn_Id_Fornecedor)
*/
#SELECT * FROM PRODUTO_FORNECEDOR;
#DELETE FROM PRODUTO_FORNECEDOR;
INSERT INTO
	PRODUTO_FORNECEDOR(ProdForn_Id_Produto, ProdForn_Id_Fornecedor)
VALUES
	(1, 1),
    (2, 2),
    (3, 3);


# 11) Tabela Produto_Estoque_________________________________________________________
/*
TABLE PRODUTO_ESTOQUE
	ProdEstoq_Id_Produto INT,
    ProdEstoq_Id_Estoque INT,
    FOREIGN KEY (ProdEstoq_Id_Produto) REFERENCES PRODUTO(Id_Produto) ON UPDATE CASCADE,
    FOREIGN KEY (ProdEstoq_Id_Estoque) REFERENCES ESTOQUE(Id_Estoque) ON UPDATE CASCADE,
    PRIMARY KEY (ProdEstoq_Id_Produto, ProdEstoq_Id_Estoque)
*/
#SELECT * FROM PRODUTO_ESTOQUE;
INSERT INTO
	PRODUTO_ESTOQUE(ProdEstoq_Id_Produto, ProdEstoq_Id_Estoque)
VALUES
	(1, 1),
    (2, 2),
    (3, 3);

#==================================================================================================================================