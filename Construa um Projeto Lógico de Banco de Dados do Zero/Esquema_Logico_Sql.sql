# ----------------------- CRIANDO SCHEMA -----------------------
CREATE SCHEMA ORDEM_SERVICO_OFICINA;
USE ORDEM_SERVICO_OFICINA;
DROP SCHEMA ORDEM_SERVICO_OFICINA;
SHOW TABLES;
# ================================================================


# -------------------------- CRIANDO AS TABELAS --------------------------------

CREATE TABLE CLIENTE(
	Id_Cliente INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Placa_Carro CHAR(7) NOT NULL,
    
    /*--- Constraint Cahve Primária ---*/
    PRIMARY KEY (Id_Cliente)
);

CREATE TABLE EQUIPE_MECANICOS(
	Id_Equipe INT NOT NULL AUTO_INCREMENT,
    Numero_de_Integrantes INT,
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY (Id_Equipe)
);





CREATE TABLE MECANICOS(
	Id_Mecanicos INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(100),
    Endereco VARCHAR(100),
    Especialidade VARCHAR(100),
    
    /*--- Constraint Chave estrangeira ---*/
    Id_Mecanico_Equipe INT,
    FOREIGN KEY (Id_Mecanico_Equipe) REFERENCES EQUIPE_MECANICOS (Id_Equipe),
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY (Id_Mecanicos)
);


CREATE TABLE ORDEM_SERVICO(
	Numero_Emissao INT NOT NULL AUTO_INCREMENT,
    Data_Emissao DATE,
    Data_Conclusao DATE,
    Status_Ordem ENUM('Processando', 'Serviço em execução', 'Serviço Concluído') DEFAULT 'Processando',
    Custo FLOAT,
    
    /*--- Constraint Chave estrangeira ---*/
    Id_Ordem_Cliente INT,
    FOREIGN KEY (Id_Ordem_Cliente) REFERENCES CLIENTE (Id_Cliente),
    Id_Ordem_Equipe INT,
    FOREIGN KEY (Id_Ordem_Equipe) REFERENCES EQUIPE_MECANICOS (Id_Equipe),
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY (Numero_Emissao)
);


CREATE TABLE SERVICO(
	Id_Servico INT NOT NULL,
    Descriacao_servico VARCHAR(100),
    Valor_Servico FLOAT,
    
    /*--- Constraint Chave Estrangeira ---*/
    Id_Servico_Ordem INT,
    FOREIGN KEY (Id_Servico_Ordem) REFERENCES ORDEM_SERVICO (Numero_Emissao),
    
    /*--- Constraint Chave primária ---*/
    PRIMARY KEY (Id_Servico_Ordem, Id_Servico)
);

CREATE TABLE PECAS(
	Id_Pecas INT NOT NULL,
    Descricao_Pecas VARCHAR(100),
    Quantidade INT,
    Valor FLOAT,
    
    /*--- Constraint Chave Estrangeira ---*/
    Id_Pecas_Ordem INT,
    FOREIGN KEY (Id_Pecas_Ordem) REFERENCES ORDEM_SERVICO (Numero_Emissao),
    
    /*--- Constraint Chave prmária ---*/
    PRIMARY KEY (Id_Pecas_Ordem, Id_Pecas)
);

# ===============================================================================












