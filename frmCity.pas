unit frmCity;

interface

uses
  module, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    txtPostCodeEnd: TEdit;
    txtPostCodeStart: TEdit;
    txtCode: TEdit;
    cbState: TComboBox;
    txtName: TEdit;
    panelFooter: TPanel;
    btnRemove: TButton;
    btnSave: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function validates(): boolean;
    procedure btnRemoveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    newRecord: Boolean;
    procedure loadCity(codigo: String);
  end;

var
  cityForm: TForm2;
  dt: TDm;

implementation

{$R *.dfm}

procedure TForm2.loadCity(codigo: String);
begin

  dt.sqlCity.Close;
  dt.sqlCity.SQL.Clear;

  if newRecord then
  begin

    dt.sqlCity.SQL.Add('SELECT ISNULL(MAX(codigo_cidade) + 1, 1) AS newCode FROM cidades');

    dt.sqlCity.Open;

    txtCode.Text := dt.sqlCity.FieldByName('newCode').Value;

    exit;
  end;


  dt.sqlCity.SQL.Add('SELECT * FROM cidades WHERE codigo_cidade = ' + QuotedStr(codigo));

  dt.sqlCity.Open;

  if dt.sqlCity.Eof then
  begin
    ShowMessage('Não foi possível encontrar a cidade selecionada, por favor, tente novamente!');
    Self.Release;

    Exit;
  end
  else
  begin
    txtCode.Text := dt.sqlCity.FieldByName('codigo_cidade').Value;
    txtName.Text := dt.sqlCity.FieldByName('nome').Value;
    cbState.ItemIndex := cbState.Items.IndexOf(dt.sqlCity.FieldByName('estado').Value);
    txtPostCodeStart.Text := dt.sqlCity.FieldByName('cep_inicial').Value;
    txtPostCodeEnd.Text := dt.sqlCity.FieldByName('cep_final').Value;
  end;

end;

procedure TForm2.btnRemoveClick(Sender: TObject);
begin

  if MessageDlg('Deseja mesmo remover essa cidade?', mtConfirmation,[mbYes, mbNo], 0) = mrNo then
    exit;

  try

  dt.sqlCity.Close;
  dt.sqlCity.SQL.Clear;
  dt.sqlCity.SQL.Add('DELETE FROM cidades WHERE codigo_cidade = ' + txtCode.Text );
  dt.sqlCity.ExecSQL();

  finally

    ShowMessage('Cidade removida com sucesso!');

  end;

end;

procedure TForm2.btnSaveClick(Sender: TObject);
begin

  if not validates() then
    exit;

  try

    dt.sqlCity.Close;
    dt.sqlCity.SQL.Clear;

    if newRecord then

      dt.sqlCity.SQL.Add('INSERT INTO cidades (codigo_cidade, nome, estado, cep_inicial, cep_final) VALUES ('+
      QuotedStr(txtCode.Text)+ ', ' + QuotedStr(txtName.Text) + ', ' + QuotedStr(cbState.Text) + ', ' + QuotedStr(txtPostCodeStart.Text) + ',' + QuotedStr(txtPostCodeEnd.Text) + ')' )

    else
      dt.sqlCity.SQL.Add('UPDATE cidades SET nome = ' + QuotedStr(txtName.Text) + ', estado = ' + QuotedStr(cbState.Text) +
      ', cep_inicial = ' + QuotedStr(txtPostCodeStart.Text) + ', cep_final = ' + QuotedStr(txtPostCodeEnd.Text) +
      ' WHERE codigo_cidade = ' + QuotedStr(txtCode.Text));

    dt.sqlCity.ExecSQL();

  finally

    if newRecord then
      ShowMessage('Cidade cadastrada com sucesso!')
    else
      ShowMessage('Cidade alterada com sucesso!');

    Self.Release;

  end;
end;

function TForm2.validates(): boolean;
begin

  validates := false;

  if Length(txtCode.Text) = 0 then
  begin
    ShowMessage('Por favor, preencha o código da cidade para continuar!');
    txtCode.SetFocus;
    exit;
  end
  else
    if newRecord then
    begin
      dt.sqlCity.SQL.Clear;
      dt.sqlCity.SQL.Add('SELECT COUNT(*) AS qtd FROM cidades WHERE codigo_cidade = ' + QuotedStr(txtCode.Text));
      dt.sqlCity.Open;
      if dt.sqlCity.FieldByName('qtd').Value > 0  then
      begin
        ShowMessage('O código da cidade deve ser único!');
        txtCode.SetFocus;
        exit;
      end;
    end;

  if Length(txtName.Text) = 0 then
  begin
    ShowMessage('Por favor, preencha o nome da cidade para continuar!');
    txtName.SetFocus;
    exit;
  end;

  if cbState.ItemIndex = -1 then
  begin
    ShowMessage('Por favor, selecione o estado da cidade para continuar!');
    cbState.SetFocus;
    exit;
  end;

  if (Length(txtPostCodeStart.Text) = 0) OR (Length(txtPostCodeEnd.Text) = 0) then
  begin
    ShowMessage('Por favor, preencha corretamente a feixa de cep para continuar!');
    txtPostCodeStart.SetFocus;
    exit;
  end;

  validates := true;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin

  dt := TDm.Create(Self);

end;

procedure TForm2.FormShow(Sender: TObject);
begin

  txtName.SetFocus;

end;

end.
