program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FormViewMenu},
  Unit2 in 'Unit2.pas' {FormLogin},
  Unit3 in 'Unit3.pas' {DataModule3: TDataModule},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {FormKategori},
  Unit6 in 'Unit6.pas',
  Unit7 in 'Unit7.pas',
  Satuan in 'Satuan.pas' {FormSatuan},
  Supplier in 'Supplier.pas' {FormSupplier},
  Customer in 'Customer.pas' {FormCustomer};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormViewMenu, FormViewMenu);
  Application.CreateForm(TFormKategori, FormKategori);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TFormSatuan, FormSatuan);
  Application.CreateForm(TFormSupplier, FormSupplier);
  Application.CreateForm(TFormCustomer, FormCustomer);
  Application.Run;
end.
