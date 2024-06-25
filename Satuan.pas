unit Satuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TFormSatuan = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edtName: TEdit;
    btnNew: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    dbgrd1: TDBGrid;
    edtCari: TEdit;
    btnCari: TButton;
    btnClose: TButton;
    btnInsert: TButton;
    lbl3: TLabel;
    edtDeskripsi: TEdit;
    procedure btnNewClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btnCariClick(Sender: TObject);
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
  FormSatuan: TFormSatuan;
  idSatuan: Integer;

implementation

uses Unit3;

{$R *.dfm}

procedure TFormSatuan.btnNewClick(Sender: TObject);
begin
  btnNew.Enabled := False;
  btnClose.Enabled := True;
  btnInsert.Enabled := True;
  edtName.Enabled := True;
end;
procedure TFormSatuan.ResetFormData;
begin
  edtName.Text := '';
  edtDeskripsi.Text := '';
  idSatuan := -1;
  clear;
  btnNew.Enabled := True;
end;

procedure TFormSatuan.btnInsertClick(Sender: TObject);
var sqlText: string;
begin
  sqlText := 'INSERT INTO satuan (name, deskripsi) values (:name, :deskripsi);';
  idSatuan := -1;
  if (edtName.Text <> '') then
  begin
    with DataModule3.queryZSatuan do
    begin
      SQL.Clear;
      SQL.Text := sqlText;

      ParamByName('name').AsString := edtName.Text;
      ParamByName('deskripsi').AsString := edtDeskripsi.Text;
      ExecSQL;

      SelectData;
    end;

    ShowMessage('Data Berhasil ditambahkan!');
  end
end;

procedure TFormSatuan.SelectData;
var sqlText: string;
begin
  with DataModule3.queryZSatuan do
  begin
      sqlText := 'SELECT * FROM satuan ORDER BY id ASC;';
      SQL.Clear;
      SQL.Text := sqlText;
      Open;

      FormattedGrid;
  end;
end;
procedure TFormSatuan.btnUpdateClick(Sender: TObject);
var sqlText:string;
begin
    sqlText := 'UPDATE satuan SET name=:name, deskripsi=:deskripsi WHERE id=:id';
  if (edtName.Text <> '') and (idSatuan >= 0)  then
  begin
    with DataModule3.queryZSatuan do
    begin
      SQL.Clear;
      SQL.Text := sqlText;
      ParamByName('id').AsString := IntToStr(idSatuan);
      ParamByName('name').AsString := edtName.Text;
      ParamByName('deskripsi').AsString := edtDeskripsi.Text;
      ExecSQL;

      SelectData;
    end;
    ShowMessage('Data Berhasil Di Update');
    ResetFormData;
  end;
end;
procedure TFormSatuan.FormattedGrid;
begin
   dbgrd1.Columns[0].Width := 30; // width kolom id
  dbgrd1.Columns[1].Width := 300; // width kolom name
  dbgrd1.Columns[2].Width := 300; // width kolom deskripsi
end;

procedure TFormSatuan.edtNameChange(Sender: TObject);
begin
  if edtName.Text <> '' then
    btnInsert.Enabled := True
  else
    btnInsert.Enabled := False;
end;

procedure TFormSatuan.clear;
begin
  btnUpdate.Enabled := False;
  btnInsert.Enabled := False;
  btnDelete.Enabled := False;
  btnNew.Enabled := False;
  btnClose.Enabled := False;
  edtName.Enabled := False;
end;

procedure TFormSatuan.FormShow(Sender: TObject);
begin
  FormattedGrid;
  clear;
  idSatuan := -1; // ketika id kosong tidak diisi menampilkan -1

  if edtName.Text <> '' then
    btnInsert.Enabled := True
  else
    btnInsert.Enabled := False;

  if idSatuan <= 0 then
  begin
    btnUpdate.Enabled := False;
    btnDelete.Enabled := False;
  end;
  btnNew.Enabled := True;
end;

procedure TFormSatuan.btnDeleteClick(Sender: TObject);
var sqlText: string;
begin
  sqlText := 'DELETE FROM satuan WHERE id=:id';
  with DataModule3.queryZSatuan do
  begin
    SQL.Clear;
    SQL.Text := sqlText;
    ParamByName('id').AsString := IntToStr(idSatuan);
    ExecSQL;

    SelectData;
  end;
  ShowMessage('Data berhasil di delete!');
  ResetFormData;
end;

procedure TFormSatuan.btnCloseClick(Sender: TObject);
begin
  clear;
  btnNew.Enabled := True;
   edtName.Text := '';
   edtDeskripsi.Text := '';
end;

procedure TFormSatuan.dbgrd1CellClick(Column: TColumn);
begin
  edtName.Text := DataModule3.queryZSatuan.Fields[1].AsString;
  edtDeskripsi.Text := DataModule3.queryZSatuan.Fields[2].AsString;
  idSatuan := StrToInt(DataModule3.queryZSatuan.Fields[0].AsString);

  clear;
  btnUpdate.Enabled := True;
  btnDelete.Enabled := True;
  btnClose.Enabled := True;
  edtName.Enabled := True;
end;

procedure TFormSatuan.btnCariClick(Sender: TObject);
begin
  if edtCari.Text <> '' then
  begin
    with DataModule3.queryZSatuan do
    begin
      SQL.Clear;
      SQL.Text := 'SELECT * FROM satuan WHERE (name LIKE :value) OR (id=:value) OR (deskripsi LIKE  :value) ORDER BY id ASC';
      ParamByName('value').AsString := '%' + edtCari.Text + '%';
      Open;
      FormattedGrid;
    end;
  end
  else
    SelectData;
end;

end.
