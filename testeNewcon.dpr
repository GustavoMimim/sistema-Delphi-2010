program testeNewcon;

uses
  Forms,
  Unit1 in '..\..\Documents\RAD Studio\Projects\Unit1.pas' {Form1},
  frmMain in 'frmMain.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
