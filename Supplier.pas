unit Supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Unit3;

type
  TFormSupplier = class(TForm)
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
    lbl7: TLabel;
    edtPerusahaan: TEdit;
    lbl8: TLabel;
    edtNamaBank: TEdit;
    lbl9: TLabel;
    edtNamaAkun: TEdit;
    lbl10: TLabel;
    edtNoAkunBank: TEdit;
    procedure btnNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
        procedure SelectData;
    procedure ResetFormData;
    procedure FormattedGrid;
    procedure clear;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSupplier: TFormSupplier;
  idSupplier: Integer;

implementation

{$R *.dfm}

procedure TFormSupplier.btnNewClick(Sender: TObject);
begin
  btnNew.Enabled := False;
  btnClose.Enabled := True;
  btnInsert.Enabled := True;
end;

procedure TFormSupplier.ResetFormData;
begin
  edtNIK.Text := '';
  edtNama.Text := '';
  edtTelpon.Text := '';
  edtAlamat.Text := '';
  edtEmail.Text := '';
  edtPerusahaan.Text := '';
  edtNamaBank.Text := '';
  edtNamaAkun.Text := '';
  edtNoAkunBank.Text := '';
  idSupplier := -1;
  clear;
  btnNew.Enabled := True;
end;

procedure TFormSupplier.SelectData;
var sqlText: string;
begin
  with DataModule3.queryZSupplier do
  begin
      sqlText := 'SELECT * FROM supplier ORDER BY id ASC;';
      SQL.Clear;
      SQL.Text := sqlText;
      Open;

      FormattedGrid;
  end;
end;
procedure TFormSupplier.FormattedGrid;
begin
   dbgrd1.Columns[0].Width := 25; // width kolom id
  dbgrd1.Columns[1].Width := 200; // width kolom nik
  dbgrd1.Columns[2].Width := 200; // width kolom nama
  dbgrd1.Columns[3].Width := 200; // width kolom telpon
  dbgrd1.Columns[4].Width := 200; // width kolom alamat
  dbgrd1.Columns[5].Width := 200; // width kolom email
  dbgrd1.Columns[6].Width := 200; // width kolom perusahaan
  dbgrd1.Columns[7].Width := 200; // width kolom nama bank
  dbgrd1.Columns[8].Width := 200; // width kolom nama akun bank
  dbgrd1.Columns[9].Width := 200; // width kolom no akun bank
end;

procedure TFormSupplier.clear;
begin
  btnUpdate.Enabled := False;
  btnInsert.Enabled := False;
  btnDelete.Enabled := False;
  btnNew.Enabled := False;
  btnClose.Enabled := False;
end;

procedure TFormSupplier.FormShow(Sender: TObject);
begin
  FormattedGrid;
  clear;
  idSupplier := -1; // ketika id kosong tidak diisi menampilkan -1



  if idSupplier <= 0 then
  begin
    btnUpdate.Enabled := False;
    btnDelete.Enabled := False;
  end;
  btnNew.Enabled := True;
end;

procedure TFormSupplier.dbgrd1CellClick(Column: TColumn);
begin
  idSupplier := StrToInt(DataModule3.queryZSupplier.Fields[0].AsString);
  edtNIK.Text := DataModule3.queryZSupplier.Fields[1].AsString;
  edtNama.Text := DataModule3.queryZSupplier.Fields[2].AsString;
  edtTelpon.Text := DataModule3.queryZSupplier.Fields[3].AsString;
  edtAlamat.Text := DataModule3.queryZSupplier.Fields[4].AsString;
  edtEmail.Text := DataModule3.queryZSupplier.Fields[5].AsString;
  edtPerusahaan.Text := DataModule3.queryZSupplier.Fields[6].AsString;
  edtNamaBank.Text := DataModule3.queryZSupplier.Fields[7].AsString;
  edtNamaAkun.Text := DataModule3.queryZSupplier.Fields[8].AsString;


  clear;
  btnUpdate.Enabled := True;
  btnDelete.Enabled := True;
  btnClose.Enabled := True;
end;

procedure TFormSupplier.btnInsertClick(Sender: TObject);
var sqlText: string;
begin
  sqlText := 'INSERT INTO supplier (nik, name, telp, alamat, email, perusahaan, nama_bank, nama_akun_bank, no_akun_bank) values (:nik, :name, :telp, :alamat, :email, :perusahaan, :nama_bank, :nama_akun_bank, :no_akun_bank);';
  idSupplier := -1;
  if (edtNIK.Text <> '') then
  begin
    with DataModule3.queryZSupplier do
    begin
      SQL.Clear;
      SQL.Text := sqlText;

      ParamByName('nik').AsString := edtNIK.Text;
      ParamByName('name').AsString := edtNama.Text;
      ParamByName('telp').AsString := edtTelpon.Text;
      ParamByName('alamat').AsString := edtAlamat.Text;
      ParamByName('email').AsString := edtEmail.Text;
      ParamByName('perusahaan').AsString := edtPerusahaan.Text;
      ParamByName('nama_bank').AsString := edtNamaBank.Text;
      ParamByName('nama_akun_bank').AsString := edtNamaAkun.Text;
      ParamByName('no_akun_bank').AsString := edtNoAkunBank.Text;
      ExecSQL;

      SelectData;
    end;

    ShowMessage('Data Berhasil ditambahkan!');
  end
end;

procedure TFormSupplier.btnUpdateClick(Sender: TObject);
var sqlText: string;
begin
    sqlText := 'UPDATE supplier SET nik=:nik, name=:name, telp=:telp, alamat=:alamat, email=:email, perusahaan=:perusahaan, nama_bank=:nama_bank, nama_akun_bank=:nama_akun_bank, no_akun_bank=:no_akun_bank, deskripsi=:deskripsi WHERE id=:id';
  if (edtNIK.Text <> '') and (edtNama.Text <> '') and (edtTelpon.Text <> '') and (edtPerusahaan.Text <> '') and (edtNamaBank.Text <> '') and (edtNamaAkun.Text <> '') and (edtNoAkunBank.Text <> '') and (idSupplier >= 0)  then
  begin
    with DataModule3.queryZSupplier do
    begin
      SQL.Clear;
      SQL.Text := sqlText;
      ParamByName('id').AsString := IntToStr(idSupplier);
      ParamByName('nik').AsString := edtNIK.Text;
      ParamByName('name').AsString := edtNama.Text;
      ParamByName('telp').AsString := edtTelpon.Text;
      ParamByName('alamat').AsString := edtAlamat.Text;
      ParamByName('email').AsString := edtEmail.Text;
      ParamByName('perusahaan').AsString := edtPerusahaan.Text;
      ParamByName('nama_bank').AsString := edtNamaBank.Text;
      ParamByName('nama_akun_bank').AsString := edtNamaAkun.Text;
      ParamByName('no_akun_bank').AsString := edtNoAkunBank.Text;
      ExecSQL;

      SelectData;
    end;
    ShowMessage('Data Berhasil Di Update');
    ResetFormData;
end;
end;

procedure TFormSupplier.btnDeleteClick(Sender: TObject);
var sqlText: string;
begin
sqlText := 'DELETE FROM supplier WHERE id=:id';
  with DataModule3.queryZSatuan do
  begin
    SQL.Clear;
    SQL.Text := sqlText;
    ParamByName('id').AsString := IntToStr(idSupplier);
    ExecSQL;

    SelectData;
  end;
  ShowMessage('Data berhasil di delete!');
  ResetFormData;
end;

procedure TFormSupplier.btnCloseClick(Sender: TObject);
begin
  clear;
  btnNew.Enabled := True;
  ResetFormData;
end;

end.
