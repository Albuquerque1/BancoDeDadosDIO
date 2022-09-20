/* ============ Criação do bando de dados para o cenário de E-commerce ===================*/
CREATE SCHEMA E_COMMERCE; 
DROP SCHEMA E_COMMERCE;
USE E_COMMERCE;
SHOW TABLES;
SHOW DATABASES;

# Identificando as constraint 
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = "E_COMMERCE"; # Mostrar informações sobre constraint 

SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = "E_COMMERCE"; # Mostrar informações sobre constraint 
/*========================================================================================*/


# ============================= Criação das tabelas =======================================================================
DROP TABLE CLIENTE;
DESC CLIENTE;
CREATE TABLE CLIENTE( # =======================================> TABELA CLIENTE 
	Id_Cliente INT NOT NULL AUTO_INCREMENT,
    Tipo_de_Cliente ENUM('Pessoa Física', 'Pessoa Jurídica') NOT NULL,  
    
    /*--- Cosntraint Chave primária ---*/
    PRIMARY KEY (Id_Cliente)
);
ALTER TABLE CLIENTE AUTO_INCREMENT = 1;

DROP TABLE PESSOA_FISICA;
CREATE TABLE PESSOA_FISICA( # ================================> TABELA PESSOA FÍSICA ESPECIALIZAÇÃO DA TABELA CLIENTE
	Id_PF_Id_Cliente INT,
    Pnome VARCHAR(20) NOT NULL,
    InicialNomeMeio CHAR(1) NOT NULL,
    Unome VARCHAR(20) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Endereço VARCHAR(45) NOT NULL,
    Data_Nascimento DATE,
    
    /*--- Constraint Unique ---*/
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    
    /*--- Constraint Chave estrangeira ---*/
    FOREIGN KEY (Id_PF_Id_Cliente) REFERENCES CLIENTE(Id_Cliente) ON UPDATE CASCADE, 
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY (Id_PF_Id_Cliente)
);

DROP TABLE PESSOA_JURIDICA;
CREATE TABLE PESSOA_JURIDICA( # ================================> TABELA PESSOA JURÍDICA ESPECIALIZAÇÃO DA TABELA CLIENTE
	Id_PJ_Id_Cliente INT,
    CNPJ CHAR(14) NOT NULL,
    Razao_Social VARCHAR(65) NOT NULL,
    
    /*--- Constraint Unique ---*/
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ),
    
     /*--- Constraint Chave estrangeira ---*/
    FOREIGN KEY (Id_PJ_Id_Cliente) REFERENCES CLIENTE(Id_Cliente) ON UPDATE CASCADE,
    
    /*--- Constraint Chave primária---*/
    PRIMARY KEY (Id_PJ_Id_Cliente)
);

SELECT * FROM ENTREGA;
CREATE TABLE ENTREGA( # ========================================> TABELA ENTREGA
	Id_Entrega INT NOT NULL AUTO_INCREMENT,
    Data_pedido DATE NOT NULL,
    Data_Entrega DATE NOT NULL,
    Endereco_Entrega VARCHAR(65) NOT NULL,
    Codigo_Rastreio CHAR(13) NOT NULL,
    Status_Entrega ENUM('Entregue', 'Não Entregue') NOT NULL,
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY (Id_Entrega)
);
ALTER TABLE ENTREGA AUTO_INCREMENT = 1;

SELECT * FROM PEDIDO;
CREATE TABLE PEDIDO( # =========================================> TABELA PEDIDO
	Id_Pedido INT NOT NULL AUTO_INCREMENT,
    Status_Pedido ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue') NOT NULL DEFAULT 'Processando',
	Descrição_Pedido VARCHAR(225),
    Frete FLOAT DEFAULT 10,
    Tipo_Pagamento ENUM('Dinheiro', 'Cartão') DEFAULT 'Dinheiro',
    
    /*--- Constraint Chave estrangeira ---*/
    PedClien_IdCliente INT,
    FOREIGN KEY (PedClien_IdCliente) REFERENCES CLIENTE(Id_Cliente) ON UPDATE CASCADE,
    PedEntre_IdEntrega INT,
    FOREIGN KEY (PedEntre_IdEntrega) REFERENCES ENTREGA(Id_Entrega) ON UPDATE CASCADE,
    
    /*---- Constraint Chave primária ---*/
    PRIMARY KEY (Id_Pedido)
);
ALTER TABLE PEDIDO AUTO_INCREMENT = 1;

