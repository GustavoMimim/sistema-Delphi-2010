program test;

uses
  Forms,
  frmMain in 'frmMain.pas' {Form1},
  frmCity in 'frmCity.pas' {Form2},
  module in 'module.pas' {Dm: TDataModule},
  frmCustomer in 'frmCustomer.pas' {Form3},
  frmFilters in 'frmFilters.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, mainForm);
  Application.CreateForm(TForm4, filterForm);
  Application.Run;
end.
