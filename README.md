# sistema-Delphi-2010


## Conteúdos:

* **[Instalação](##instalação)**
* **[Autor](##autor)**

## Instalação
* Criar as tabelas de *clientes* e *cidades* no SQL Server. A segui a estrutura de ambas, respectivamente: 
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

* Executar o arquivo test.exe;

## Autor
Criado as pressas _(mas com carinho)_ por: Gustavo Bergamo Mimim.
