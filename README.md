# sistema-Delphi-2010

## Conteúdos

* **[Instalação](##instalação)**
* **[Ferramentas](##ferramentas)**
* **[Autor](##autor)**


## Instalação

Para executar o arquivo, basta configurar a string de conexão com o SQL Server no arquivo **conf.ini** e abrir o executavel **test.exe**, os componentes de conexão do Delphi irão buscar essa string e te retornar um erro, caso exista.
As tabelas de *clientes* e *cidades* irão ser criadas automaticamente, junto com a base de dados de nome *NomeEmpresa_TEST*;

* A segui a estrutura de ambas as tabelas, respectivamente:

<table>
<thead>
<th>codigo_cliente</th><th>cgc_cpf_cliente</th><th>Nome</th><th>telefone</th><th>endereco</th><th>bairro</th><th>complemento</th><th>e_mail</th><th>codigo_cidade</th><th>cep</th>
</thead>
  <tbory>
    <tr>
      <td>int</td><td>varchar(14)</td><td>varchar(100)</td><td>varchar(50)</td><td>varchar(10)</td><td>varchar(100)</td><td>varchar(100)</td><td>varchar(100)</td><td>int</td><td>varchar(8)</td>
     </tr>
  </tbory>
</table>

<table>
<thead>
<th>codigo_cidade</th><th>nome</th><th>estado</th><th>cep_inicial</th><th>cep_final</th>
</thead>
  <tbory>
    <tr>
      <td>int</td><td>varchar(100)</td><td>varchar(100)</td><td>varchar(8)</td><td>varchar(8)</td>
     </tr>
</table>

_Detalhe: O executavel **test.exe** necessita estár no mesmo diretório de **report.html** e **conf.ini**_

## Ferramentas

* Delphi 2010
* SQL Server
* Relatório em HTML

## Autor

Criado as pressas _(mas com carinho)_ por: Gustavo Bergamo Mimim.
