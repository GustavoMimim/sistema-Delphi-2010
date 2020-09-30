unit frmMain;

interface

uses
  frmFilters, module, frmCity, frmCustomer, StdCtrls, ComCtrls, Controls, Classes, ExtCtrls, Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, pngimage, DB, ADODB, StrUtils, Tabs;

type
  TForm1 = class(TForm)
    mainBody: TPanel;
    panelFooter: TPanel;
    lvRecords: TListView;
    panelButtons: TPanel;
    btnUpdate: TButton;
    btnAdd: TButton;
    Label1: TLabel;
    btnRefresh: TButton;
    panelSideMenu: TPanel;
    sideMenu: TTreeView;
    panelHeader: TPanel;
    panelSeach: TPanel;
    txtSearch: TEdit;
    topPanelSearch: TPanel;
    Label2: TLabel;
    Button1: TButton;
    btnReport: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure sideMenuClick(Sender: TObject);
    procedure txtSearchChange(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListCities();
    procedure ListCustomers();
    function verifyFiltersSQL(): String;
    procedure btnReportClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure directsTypeList();
  end;

var
  mainForm: TForm1;
  cityForm: TForm2;
  customerForm: TForm3;
  filterForm: TForm4;

  dt: TDm;
  typeSelected: String;

implementation

{$R *.dfm}

procedure TForm1.btnAddClick(Sender: TObject);
begin
  if typeSelected = 'Cidades' then
  begin
    cityForm := TForm2.Create(nil);
    cityForm.newRecord := true;
    cityForm.txtCode.Enabled := true;
    cityForm.btnRemove.Enabled := false;
    cityForm.Show;
    cityForm.loadCity('0');
  end
  else
  begin
    customerForm := TForm3.Create(nil);
    customerForm.newRecord := true;
    customerForm.txtCode.Enabled := true;
    customerForm.btnRemove.Enabled := false;
    customerForm.Show;
    customerForm.loadCustomer('0');
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

    Application.CreateForm(TForm2, cityForm);
    cityForm.loadCity(lvRecords.Selected.Caption);
    cityForm.Show;
  end
  else
  begin
    Application.CreateForm(TForm3, customerForm);
    customerForm.loadCustomer(lvRecords.Selected.Caption);
    customerForm.Show;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  //Posiciona o form de filtros ao lado do form principal, ou, se n�o houver  espa�o, dentro do form principal

  if (Self.Left + Self.Width) >= Screen.Width then
  begin
    filterForm.Left := Screen.Width - filterForm.Width;
    filterForm.Top := Self.Top + panelHeader.Top + panelHeader.Height;
  end
  else
  begin
    filterForm.Left := Self.Left + Self.Width;
    filterForm.Top := Self.Top;
  end;

  filterForm.Visible := true;

end;

procedure TForm1.btnRefreshClick(Sender: TObject);
begin

  directsTypeList(); 

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  filterForm := TForm4.Create(Self);
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

  typeSelected := sideMenu.Selected.Text;

  directsTypeList();

end;

procedure TForm1.txtSearchChange(Sender: TObject);
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

  dt.sqlCity.SQL.Add('SELECT codigo_cliente, clientes.nome, telefone, cidades.nome AS cidade from clientes LEFT JOIN cidades ON cidades.codigo_cidade = clientes.codigo_cidade '
  + verifyFiltersSQL());

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

function TForm1.verifyFiltersSQL(): String;
var
  searchFor, strWhere: string;
  I, CodeMin, CodeMax, Code: Integer;

begin
  strWhere := 'WHERE ';

// Filtros da pesquisa
  if Length(txtSearch.Text) > 0 then
  begin
    searchFor := QuotedStr('%' + txtSearch.Text + '%');
    strWhere := strWhere + ' cidades.nome LIKE ' + searchFor + ' OR cidades.codigo_cidade LIKE ' + searchFor + ' OR ' + QuotedStr(txtSearch.Text) + ' BETWEEN cep_inicial AND cep_final ';

    if typeSelected = 'Clientes' then
      strWhere := strWhere + ' OR clientes.nome LIKE ' + searchFor + ' OR codigo_cliente LIKE ' + searchFor;

    strWhere := strWhere +   ' AND '
  end;

  Val(filterForm.txtCodeCityMin.Text, I, CodeMin);
  Val(filterForm.txtCodeCityMax.Text, I, CodeMax);
  // Define o limite de pesquisa do c�digo da cidade
  if (CodeMin = 0) and (CodeMax = 0) then
     strWhere := strWhere + 'cidades.codigo_cidade BETWEEN ' + filterForm.txtCodeCityMin.Text + ' AND ' + filterForm.txtCodeCityMax.Text + ' AND '
  else if CodeMin = 0 then
    strWhere := strWhere + 'cidades.codigo_cidade >= ' + filterForm.txtCodeCityMin.Text + ' AND '
  else if CodeMax = 0 then
    strWhere := strWhere + 'cidades.codigo_cidade <= ' + filterForm.txtCodeCityMax.Text + ' AND ';

  // Filtro por estado
  if filterForm.cbState.ItemIndex > 0 then
    strWhere := strWhere + 'estado = ' + QuotedStr(filterForm.cbState.Text) + ' AND ';

  if typeSelected = 'Clientes' then
  begin

    Val(filterForm.txtCodeCustomerMin.Text, I, CodeMin);
    Val(filterForm.txtCodeCustomerMax.Text, I, CodeMax);
    // Define o limite de pesquisa do c�digo do cliente
    if (CodeMin = 0) and (CodeMax = 0) then
       strWhere := strWhere + ' codigo_cliente BETWEEN ' + filterForm.txtCodeCustomerMin.Text + ' AND ' + filterForm.txtCodeCustomerMax.Text
    else if CodeMin = 0 then
      strWhere := strWhere + ' codigo_cliente >= ' + filterForm.txtCodeCustomerMin.Text
    else if CodeMax = 0 then
      strWhere := strWhere + ' codigo_cliente <= ' + filterForm.txtCodeCustomerMax.Text;

  end;

  // Remove a �ltima instru��o SQL caso necess�rio
  if RightStr(strWhere, 6) = 'WHERE ' then
    strWhere := ''
  else if RightStr(strWhere, 5) = ' AND ' then
    strWhere := LeftStr(strWhere, Length(strWhere) - 5);

  // Agrupar por cidade
  if filterForm.chkGroupByCity.Checked = true then
    strWhere := strWhere + ' ORDER BY cidades.nome';

  verifyFiltersSQL := strWhere;

end;

procedure TForm1.ListCities();
var
  item: TListItem;

begin

  lvRecords.Clear;

  lvRecords.Columns[2].Caption := 'UF';
  lvRecords.Columns[3].Caption := 'Faixa de Cep';

  dt.sqlCity.SQL.Clear;

  dt.sqlCity.SQL.Add('SELECT * from cidades ' + verifyFiltersSQL());

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

end.
