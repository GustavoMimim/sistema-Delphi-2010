unit frmCustomer;

interface

uses
  module, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    txtCode: TEdit;
    txtName: TEdit;
    Panel2: TPanel;
    btnSave: TButton;
    btnRemove: TButton;
    txtCpf: TEdit;
    Label5: TLabel;
    txtTel: TEdit;
    Label6: TLabel;
    txtEmail: TEdit;
    Label7: TLabel;
    Panel3: TPanel;
    txtCity: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    txtAddress: TEdit;
    txtComplement: TEdit;
    Label10: TLabel;
    txtPostCode: TEdit;
    Label3: TLabel;
    cbState: TComboBox;
    Label4: TLabel;
    txtDistrict: TEdit;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    function validates(): boolean;
    procedure txtPostCodeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    newRecord: Boolean;
    procedure loadCustomer(codigo: String);
  end;

var
  Form3: TForm3;
  dt: TDm;

implementation

{$R *.dfm}


function TForm3.validates(): boolean;
begin

  validates := false;

  if Length(txtCode.Text) = 0 then
  begin
    ShowMessage('Por favor, preencha o c�digo do cliente para continuar!');
    txtCode.SetFocus;
    exit;
  end
  else
    if newRecord then
    begin
      dt.sqlCity.SQL.Clear;
      dt.sqlCity.SQL.Add('SELECT COUNT(*) AS qtd FROM clientes WHERE codigo_cliente = ' + QuotedStr(txtCode.Text));
      dt.sqlCity.Open;
      if dt.sqlCity.FieldByName('qtd').Value > 0  then
      begin
        ShowMessage('O c�digo do cliente deve ser �nico!');
        txtCode.SetFocus;
        exit;
      end;
    end;

  if Length(txtName.Text) = 0 then
  begin
    ShowMessage('Por favor, preencha o nome do cliente para continuar!');
    txtName.SetFocus;
    exit;
  end;

  if Length(txtCity.Text) = 0 then
  begin
    ShowMessage('Por favor, certifique-se de que o cep est� preenchido corretamente e que exista uma cidade com esse cep cadastrado no sistema!');
    txtPostCode.SetFocus;
    exit;
  end;

  validates := true;

end;

procedure TForm3.btnSaveClick(Sender: TObject);
var
  codCity: string;

begin

  if not validates() then
    exit;

  try

    dt.sqlCity.Close;
    dt.sqlCity.SQL.Clear;
    dt.sqlCity.SQL.Add('SELECT codigo_cidade FROM clientes WHERE nome = ' + QuotedStr(txtCity.Text));
    dt.sqlCity.Open;

    codCity := dt.sqlCity.FieldByName('codigo_cidade').Value;

    dt.sqlCity.Close;
    dt.sqlCity.SQL.Clear;

    if newRecord then

      dt.sqlCity.SQL.Add('INSERT INTO clientes (codigo_cliente, nome, CGC_CPF_Cliente, Telefone, Endereco, Bairro, Compelmento, E_mail, codigo_cidade, cep) VALUES ('+
      QuotedStr(txtCode.Text) + ', ' + QuotedStr(txtName.Text) + ', ' + QuotedStr(txtCpf.Text) + ', ' + QuotedStr(txtTel.Text) + ',' + QuotedStr(txtAddress.Text) + ',' +
      QuotedStr(txtDistrict.Text) + ', ' + QuotedStr(txtComplement.Text) + ', ' + QuotedStr(txtEmail.Text) + ', ' + QuotedStr(codCity) + ', ' + QuotedStr(txtPostCode.Text) + ')' )

    else
      dt.sqlCity.SQL.Add('UPDATE clientes SET nome = ' + QuotedStr(txtName.Text) + ', estado = ' + QuotedStr(cbState.Text) +
      ', cep_inicial = ' + QuotedStr(txtPostCodeStart.Text) + ', cep_final = ' + QuotedStr(txtPostCodeEnd.Text) +
      ' WHERE codigo_cidade = ' + QuotedStr(txtCode.Text));

    dt.sqlCity.ExecSQL();

  finally

    ShowMessage('Cidade cadastrado com sucesso!');
    Form3.Free;

  end;
end;

procedure TForm3.loadCustomer(codigo: String);
begin

  dt.sqlCity.Close;
  dt.sqlCity.SQL.Clear;
  dt.sqlCity.SQL.Add('SELECT clientes.*, cidades.nome AS cidade FROM clientes LEFT JOIN cidades ON cidades.codigo_cidade = cliente.codigo_cidade WHERE codigo_cliente = ' + QuotedStr(codigo));
  dt.sqlCity.Open;

  if dt.sqlCity.Eof then
  begin
    ShowMessage('N�o foi poss�vel encontrar o cliente selecionado, por favor, tente novamente!');
    Form3.Release;
    exit;
  end
  else
  begin
    txtCode.Text := dt.sqlCity.FieldByName('codigo_cidade').Value;
    txtName.Text := dt.sqlCity.FieldByName('nome').Value;
    txtCpf.Text := dt.sqlCity.FieldByName('CGC_CPF_Cliente').Value;
    txtTel.Text := dt.sqlCity.FieldByName('telefone').Value;
    txtEmail.Text := dt.sqlCity.FieldByName('email').Value;

    txtPostCode.Text := dt.sqlCity.FieldByName('cep').Value;
    txtCity.Text := dt.sqlCity.FieldByName('cidade').Value;
    cbState.ItemIndex := cbState.Items.IndexOf(dt.sqlCity.FieldByName('estado').Value);
    txtAddress.Text := dt.sqlCity.FieldByName('endereco').Value;
    txtComplement.Text := dt.sqlCity.FieldByName('complemento').Value;

  end;

end;

procedure TForm3.FormCreate(Sender: TObject);
begin

  dt := TDm.Create(Self);

end;

procedure TForm3.FormShow(Sender: TObject);
begin

  txtCode.SetFocus;

end;

procedure TForm3.txtPostCodeChange(Sender: TObject);
begin

  if Length(txtPostCode.Text) = 8 then
  begin

    try

      dt.sqlCity.Close;
      dt.sqlCity.SQL.Clear;
      dt.sqlCity.SQL.Add('SELECT cidade, estado FROM cidades WHERE ' + txtPostCode.Text + ' BETWEEN cep_inicial AND cep_final');
      dt.sqlCity.Open;

    finally

      if not dt.sqlCity.Eof then
      begin
        txtCity.Text := dt.sqlCity.FieldByName('cidade').Value;
        cbState.ItemIndex := cbState.Items.IndexOf(dt.sqlCity.FieldByName('estado').Value);
      end;

    end;

  end;

end;

end.
