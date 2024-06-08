program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FormViewMenu},
  Unit2 in 'Unit2.pas' {FormLogin},
  Unit3 in 'Unit3.pas' {DataModule3: TDataModule},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {FormKategori};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormViewMenu, FormViewMenu);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormKategori, FormKategori);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
