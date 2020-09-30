unit frmFilters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    panelFilters: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbState: TComboBox;
    txtCodeCityMin: TEdit;
    txtCodeCityMax: TEdit;
    txtCodeCustomerMin: TEdit;
    txtCodeCustomerMax: TEdit;
    chkGroupByCity: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

implementation

{$R *.dfm}

procedure TForm4.FormDeactivate(Sender: TObject);
begin

  Self.Visible := false;

end;

procedure TForm4.FormShow(Sender: TObject);
begin

  txtCodeCustomerMin.SetFocus;

end;

end.
