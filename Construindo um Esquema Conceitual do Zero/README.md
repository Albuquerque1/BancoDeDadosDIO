## Construindo um Esquema Conceitual do Zero

### Descri��o do Desafio

O desafio consiste em criar um esquema conceitual do zero, isto �, a partir da narrativa fornecida, 
,criar todas as entidades, relacionamentos e atributos.

 - Cliente PJ e PF � Uma conta pode ser PJ ou PF, mas n�o pode ter as duas informa��es;
 - Pagamento � Pode ter cadastrado mais de uma forma de pagamento;
 - Entrega � Possui status e c�digo de rastreio;

### Narrativa:
>Sistema de controle e gerenciamento de execu��o de ordens de servi�o em uma oficina mec�nica.
Clientes levam ve�culos � oficina mec�nica para serem consertados ou para passarem por revis�es  peri�dicas.
Cada ve�culo � designado a uma equipe de mec�nicos que identifica os servi�os a serem executados e preenche 
uma OS com data de entrega.
A partir da OS, calcula-se o valor de cada servi�o, consultando-se uma tabela de refer�ncia de m�o-de-obra.
O valor de cada pe�a tamb�m ir� compor a OS. 
O cliente autoriza a execu��o dos servi�os.
A mesma equipe avalia e executa os servi�os.
Os mec�nicos possuem c�digo, nome, endere�o e especialidade.
Cada OS possui: n�, data de emiss�o, um valor, status e uma data para conclus�o dos trabalhos.