# ---------------------- Persistindo Os Dados ---------------------------
USE ORDEM_SERVICO_OFICINA;


/*
TABLE CLIENTE
	Id_Cliente INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Placa_Carro CHAR(7) NOT NULL,
    PRIMARY KEY (Id_Cliente)
*/
INSERT INTO
	CLIENTE (Id_Cliente, Nome, Placa_Carro)
VALUES
	(1, 'Maria Clara', 'AAA1212'),
    (2, 'Charles Xavier', 'ABC2323'),
    (3, 'Luiza Alves', 'CVC5258'),
    (4, 'Antonio Malandro', 'DDD4444');
SELECT * FROM CLIENTE;
    
/*    
TABLE EQUIPE_MECANICOS
	Id_Equipe INT NOT NULL AUTO_INCREMENT,
    Numero_de_Integrantes INT,
    PRIMARY KEY (Id_Equipe)    
*/    
INSERT INTO
	EQUIPE_MECANICOS (Id_Equipe, Numero_de_Integrantes)
VALUES
	(1, 3),
    (2, 4),
    (3, 2),
    (4, 5);	
SELECT * FROM EQUIPE_MECANICOS;    
 
/*		
TABLE MECANICOS
	Id_Mecanicos INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(100),
    Endereco VARCHAR(100),
    Especialidade VARCHAR(100),
    
     Constraint Chave estrangeira
    Id_Mecanico_Equipe INT NOT NULL,
    FOREIGN KEY (Id_Mecanico_Equipe) REFERENCES EQUIPE_MECANICOS (Id_Equipe),
    
     Constraint Chave primária 
    PRIMARY KEY (Id_Mecanicos)
    */
INSERT INTO 
	MECANICOS (Id_Mecanicos, Nome, Endereco, Especialidade, Id_Mecanico_Equipe)
VALUES
	(1, 'Marco Antonio', 'Rua da Estrada', 'Trocar Pneu', 1),
    (2, 'Jadiel Aguiar', 'Rua Fiambre', 'Limpa Vidro', 1),
    (3, 'Frederico Oliveira', 'Avenida Caetano', 'Enxugar carro',  1),
    (4, 'Rafael Cabral', 'Alto do Céu', 'Quebra parafuso', 2),
    (5, 'Reginaldo Francisco', 'Avenida do Gelo', 'Trocador de para-brisa', 2),
    (6, 'Pedro Ramos', 'Avenida do Chocolate', 'Limpador de piso', 2),
    (7, 'Arthur Barbarini', 'Alto da Caveira', 'Trocador de óleo', 2),
    (8, 'Deborah Ideriha', 'Estrada do Valor', 'Trocador de Espelho', 3),
    (9, 'Eduarda Braga', 'Avenida Batata Doce', 'Conserta Parafuso', 3),
    (10, 'Felipe Dias', 'Rua da Madrugada', 'Desentupidor de cano',  4),
    (11, 'Fernando Domingues', 'Rua da Lagoa', 'Enchedor de Tanque', 4),
    (12, 'Gabriela Linde', 'Alto do Grilo', 'Limpa Banco', 4),
    (13, 'Giulia Costa', 'Avenida do Dragão', 'Conserta Carburador', 4),
    (14, 'Guilherme Peres', 'Alto da Vizinha', 'Desamassador de Ferro',  4);
		
/*
TABLE ORDEM_SERVICO
	Numero_Emissao INT NOT NULL AUTO_INCREMENT,
    Data_Emissao DATE,
    Data_Conclusao DATE,
    Status_Ordem ENUM('Processando', 'Serviço em execução', 'Serviço Concluído') DEFAULT 'Processando',
    Custo FLOAT,
    
     Constraint Chave estrangeira 
    Id_Ordem_Cliente INT,
    FOREIGN KEY (Id_Ordem_Cliente) REFERENCES CLIENTE (Id_Cliente),
    Id_Ordem_Equipe INT,
    FOREIGN KEY (Id_Ordem_Equipe) REFERENCES EQUIPE_MECANICOS (Id_Equipe),
    
     Constraint Chave primária 
    PRIMARY KEY (Numero_Emissao)
*/    
    
