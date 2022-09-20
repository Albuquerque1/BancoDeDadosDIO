# ======================================== queries SQL ===============================
USE E_COMMERCE;

# 1) Recuperações simples com SELECT Statement
# 1.1) Quais são os tipos de clientes? 
SELECT * FROM CLIENTE;

# 1.2) Quais são os clientes do tipo pessoa física?
SELECT * FROM PESSOA_FISICA;

# 1.3) Quais são os clientes do tipo pessoa jurídica?
SELECT * FROM PESSOA_JURIDICA;

# 1.4) Quais pedidos foram feitos?
SELECT * FROM PEDIDO;

# 1.5) Quais são as entregas? 
SELECT * FROM ENTREGA;

# 1.6) Quais são os fornecedores?
SELECT * FROM FORNECEDOR;

# 1.7) Informações sobre o estoque
SELECT * FROM ESTOQUE;

# 2) Filtros com WHERE Statement
# 2.1) Consultando os clintes que são pessoa física
SELECT  
	DISTINCT Tipo_de_Cliente,
    concat(Pnome, ' ', InicialNomeMeio, ' ', Unome) AS 'Nome Completo',
    CPF,
    Endereço
FROM
	CLIENTE, 
    PESSOA_FISICA
WHERE
	Tipo_de_Cliente = 'Pessoa Física';
    
# 2.2) Consultando os clintes que são pessoa jurídica
SELECT  
	DISTINCT Tipo_de_Cliente,
    Razao_social,
    CNPJ
FROM
	CLIENTE, 
    PESSOA_JURIDICA
WHERE
	Tipo_de_Cliente = 'Pessoa Jurídica';    
		
# 2.3) Quais os pedidos realizados por cliente do tipo pessoa física?
SELECT 
	DISTINCT Tipo_de_Cliente,
    concat(Pnome, ' ', InicialNomeMeio, ' ', Unome) AS 'Nome Completo',
    CPF,
    Endereço,
    Status_Pedido,
    Descrição_Pedido,
    Frete,
    Tipo_Pagamento
FROM
	CLIENTE, 
    PESSOA_FISICA,
    PEDIDO
WHERE
	((Tipo_de_Cliente = 'Pessoa Física') AND (Id_PF_Id_Cliente = Id_Pedido));

# 2.4) Quais os pedidos realizados por cliente do tipo pessoa jurídica?
SELECT 
	DISTINCT Tipo_de_Cliente,
    Razao_Social,
    CNPJ,
    Status_Pedido,
    Descrição_Pedido,
    Frete,
    Tipo_Pagamento
FROM
	CLIENTE, 
    PESSOA_JURIDICA,
    PEDIDO
WHERE
	((Tipo_de_Cliente = 'Pessoa Jurídica') AND (Id_PJ_Id_Cliente = Id_Pedido));    

select * from produto;

# 3) Crie expressões para gerar atributos derivados
#    Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
#    Defina ordenações dos dados com ORDER BY

# 3.1) Qual o valor do produto pago por cada cliente do tipo 'Pessoa Física' se todos eles 
#      tivessem direito a 10% de desconte no total do valor do produto?
SELECT
	concat(Pnome, ' ', InicialNomeMeio, ' ',Unome) AS 'Nome do Cliente',
    CPF,
	Descrição as 'Descrição do produto',
    Valor as 'Preço (R$)',
    case 
		when valor then round(valor*0.9, 2) 
	end as 'Preço (R$) com 10% de desconto'
FROM
    PESSOA_FISICA
LEFT JOIN
	PEDIDO
ON 
	(Id_PF_Id_Cliente = Id_Pedido)
LEFT JOIN
	PRODUTO
ON 
	Id_produto = Id_pedido
ORDER BY 
	VALOR ASC;

select * from pessoa_juridica;
# 3.2) Qual o valor do produto pago por cada cliente do tipo 'Pessoa Jurídica' se todos eles 
#      tivessem direito a 10% de desconte no total do valor do produto?
SELECT
	Razao_Social,
    CNPJ,
	Descrição as 'Descrição do produto',
    Valor as 'Preço (R$)',
    case 
		when valor then round(valor*0.9, 2) 
	end as 'Preço (R$) com 10% de desconto'
FROM
    PESSOA_JURIDICA
LEFT JOIN
	PEDIDO
ON 
	(Id_PJ_Id_Cliente = Id_Pedido)
LEFT JOIN
	PRODUTO
ON 
	Id_produto = Id_pedido;

# 3.3) Recuperar em uma só tabela as informações:
#			* Tipo e Cliente;
#			* Nome do cliente se for pessoa física ou nome da razão social se for pessoa jurídica 
#			* Descrição do pedido
#			* Preço do pedido
#      Em seguida ordenar do mais caro para o mais barato
 SELECT 
	Tipo_de_cliente,
    concat(Pnome, ' ', Unome) AS 'Cliente',
    Razao_Social,
    Descrição_Pedido,
    Valor
FROM
	CLIENTE
LEFT JOIN 
	PESSOA_FISICA
ON
	Id_PF_Id_Cliente = Id_Cliente
LEFT JOIN
	PESSOA_JURIDICA
ON 
	Id_PJ_Id_Cliente = Id_Cliente
LEFT jOIN
	PEDIDO
ON 
	Id_Cliente = Id_Pedido
LEFT JOIN
	PRODUTO
ON
	Id_Pedido = Id_Produto
ORDER BY
	Valor DESC;
		
# 3.4) Qual o fornecedor do produto 'Pulseira inteligente Mi Band 7'?   
SELECT 
	CASE
		WHEN Descrição = 'Pulseira inteligente Mi Band 7' THEN Descrição
	END AS 'Produto',
    F.Razao_Social AS 'Fornecedor'
FROM
	PRODUTO AS P
INNER JOIN
	FORNECEDOR AS F
ON
	(P.Id_produto = F.Id_Fornecedor) AND (P.Descrição = 'Pulseira inteligente Mi Band 7');
   
    
 # 3.4) O produto 'Laptop dell core i7' já foi entregue?
 SELECT
	Status_Entrega,
    P.Descrição
FROM 
	ENTREGA
INNER JOIN
	PEDIDO
ON 
	Id_Pedido = Id_Entrega
INNER JOIN
	PRODUTO AS P
ON
	(Id_Pedido = P.Id_Produto) and (P.Descrição = 'Laptop dell core i7');
 

    
    
    
    
    
    
    
    