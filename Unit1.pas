unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,Unit2;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    LLL1: TMenuItem;
    DATAMASTER1: TMenuItem;
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
    procedure DATAMASTER1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DATAMASTER1Click(Sender: TObject);
begin
form2.Create(Application);

end;

end.
