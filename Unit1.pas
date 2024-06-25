unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,Unit2, Unit5, Satuan, Supplier;

type
  TFormViewMenu = class(TForm)
    mm1: TMainMenu;
    LLL1: TMenuItem;
    mmLogin: TMenuItem;
    LOGOUT1: TMenuItem;
    DATAMASTER2: TMenuItem;
    KATEGORI1: TMenuItem;
    SATUAN1: TMenuItem;
    SUPLIER1: TMenuItem;
    KUSTOMER1: TMenuItem;
    RANSASKI1: TMenuItem;
    PENJUALAN1: TMenuItem;
    PEMBELIAN1: TMenuItem;
    LAPORAN1: TMenuItem;
    LAPORANPENJUALAN1: TMenuItem;
    LAPORANSTOKBARANG1: TMenuItem;
    LAPORANBARANG1: TMenuItem;
    procedure mmLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KATEGORI1Click(Sender: TObject);
    procedure SATUAN1Click(Sender: TObject);
    procedure SUPLIER1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormViewMenu: TFormViewMenu;

implementation

{$R *.dfm}

procedure TFormViewMenu.mmLoginClick(Sender: TObject);
var loginForm: TFormLogin;
begin
//form2.Create(Application);
   loginForm := TFormLogin.Create(Application);
   loginForm.ShowModal;
end;

procedure TFormViewMenu.FormShow(Sender: TObject);
begin
  mm1.Items[1].Visible := False;
  mm1.Items[2].Visible := False;
  mm1.Items[3].Visible := False;
end;

procedure TFormViewMenu.KATEGORI1Click(Sender: TObject);
var form: TFormKategori;
begin
   form := TFormKategori.Create(Application);
   form.ShowModal;
end;

procedure TFormViewMenu.SATUAN1Click(Sender: TObject);
var form: TFormSatuan;
begin
  form := TFormSatuan.Create(Application);
  form.ShowModal;
end;

procedure TFormViewMenu.SUPLIER1Click(Sender: TObject);
var form: TFormSupplier;
begin
  form := TFormSupplier.Create(Application);
  form.ShowModal;
end;

end.
