unit module;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDm = class(TDataModule)
    sqlCity: TADOQuery;
    ADOConnection1: TADOConnection;
    sqlCitycodigo_cidade: TStringField;
    sqlCitynome: TStringField;
    sqlCityestado: TStringField;
    sqlCitycep_inicial: TStringField;
    sqlCitycep_final: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{$R *.dfm}

end.
