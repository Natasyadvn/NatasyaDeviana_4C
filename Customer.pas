unit Customer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TFormCustomer = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edtNIK: TEdit;
    btnNew: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    dbgrd1: TDBGrid;
    edtCari: TEdit;
    btnCari: TButton;
    btnClose: TButton;
    btnInsert: TButton;
    lbl3: TLabel;
    edtNama: TEdit;
    lbl4: TLabel;
    edtTelpon: TEdit;
    lbl5: TLabel;
    edtAlamat: TEdit;
    lbl6: TLabel;
    edtEmail: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCustomer: TFormCustomer;

implementation

{$R *.dfm}

end.