DESC PRODUTO;
DROP TABLE PRODUTO;
CREATE TABLE PRODUTO( # =======================================> TABELA PRODUTO
	Id_Produto INT NOT NULL AUTO_INCREMENT,
    Categoria VARCHAR(45) NOT NULL,
	Descrição VARCHAR(225),
	Valor VARCHAR(45) NOT NULL,
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY (Id_Produto)
);
ALTER TABLE PRODUTO AUTO_INCREMENT = 1;


CREATE TABLE ESTOQUE( # =======================================> TABELA ESTOQUE
	Id_Estoque INT NOT NULL AUTO_INCREMENT,
    Localizacao VARCHAR(65) NOT NULL,
    Quantidade INT NOT NULL DEFAULT 0,
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY (Id_Estoque)
);
ALTER TABLE ESTOQUE AUTO_INCREMENT = 1;


CREATE TABLE FORNECEDOR( # =======================================> TABELA FORNECEDOR
	Id_Fornecedor INT NOT NULL AUTO_INCREMENT,
    Razao_Social VARCHAR(65),
    CNPJ CHAR(14) NOT NULL,
    
    /*--- Constraint Unique ---*/
    UNIQUE (CNPJ),
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY (Id_Fornecedor)
);
ALTER TABLE FORNECEDOR AUTO_INCREMENT = 1;


CREATE TABLE PEDIDO_PRODUTO( # =======================> TABELA PEDIDO_PRODUTO DO RELACIONAMENTO N:M ENTRE PEDIDO E PRODUTO 
	PedProd_Id_Pedido INT,
    PedProd_Id_Produto INT,
    Status_Ped_Prod ENUM('Disponível', 'Sem estoque'),
    
    /*--- Constraint Chave estrangeira ---*/
    FOREIGN KEY (PedProd_Id_Pedido) REFERENCES PEDIDO(Id_Pedido) ON UPDATE CASCADE,
    FOREIGN KEY (PedProd_Id_Produto) REFERENCES PRODUTO(Id_Produto) ON UPDATE CASCADE,
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY(PedProd_Id_Pedido, PedProd_Id_Produto)
);

CREATE TABLE PRODUTO_FORNECEDOR( # =======================> TABELA PRODUTO_FORNECEDOR DO RELACIONAMENTO N:M ENTRE PRODUTO E FORNECEDOR 
	ProdForn_Id_Produto INT,
    ProdForn_Id_Fornecedor INT,
    
    /*--- Constraint Chave estrangeira ---*/
    FOREIGN KEY (ProdForn_Id_Produto) REFERENCES PRODUTO(Id_Produto) ON UPDATE CASCADE,
    FOREIGN KEY (ProdForn_Id_Fornecedor) REFERENCES FORNECEDOR(Id_Fornecedor) ON UPDATE CASCADE,
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY (ProdForn_Id_Produto, ProdForn_Id_Fornecedor)
);


CREATE TABLE PRODUTO_ESTOQUE( # =======================> TABELA PRODUTO_ESTOQUE DO RELACIONAMENTO N:M ENTRE PRODUTO E ESTOQUE 
	ProdEstoq_Id_Produto INT,
    ProdEstoq_Id_Estoque INT,
    
    /*--- Constraint Chave estrangeira ---*/
    FOREIGN KEY (ProdEstoq_Id_Produto) REFERENCES PRODUTO(Id_Produto) ON UPDATE CASCADE,
    FOREIGN KEY (ProdEstoq_Id_Estoque) REFERENCES ESTOQUE(Id_Estoque) ON UPDATE CASCADE,
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY (ProdEstoq_Id_Produto, ProdEstoq_Id_Estoque)
);

#==========================================================================================================================
















