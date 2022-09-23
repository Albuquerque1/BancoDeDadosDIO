## O Papel dos Bancos de Dados SQL e NoSQL na Engenharia de Dados

O Engenheiro de dados desenvolve meios para coletar, organizar e armazenar dados brutos de uma empresa com o objetivo de definir uma utilidade prática as grandes quantidades de informações que estão disponíveis para a empresa. Podem ocorrer situações em que as empresas disponham de uma grande quantidade de dados, e não saiba como utilizá-los a favor de seus negócios, e é justamente a engenharia de dados que possibilitará que esses dados atendam às necessidades das empresas, e não desperdice informações importantes. Portanto, a engenharia de dados engloba todos os processos de coleta, armazenamentos, organização e fornecimento de dados de uma instituição. Esses dados quando recebido pelas equipes de engenharia, estão em um modo bruto, e os profissionais da área trabalharão na transformação desses dados. Para isso, os profissionais irão contar com a ajuda de softwares e algoritmos, pois a quantidade de dados recebidos pelos profissionais é tão grande que seria humanamente impossível transformá-los sem a ajuda da tecnologia.

O mundo está cada vez mais conectado e muitas vezes produzindo informações e dados a cada instante. Big Data é o termo utilizado para descrever esse imenso volume de dados, que são armazenados, e que passarão por transformações, por meio de análises, relatórios e estatísticas e a partir disso, passarão por modificações, com o objetivo de transformá-los em informações úteis para as instituições que os detém

O principal objetivo do armazenamento e análise desses dados, no que se refere a utilização pelas empresas, diz respeito ao potencial que eles possuem de amparar as decisões tomadas pelas instituições, em fatos concretos e embasar suas escolhas da melhor maneira possível, fornecendo aos profissionais e gestores, os insumos necessários para realizar a redução das margens de erros e permitir uma melhor compreensão sobre o seu negócio e seus clientes.

Alguns dos benefícios trazidos por uma engenharia de dados bem realizada nas empresas que aderiram à utilização da engenharia de dados em seus negócios são:

 - Alta disponibilidade de dados – Com a utilização da engenharia de dados, o acesso, a exploração e a interação desses dados são realizadas de forma simples e rápida, permitindo que eles sejam usados para diversas formas de análises e para os mais variados tipos de insights;
 - Qualidade e confiabilidade dos dados – De nada adianta possuir uma quantidade imensa de dados, se sua empresa não souber analisa-los e utiliza-los da melhor forma. Com os processos de engenharia de dados, os Dados recolhidos serão refinados e confiáveis, seguindo sempre as melhores práticas de segurança e privacidade.

Para desenvolver o seu trabalho, o engenheiro de dados utiliza de diversas linguagens da ciência da programação e além disso, ele precisa ter domínio sobre conceitos como Big Data e Computação na Nuvem. Todo esse conhecimento será fundamental, para que o profissional possa executar suas tarefas de criação de soluções.

O conhecimento em Bancos de Dados é também outra habilidade que o engenheiro de dados deve possuir. Muitos dados estão sendo gerados continuamente e tem-se a necessidade de armazená-los com segurança em algum lugar. Ou seja, atualmente tem-se um cenário onde os bancos de dados são mais relevantes do que nunca. É essencial entender que existem tipos distintos de banco de dados, mesmo que o propósito de cada escolha seja a mesma: armazenar informações e, no momento oportuno, fazer com que os dados sejam recuperados e utilizados.
Entre banco de dados relacional e não relacional, existem várias alternativas para guardar e acessar dados com velocidade e segurança.  Com este cenário, é importante conhecer os tipos de banco de dados, suas características e como escolher a melhor opção — dada a sua realidade.

Um banco de dados relacional é um tipo de banco de dados que armazena e fornece acesso a dados relacionados entre si. Em um banco de dados relacional, cada linha na tabela é um registro com uma ID exclusiva chamada chave. Uma chave é um identificador único que pode ser atribuído a uma linha de uma tabela do banco. 
Dois exemplos de chaves mais usadas são: 

 > Chaves primárias: que são os identificadores únicos da própria tabela; <br> 
 > Chaves estrangeiras: que são referências as chaves primárias de outras tabelas.
 
 Estas chaves criam dependências para manter a integridade dos dados, como:

> Uma chave estrangeira é obrigatória a estar referenciada a uma chave primária caso ela seja obrigatória. <br>
>	Quando um registro é deletado, todos registros de outras tabelas que tenham uma referência a sua chave primária, devem ser deletadas também em caso de cascade. <br>
>	Quando uma chave primária é alterada, todas as tabelas que possuem sua referência também precisam ser alteradas.

A forma de consultar informações de um Banco de Dados Relacional é através de uma linguagem de consulta estruturada, mais conhecida como SQL.

O banco de dados não relacional funciona de forma totalmente diferente dos bancos relacionais. Nesse modelo, o esquema de tabela é inexistente em prol de uma estrutura de pares-chave ou valores simples — como encontrados nos arquivos JSON, por exemplo.

Com isso, as características de uso do banco de dados não relacional são estritamente diferentes em relação ao uso prático. No banco não relacional é possível armazenar informações mais específicas, o que dá mais liberdade e poder na construção de sistemas modernos.

Por exemplo, em redes sociais como o Instagram, onde as fotos estão ligadas diretamente ao perfil do usuário, o banco de dados não relacional é uma boa saída de armazenamento. Nesse caso, o documento foto só precisa ser vinculado ao usuário dono da conta, e não com toda a rede de contatos do usuário.

E o termo NoSQL vem da ausência da linguagem SQL na manipulação dos dados. Para isso, linguagens de programação — como o JavaScript — são utilizadas para o completo gerenciamento das informações — e isso pode ajudar bastante na produtividade do desenvolvedor, que também pode usar a sua linguagem de trabalho para acessar o banco.


Para escolher qual banco utilizar (SQL ou NoSQL) isso vai depender do sistema a ser desenvolvido.
Se a existe a necessidade de mais consistência nas relações, possivelmente a opção mais adequada é um banco de dados relacional. Assim, as entidades estarão prontas para operar com integridade nas informações. Já o NoSQL é recomendado para aplicações onde a consistência não é o fator mais relevante — ainda que importante — e, principalmente, onde o desempenho é um fator crítico. Se muitos dados estão sendo armazenados e recuperados, pode ser extremamente importante contar com a tecnologia não relacional para atender a demanda.

Temos, ainda, o NewSQL, que promete dar a versatilidade das duas tecnologias citadas anteriormente e, assim, resolver o problema de compatibilidade, consistência e desempenho. É a união dos dois mundos para resolver problemas de armazenamento de dados na tecnologia atual.

No entanto, a única certeza que temos é que a arquitetura de um software precisa ser criada com base nas reais necessidades do projeto. Esse formato flexível vai, de forma geral, trazer mais qualidade para o sistema e também satisfazer plenamente os usuários da aplicação.

Seja para bancos de dados, frameworks front-end ou linguagens de programação, é essencial contar com muitas possibilidades para construir sistemas mais maduros e adequados para a sua finalidade.

Portanto, recomendamos que a escolha do banco de dados seja realizada com base nas necessidades do projeto. Assim será muito mais seguro optar pelo SQL ou NoSQL e, de fato, criar sistemas robustos, seguros e com excelente desempenho.


