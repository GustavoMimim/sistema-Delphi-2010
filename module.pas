unit module;

interface

uses
  Forms, Dialogs, SysUtils, Classes, DB, ADODB, IniFiles;

type
  TDm = class(TDataModule)
    sqlCity: TADOQuery;
    ADOConnection1: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{$R *.dfm}

procedure TDm.DataModuleCreate(Sender: TObject);
var
 conf: TIniFile;
 strConn: String;

begin
  conf := TIniFile.Create(extractfilepath(ParamStr(0)) + 'conf.ini');

  strConn := conf.ReadString('access', 'stringConnection', 'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security Info=False;User ID="";Initial Catalog="";Data Source=localhost;Initial File Name="";Server SPN=""');

  ADOConnection1.Close;
  ADOConnection1.ConnectionString := strConn;

  Try
    ADOConnection1.Open();

  Except on E: Exception do
    begin
      ShowMessage('N�o foi poss�vel se conectar ao banco de dados.' +  #13 + 'Erro: ' + E.Message + #13 + 'Tente alterar a string de conex�o em ./conf.ini.');
      Application.Terminate;
      exit;
    end;
  end;

  Try

    //Cria o banco de dados e as tabelas de clientes e cidade, caso n�o existam

    sqlCity.SQL.Clear;
    sqlCity.SQL.Add('IF NOT EXISTS(SELECT name FROM master.dbo.sysdatabases WHERE name = ' + QuotedStr('NEWCON_TEST') + ')' +
                    'BEGIN                          ' +
                    '  CREATE DATABASE NEWCON_TEST; ' +
                    'END                            ');

    sqlCity.SQL.Add('USE NEWCON_TEST;');

    sqlCity.SQL.Add('IF NOT EXISTS(SELECT name FROM sysobjects WHERE xtype = ' + QuotedStr('U') + ' AND name = ' + QuotedStr('clientes') + ')' +
                    'BEGIN                                            ' +
                    'CREATE TABLE clientes (                          ' +
                    '  codigo_cliente BIGINT NOT NULL, ' +
                    '  cgc_cpf_cliente NVARCHAR(14) NOT NULL,         ' +
                    '  nome NVARCHAR(150) NOT NULL,                   ' +
                    '  telefone NVARCHAR(50) NOT NULL,                ' +
                    '  endereco NVARCHAR(150) NOT NULL,               ' +
                    '  bairro NVARCHAR(150) NOT NULL,                 ' +
                    '  complemento NVARCHAR(150) NOT NULL,            ' +
                    '  e_mail NVARCHAR(100) NOT NULL,                 ' +
                    '  codigo_cidade BIGINT NOT NULL,                 ' +
                    '  cep NVARCHAR(14) NOT NULL                      ' +
                    ');                                               ' +
                    'END                                              ');

      sqlCity.SQL.Add('IF NOT EXISTS(SELECT name FROM sysobjects WHERE xtype = ' + QuotedStr('U') + ' AND name = ' + QuotedStr('cidades') + ')' +
                    'BEGIN                                           ' +
                    'CREATE TABLE cidades (                          ' +
                    '  codigo_cidade BIGINT NOT NULL, ' +
                    '  nome NVARCHAR(100) NOT NULL,                  ' +
                    '  estado NVARCHAR(100) NOT NULL,                ' +
                    '  cep_inicial NVARCHAR(8) NOT NULL,             ' +
                    '  cep_final NVARCHAR(8) NOT NULL                ' +
                    ');                                              ' +
                    'END                                             ');

    sqlCity.ExecSQL;

  Except on E: Exception do
    begin
      ShowMessage('N�o foi poss�vel criar as tabelas Cidades e Clientes automaticamente!' +  #13 + 'Erro: ' + E.Message);
      Application.Terminate;
      exit;
    end;
  end;

end;

end.
