# ______________________________ QUERIES SQL _____________________________
USE ORDEM_SERVICO_OFICINA;
SHOW TABLES;



# _______________________ Recuperações simples com SELECT Statement ___________________________
# 1) Recuperações simples com SELECT Statement
# 1.1) Selcionando todos os clientes  
SELECT * FROM CLIENTE;

# 1.2) Selecionando todos os mecânicos 
SELECT * FROM MECANICOS;

# 1.3) Selecionando todas as equipes de mecânicos
SELECT * FROM EQUIPE_MECANICOS;

# 1.4) Selecionando todas as ordens de serviço
SELECT * FROM ORDEM_SERVICO;

# 1.5) Peças utilizadas
SELECT * FROM PECAS;

# 1.6) Serviços prestados
SELECT * FROM SERVICO;
# ----------------------------------------------------------------------------------------------



#__________________________________ Filtros com WHERE Statement _____________________________
# 2) Filtros com WHERE Statement
# 2.1) Selecione as linhas na tabela ORDEM_SERVICO onde o custo foi menor que R$ 70.00  
SELECT * FROM ORDEM_SERVICO 
WHERE CUSTO < 70;

# 2.2) Quais mecânicos tem cmo especialidade 'Trocar pneu'?
SELECT Nome AS 'Mecânico', Especialidade
FROM MECANICOS
WHERE Especialidade = 'Trocar Pneu';

# 2.3) Qual é a placa do carro da cliente 'Maria Clara'?
SELECT Nome as 'Cliente', Placa_carro
FROM CLIENTE
WHERE Nome = 'Maria Clara'; 

# 2.4) Quais mecânicos atederam a cliente 'Maria Clara'?
# Identificando o ID de 'Maria Cara': 
SELECT Id_Cliente as 'ID de Maria Clara', Nome
FROM CLIENTE
WHERE Nome = 'Maria Clara';
# Utilizando o ID de 'Maria Clara' para identificar os mecânicos
SELECT Nome as 'Mecânicos' 
FROM MECANICOS
WHERE Id_Mecanico_Equipe = 1;  	

# --------------------------------------------------------------------------------------------



#_____________________________ Crie expressões para gerar atributos derivados _________________________
# 3) Crie expressões para gerar atributos derivados
# 3.1) Gere uma tabela com os sobrenomes dos cliente cujos carros possuem placas começando com 'A'.
SELECT Nome AS 'Sobrenome do cliente',  Placa_Carro
FROM CLIENTE
WHERE Placa_Carro LIKE 'A%'; 	

# 3.2) Qual o valor a ser pago pelos cliente se um desconte de 25% fosse concedido a todos?
SELECT  DISTINCT 
	Nome AS 'Cliente', 
    Custo AS 'Custo sem desconto', 
    Custo*(1-0.25) AS 'Custo com desconto'
FROM CLIENTE 
INNER JOIN ORDEM_SERVICO ON Id_cliente = Numero_emissao;
# -----------------------------------------------------------------------------------------------------



#______________________________	Defina ordenações dos dados com ORDER BY _____________________________________
# 4) Defina ordenações dos dados com ORDER BY
# 4.1) Ordene os mecânicos em ordem alfabética
SELECT NOME FROM MECANICOS ORDER BY NOME;

# 4.2) Ordene os clientes de forma que o custo de cada cliente esteja ordenado do maior para menor.
SELECT NOME, CUSTO 
FROM CLIENTE
INNER JOIN ORDEM_SERVICO
ON Id_Cliente = Numero_Emissao
ORDER BY CUSTO DESC; 
#--------------------------------------------------------------------------------------------------------------



#____________________________ Condições de filtros aos grupos – HAVING Statement _____________________________
# 5) Condições de filtros aos grupos – HAVING Statement
# 5.1) Agrupe a qunatidade de mecânicos por equipe a partir da tabela 'MECANICOS'
SELECT 
	COUNT(*) AS 'Qtd mecânicos  por equipe', 
    Id_Mecanico_Equipe AS 'Número da equipe' 
FROM MECANICOS
GROUP BY Id_Mecanico_Equipe
HAVING Id_Mecanico_Equipe;
#-------------------------------------------------------------------------------------------------------------



#______________ Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados ___________
# 6) Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
# 6.1) Quais clientes tiveram a data de conclusão do serviço do carro no ano de 2022?
SELECT  
	C.NOME as 'Cliente', 
	Status_Ordem, 
    Custo as 'Custo (R$)', 
    Data_Conclusao
FROM CLIENTE AS C
RIGHT JOIN ORDEM_SERVICO
ON (Data_Conclusao LIKE '2022%') and (Status_Ordem = 'Serviço Concluído')
WHERE Id_Cliente = Numero_Emissao;
#-------------------------------------------------------------------------------------------------------------
 





