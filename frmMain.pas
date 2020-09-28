unit frmMain;

interface

uses
  module, frmCity, frmCustomer, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, pngimage, DB, ADODB, StrUtils,
  GestureCtrls;

type
  TForm1 = class(TForm)
    mainBody: TPanel;
    headerBottom: TPanel;
    panelSeach: TPanel;
    lblSearch: TLabel;
    txtSearch: TEdit;
    lvRecords: TListView;
    panelButtons: TPanel;
    btnUpdate: TButton;
    btnAdd: TButton;
    Label1: TLabel;
    btnRefresh: TButton;
    Panel1: TPanel;
    sideMenu: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure sideMenuClick(Sender: TObject);
    procedure ListCities();
    procedure ListCustomers();
    procedure txtSearchChange(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
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
    Form2.txtCode.Enabled := true;
    Form2.btnRemove.Enabled := false;
    Form2.Show;
    Form2.loadCity('0');
  end
  else
  begin
    Form3 := TForm3.Create(nil);
    Form3.newRecord := true;
    Form3.txtCode.Enabled := true;
    Form3.btnRemove.Enabled := false;
    Form3.Show;
    Form3.loadCustomer('0');
  end;

end;

procedure TForm1.btnUpdateClick(Sender: TObject);
begin

  if lvRecords.Items.Count = 0 then
  begin
    ShowMessage('Nenhum registro foi encontrado!');
    exit;
  end;

  if typeSelected = 'Cidades' then
  begin

    Application.CreateForm(TForm2, Form2);
    Form2.loadCity(lvRecords.Selected.Caption);
    Form2.Show;
  end
  else
  begin
    Application.CreateForm(TForm3, Form3);
    Form3.loadCustomer(lvRecords.Selected.Caption);
    Form3.Show;
  end;
end;

procedure TForm1.btnRefreshClick(Sender: TObject);
begin

  directsTypeList(); 

end;

procedure TForm1.directsTypeList();
begin

  if typeSelected = 'Cidades' then
    ListCities()
  else if typeSelected = 'Clientes' then
    ListCustomers();

  if lvRecords.Items.Count > 0 then
    lvRecords.ItemIndex := 0;

end;

procedure TForm1.ListCustomers();
var
  item: TListItem;
  searchFor: string;

begin

  lvRecords.Clear;

  lvRecords.Columns[2].Caption := 'Telefone';
  lvRecords.Columns[3].Caption := 'Cidade';

  dt.sqlCity.SQL.Clear;

  searchFor := QuotedStr('%' + txtSearch.Text + '%');

  dt.sqlCity.SQL.Add('SELECT codigo_cliente, clientes.nome, telefone, cidades.nome AS cidade from clientes LEFT JOIN cidades ON cidades.codigo_cidade = clientes.codigo_cidade ' +
  'WHERE clientes.nome LIKE ' + searchFor + ' OR codigo_cliente LIKE ' + searchFor + ' OR cep LIKE ' + searchFor);

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
  searchFor: string;

begin

  lvRecords.Clear;

  lvRecords.Columns[2].Caption := 'UF';
  lvRecords.Columns[3].Caption := 'Faixa de Cep';

  dt.sqlCity.SQL.Clear;

  searchFor := QuotedStr('%' + txtSearch.Text + '%');

  dt.sqlCity.SQL.Add('SELECT * from cidades WHERE nome LIKE ' + searchFor + ' OR codigo_cidade LIKE ' + searchFor + ' OR ' + QuotedStr(txtSearch.Text) + ' BETWEEN cep_inicial AND cep_final');

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

procedure TForm1.FormResize(Sender: TObject);
begin

  //Ajusta a propriedade width das colunas conforme o tamanho do form
  lvRecords.Columns[0].Width := Round((10/100) * lvRecords.Width);
  lvRecords.Columns[1].Width := Round((30/100) * lvRecords.Width);
  lvRecords.Columns[2].Width := Round((20/100) * lvRecords.Width);
  lvRecords.Columns[3].Width := Round((35/100) * lvRecords.Width);
  lvRecords.Refresh;

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
