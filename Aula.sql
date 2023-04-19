Aula 7 - Nosso Sistema

drop table cliente cascade constraints;
drop table vendedor cascade constraints;
drop table pedido cascade constraints;
drop table item_pedido cascade constraints;
drop table produto cascade constraints;

create table cliente 
(cod_clie number(4) constraint clie_cd_pk primary key, 
nome_clie varchar2(20) constraint clie_no_nn not null, 
endereco varchar2(30),cidade varchar2(15), 
cep char(8),uf char(2),cnpj char(16),ie char(12));

create table vendedor 
(cod_ven number(4) constraint ven_cod_pk primary key, 
nome_ven varchar2(20) constraint ven_no_nn not null, 
salario_fixo number(12,2),comissao char(1));

create table produto 
(cod_prod number(4) constraint pro_cod_pk primary key, 
unidade varchar2(3),descricao varchar2(20),val_unit number(10,2));

create table pedido 
(num_pedido number(4) constraint pedido_num_pk primary key, 
pr_entrega number(3) constraint entrega_pr_nn not null, 
cod_clie references cliente,cod_ven references vendedor);

create table item_pedido 
(num_pedido references pedido, 
cod_prod references produto, 
quant number(10,2));

insert into cliente values(720,'Ana','Rua 17 n.19','Niteroi','24358310','RJ','12113231/0001-34','2134');

insert into cliente values(870,'Flavio','Av. Pres. Vargas, 10','Sao Paulo','22763931','SP','22534126/9387-9','4631');

insert into cliente values(110,'Jorge','Rua Caiapo, 13','Curitiba','30078500','PR','14512764/9834-9',null);

insert into cliente values(222,'Lucia','Rua Itabira, 123','Belo Horizonte','22124391','MG','283152123/9348-8','2985');

insert into cliente values(830,'Mauricio','Av. Paulista, 1236','Sao Paulo','3012683','SP','32816985/7465-6','9343');

insert into cliente values(130,'Edmar','Rua da Praia, s/n','Salvador','30079300','BA','23463284/234-9','7121');

insert into cliente values(410,'Rodolfo','Largo da Lapa, 27','Rio de Janeiro','30078900','RJ','12835128/2346-9','743');

insert into cliente values(20,'Beth','Av. Climerio, 45','Sao Paulo','25679300','SP','32485126/7326-8','9280');

insert into cliente values(157,'Paulo','Trav. Moraes, casa 3','Londrina',null,'PR','32848223/324-2','1923');

insert into cliente values(180,'Livio','Av. Beira Mar, 1256','Florianopolis','30077500','SC','12736571/2347-4','1111');

insert into cliente values(260,'Susana','Rua Lopes Mandes, 12','Niteroi','30046500','RJ','21763571/232-9','2530');

insert into cliente values(290,'Renato','Rua Meireles, 123','Sao Paulo','30225900','SP','13276571/1231-4','1820');

insert into cliente values(390,'Sebastiao','Rua da Igreja, 10','Uberaba','30438700','MG','32176547/213-3','9071');

insert into cliente values(234,'Jose','Quadra 3, Bl. 3, sl. 1003','Brasilia','22841650','DF','21763576/1232-3','2931');

commit;

insert into vendedor values(209,'Jose','1800','C');

insert into vendedor values(111,'Carlos','2490','A');

insert into vendedor values(11,'Joao','2780','C');

insert into vendedor values(240,'Antonio','9500','C');

insert into vendedor values(720,'Felipe','4600','A');

insert into vendedor values(213,'Jonas','2300','A');

insert into vendedor values(101,'Joao','2650','C');

insert into vendedor values(310,'Josias','870','B');

insert into vendedor values(250,'Mauricio','2930','B');

commit;

commit;

insert into produto values ('25','KG','Queijo','0.97');

insert into produto values ('31','BAR','Chocolate','0.87');

insert into produto values ('78','L','Vinho','2.00');

insert into produto values ('22','M','Linho','0.11');

insert into produto values ('30','SAC','Acucar','0.30');

insert into produto values ('53','M','Linha','1.80');

insert into produto values ('13','G','Ouro','6.18');

insert into produto values ('45','M','Madeira','0.25');

insert into produto values ('87','M','Cano','1.97');

insert into produto values ('77','M','Papel','1.05');

commit;

insert into pedido values ('121','20','410','209');

insert into pedido values ('97','20','720','101');

insert into pedido values ('101','15','720','101');

insert into pedido values ('137','20','720','720');

insert into pedido values ('148','20','720','101');

insert into pedido values ('189','15','870','213');

insert into pedido values ('104','30','110','101');

insert into pedido values ('203','30','830','250');

insert into pedido values ('98','20','410','209');

insert into pedido values ('143','30','20','11');

insert into pedido values ('105','30','180','240');

insert into pedido values ('111','15','260','240');

insert into pedido values ('103','20','260','11');

insert into pedido values ('91','20','260','11');

insert into pedido values ('138','20','260','11');

insert into pedido values ('108','15','290','310');

insert into pedido values ('119','30','390','250');

commit;

insert into item_pedido values ('121','25','10');

insert into item_pedido values ('121','31','35');

insert into item_pedido values ('97','77','20');

insert into item_pedido values ('101','31','9');

insert into item_pedido values ('101','78','18');

insert into item_pedido values ('101','13','5');

insert into item_pedido values ('98','77','5');

insert into item_pedido values ('148','45','8');

insert into item_pedido values ('148','31','7');

insert into item_pedido values ('148','77','3');

insert into item_pedido values ('148','25','10');

insert into item_pedido values ('148','78','30');

insert into item_pedido values ('104','53','32');

