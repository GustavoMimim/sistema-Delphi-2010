unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    sideMenu: TTreeView;
    mainBody: TPanel;
    tabPages: TPageControl;
    Cidades: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    header: TPanel;
    ListView1: TListView;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure sideMenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.sideMenuClick(Sender: TObject);
begin

  tabPages.ActivePageIndex := sideMenu.Selected.Index;

end;

end.
