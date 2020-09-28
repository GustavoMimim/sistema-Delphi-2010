program test;

uses
  Forms,
  frmMain in 'frmMain.pas' {Form1},
  frmCity in 'frmCity.pas' {Form2},
  module in 'module.pas' {Dm: TDataModule},
  frmCustomer in 'frmCustomer.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