insert into item_pedido values ('203','31','6');

insert into item_pedido values ('189','78','45');

insert into item_pedido values ('143','31','20');

insert into item_pedido values ('143','78','10');

commit;

Aula 8 - 21/04/2023

Construindo relatórios, comandos - DQL
Data Query Language

Exibindo o conteúdo de uma tabela, todas as linhas e colunas

Sintaxe básica: select * from nome_tabela;
Select = seleção
* = todas as colunas
from = origem dos dados
nome_tabela = tabela destino do relatório

Exemplos:

1) exibir o conteúdo da tabela cliente
select * from cliente;

1.1) mostre o conteúdo da tabela vendedor.
select * from vendedor;

.2) mostre o conteúdo da tabela que possui os produtos e seus pedidos.
select * from item_pedido;

) criando um relatório com colunas específicas
Sintaxe: Select nome_col1, nome_col2 from nome_tabela
nome_col = nome da coluna a ser exibida
Mostrar o nome do cliente e o estado onde ele mora
select nome_clie, uf from cliente;

.) exiba o nome do vendedor e seu salário
select nome_ven, salario_fixo from vendedor;

.2) mostre o nome do produto e seu preço
select descricao, val_unit from produto;

) classificando relatórios
Sitaxe: select * from tabela order by nome_col asc (default)- crescente
Sitaxe: select * from tabela order by nome_col desc - decrescente
select nome_clie, uf from cliente order by nome_clie asc (opcional)
select nome_clie, uf from cliente order by  asc (opcional)
select nome_clie, uf from cliente order by 1 desc
select uf, nome_clie from cliente order by 1,2
select uf, nome_clie from cliente order by 1,2 desc

.1) criar um relatório que mostre os pedidos organizados por número (crescente),
     cliente e vendedor decrescente
select * from pedido order by 1, 3 desc, 4 desc

.2) mostrar em ordem decrescente de salário os dados dos vendedores
select * from vendedor order by 3 desc

) apelidando colunas
Sintaxe: select nome_col Apelido, nome_col "apelido da coluna" from tabela
select nome_clie Cliente, endereco "Local da morada" from cliente

) usando filtro de linhas
Sintaxe: select * from tabela where nome_col operador valor
Operadores: aritméticos: + - * / ()
            relacionais : > >= < <= = <> ou !=
            lógicos: and or not
            BD: between, in, like
5.1) crie um relatório que mostre qual será o salário do vendedor com um aumento
     de 10%
select salario_fixo "sal atual", salario_fixo * 1.1 "Sal Reaj 10%" from vendedor;

5.2) crie um relatório que exiba os clientes com nome e uf que morem no estado
     de SP
5.3) quais produtos custam abaixo de R$1,50? mostre em ordem crescente de valor
     o preço e a descrição
5.4) Quais pedidos foram feitos pelos cliente de código maior que 500? Mostre o
     código do cliente e o número do pedido classifcado pelo código do cliente
     de forma crescente


Aula - 9 19/04 - gabarito exercicios

5.2) select nome_clie, uf from celinte where uf = 'SP';
5.3) select descrição, val unit from prdouto where val_unit <1.5
     order by 2
     
5.4) select num_pedido, cod_clie from pedido where cod_cliente > 500 order by 2

5.5)crie um relatorio que exiba o codigo do cliente e seu nome, desde que
estejam no intervalo de código com início em 180 até 720(inclusive)

select cod_clie, nome_clie from cleinte
where cod_cliente>= 180 and cod_cliente <-720 order by 1

5.7) crie um relatório que exiba o nome do cliente, desde que
estejam no intervalo de código com ínício em 180 até 720
select no intervalo de B até F (inclusive)

select nome_clie, nome_clie from cliente
where upper(nome_clien) >= 'B' and upper(nome_clie) <= 'g'
order by 1;


select cod_clie, nome_clie from cliente
where cod_cliente> 180 and cod_cliente <720 order by 1

5.8)quem são os vendedores com salário superior a R$2.000,000 que pertençam a
comissão A ou C e que seu código esteja no intervalo de 500 até 800
select * from vendedor where salario_fixo > 2000;

select * from vendedor where sala_fixo >2000 and
comissao !+  'B';

select * from vendedor where salario_fixo > 2000 and
comissao != 'B'
and cod_ven >500 and cod_ven < 800; 


operadores de BD:
    between -> coluna1 between valor inicial and valor final
    exemplo:
ver tardicioal: select cpd_clie, nome_clie from cliente
                where cod_clie >= 180 and cod_clie <=720 order by 1
ver op bd: select cod_clie, nome_clie form cliente
                where cod_clie between 180 and 720 oder by 1
usando operador not: coluna1 not between valor inicial and valor final
        select cod_clie, nome_clie form clie
        where cod_clie not between 180 and 720 order by
        
in(List) igual  a uma lista) -> coluna in(valor1,...., valorN)
exemplo operador tradiconal:
                select nome-clie, uf from cliente
                where uf= in('SP','RJ','MG')  order by uf;
usando operador not: not in(list)
        select nome_clie, uf from cliente
            where uf not in('SP','RJ','MG') order by uf;
            
like - igual  a posição ou igual as posições - > coluna like 'opção'
% = qualquer quantidade, qualquer posicção
_ = posição e quantidade especifica


Nome que tenham a letra 'a'
select nome_clie from cliente where upper(nome_clie) like '%A%'

Nomes com a letra'o'
Nomes com que não iniciam com 'M' e 'R'
Nomes que a penúltima letra e a letra 'i'
Nomes com as letras 'a' ou 's'
Nomes com as letras 'a' e 's'