INSERT INTO
	ORDEM_SERVICO (Numero_Emissao, Data_Emissao, Data_Conclusao, Status_Ordem, Custo, Id_Ordem_Cliente, Id_Ordem_Equipe)
VALUES
	(1, '2022-01-01', '2022-01-31', 'Serviço em execução', 67.00, 1, 1),
    (2, '2021-05-02', '2021-06-01', DEFAULT, 132.50, 2, 2),
    (3, '2022-06-04', '2022-06-05', 'Serviço Concluído', 46.00, 3, 3),
    (4, '2022-09-21', '2022-10-01', 'Serviço Concluído', 116.00 , 4, 4);


/*			
TABLE SERVICO
	Id_Servico INT NOT NULL,
    Descriacao_servico VARCHAR(100),
    Valor_Servico FLOAT,
    
     Constraint Chave Estrangeira 
    Id_Servico_Ordem INT NOT NULL,
    FOREIGN KEY (Id_Servico_Ordem) REFERENCES ORDEM_SERVICO (Numero_Emissao),
    
     Constraint Chave primária 
    PRIMARY KEY (Id_Servico_Ordem, Id_Servico)    
*/    
INSERT INTO
	SERVICO (Id_Servico, Descriacao_servico, Valor_Servico, Id_Servico_Ordem)
VALUES
	(1, 'Trocar Pneu', 25.00, 1),
    (2, 'Limpar Vidro', 12.5, 1),
    (3, 'Enxugar carro', 12.5, 1),
    (4, 'Quebrar parafuso', 25.00, 2),
    (5, 'Trocar para-brisa', 25.00, 2),
    (6, 'Limpar de piso', 25, 2),
    (7, 'Trocar óleo', 25.00, 2),
    (8, 'Trocas Espelho', 10.00, 3),
    (9, 'Conserto de parafuso', 15.00, 3),
    (10, 'Desentupir cano', 10.00 , 4),
    (11, 'Encher Tanque', 30.00, 4),
    (12, 'Limpar banco', 5.00, 4),
    (13, 'Conserto de carburador', 15.00, 4),
    (14, 'Desamssar Ferro', 20.00, 4);
		

/*    
TABLE PECAS
	Id_Pecas INT NOT NULL,
    Descricao_Pecas VARCHAR(100),
    Quantidade INT,
    Valor FLOAT,
    
     Constraint Chave Estrangeira 
    Id_Pecas_Ordem INT,
    FOREIGN KEY (Id_Pecas_Ordem) REFERENCES ORDEM_SERVICO (Numero_Emissao),
    
     Constraint Chave prmária 
    PRIMARY KEY (Id_Pecas_Ordem, Id_Pecas)    
    */
INSERT INTO
	PECAS (Id_Pecas, Descricao_Pecas, Quantidade, Valor, Id_Pecas_Ordem)
VALUES
	(1, 'Pneu', 1, 10.00, 1),
    (2, 'Poduto Limpeza', 1, 5.00, 1),
    (3, 'Pano', 1, 2.00, 1),
    (4, 'Martelo', 1, 2.5, 2),
    (5, 'Para-brisa', 1, 15.00, 2),
    (6, 'Produto de limpeza', 1, 7.00, 2),
    (7, 'Óleo', 1, 8.00, 2),
    (8, 'Espelho', 1, 20.00, 3),
    (9, 'Parafuso', 1, 1.00, 3),
    (10, 'Ferramenta de cano', 1, 10.00, 4),
    (11, 'Ferramenta de tanque', 1, 12.00, 4),
    (12, 'Produto de limpeza', 1, 5.00, 4),
    (13, 'Peça de carburador', 1, 6.00, 4),
    (14, 'Peça de ferro', 1, 3.00, 4);
		
    
    
    
    