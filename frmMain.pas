unit frmMain;

interface

uses
  module, frmCity, frmCustomer, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, pngimage, DB, ADODB, StrUtils;

type
  TForm1 = class(TForm)
    sideMenu: TTreeView;
    mainBody: TPanel;
    header: TPanel;
    panelSeach: TPanel;
    lblSearch: TLabel;
    txtSearch: TEdit;
    lvRecords: TListView;
    panelButtons: TPanel;
    btnUpdate: TButton;
    btnAdd: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure sideMenuClick(Sender: TObject);
    procedure ListCities();
    procedure ListCustomers();
    procedure txtSearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure directsTypeList();
  end;

var
  Form1: TForm1;
  Form2: TForm2;
  Form3: TForm3;
  dt: TDm;
  typeSelected: String;

implementation

{$R *.dfm}

procedure TForm1.btnAddClick(Sender: TObject);
begin
  if typeSelected = 'Cidades' then
  begin
    Form2 := TForm2.Create(nil);
    Form2.newRecord := true;
    Form2.btnRemove.Visible := false;
    Form2.Show;
  end
  else
  begin
    Form3 := TForm3.Create(nil);
    Form3.newRecord := true;
    Form3.btnRemove.Visible := false;
    Form3.Show;
  end;


end;

procedure TForm1.btnUpdateClick(Sender: TObject);
begin

  if lvRecords.Items.Count = 0 then
  begin
    ShowMessage('Nenhum registro foi encontrado!');
    exit;
  end;

  Application.CreateForm(TForm2, Form2);
  Form2.loadCity(lvRecords.Selected.Caption);
  Form2.Show;

end;

procedure TForm1.directsTypeList();
begin

  if typeSelected = 'Cidades' then
    ListCities();
  if typeSelected = 'Clientes' then
    ListCustomers();

  if lvRecords.Items.Count > 0 then
    lvRecords.ItemIndex := 0;

end;

procedure TForm1.ListCustomers();
var
  item: TListItem;
  col: TListColumn;

begin

  lvRecords.Clear;
  lvRecords.Columns.Clear;

  Col := lvRecords.Columns.Add;
  Col.Caption := 'C�digo';
  Col.Width := 80;

  Col := lvRecords.Columns.Add;
  Col.Caption := 'Nome';
  Col.Width := 160;

  Col := lvRecords.Columns.Add;
  Col.Caption := 'Telefone';
  Col.Width := 120;

  Col := lvRecords.Columns.Add;
  Col.Caption := 'Cidade';
  Col.Width := 150;

  dt.sqlCity.SQL.Clear;

  dt.sqlCity.SQL.Add('SELECT codigo_cliente, clientes.nome, telefone, cidades.nome AS cidade from clientes LEFT JOIN cidades ON cidades.codigo_cidade = clientes.codigo_cliente');

  dt.sqlCity.Open;

  while not dt.sqlCity.Eof do
  begin

    item := lvRecords.Items.Add;

    item.Caption := dt.sqlCity.FieldByName('codigo_cliente').Value;

    item.SubItems.Add(dt.sqlCity.FieldByName('nome').Value);

    item.SubItems.Add(dt.sqlCity.FieldByName('telefone').Value);

    item.SubItems.Add(dt.sqlCity.FieldByName('cidade').Value);

    dt.sqlCity.Next;

  end;

end;

procedure TForm1.ListCities();
var
  item: TListItem;
  col: TListColumn;
  searchFor: string;

begin

  lvRecords.Clear;
  lvRecords.Columns.Clear;

  Col := lvRecords.Columns.Add;
  Col.Caption := 'C�digo';
  Col.Width := 80;

  Col := lvRecords.Columns.Add;
  Col.Caption := 'Nome';
  Col.Width := 160;

  Col := lvRecords.Columns.Add;
  Col.Caption := 'UF';
  Col.Width := 120;

  Col := lvRecords.Columns.Add;
  Col.Caption := 'Feixa de Cep';
  Col.Width := 150;

  dt.sqlCity.SQL.Clear;

  searchFor := QuotedStr('%' + txtSearch.Text + '%');

  dt.sqlCity.SQL.Add('SELECT * from cidades WHERE nome LIKE ' + searchFor + ' OR codigo_cidade LIKE ' + searchFor + ' OR ' + IfThen(txtSearch.Text = '', '''''', txtSearch.Text) + ' BETWEEN cep_inicial AND cep_final');

  dt.sqlCity.Open;

  while not dt.sqlCity.Eof do
  begin

    item := lvRecords.Items.Add;

    item.Caption := dt.sqlCity.FieldByName('codigo_cidade').Value;

    item.SubItems.Add(dt.sqlCity.FieldByName('nome').Value);

    item.SubItems.Add(dt.sqlCity.FieldByName('estado').Value);

    item.SubItems.Add(dt.sqlCity.FieldByName('cep_inicial').Value + ' a ' + dt.sqlCity.FieldByName('cep_final').Value);

    dt.sqlCity.Next;

  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  dt := TDm.Create(Self);

  typeSelected := 'Cidades';

  directsTypeList();

end;

procedure TForm1.sideMenuClick(Sender: TObject);
begin
  if sideMenu.Selected.Text = 'Relat�rios' then
  begin    
    ShowMessage('Desculpe, essa parte do sistema ainda n�o foi implantada!');
    sideMenu.Items[0].Selected := true;     
  end;
  
  typeSelected := sideMenu.Selected.Text;
  directsTypeList();

end;

procedure TForm1.txtSearchChange(Sender: TObject);
begin

  directsTypeList();

end;

end.
