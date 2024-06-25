unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Unit3;

type
  TFormKategori = class(TForm)
    lbl1: TLabel;
    edtName: TEdit;
    btnNew: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    dbgrd1: TDBGrid;
    lbl2: TLabel;
    edtCari: TEdit;
    btnCari: TButton;
    btnClose: TButton;
    btnInsert: TButton;
    procedure btnNewClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCariClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelectData;
    procedure ResetFormData;
    procedure FormattedGrid;
    procedure clear;
    procedure firstIndex;
  public
    { Public declarations }
  end;

var
  FormKategori: TFormKategori;
  idKategori: Integer;

implementation

uses ZDataset, ZAbstractRODataset, DB;

{$R *.dfm}

procedure TFormKategori.clear;
begin
  btnUpdate.Enabled := False;
  btnInsert.Enabled := False;
  btnDelete.Enabled := False;
  btnNew.Enabled := False;
  btnClose.Enabled := False;
  edtName.Enabled := False;
end;
procedure TFormKategori.firstIndex;
begin

end;
procedure TFormKategori.btnNewClick(Sender: TObject);
var sqlText: string;
begin
  btnNew.Enabled := False;
  btnClose.Enabled := True;
  btnInsert.Enabled := True;
  edtName.Enabled := True;
end;


procedure TFormKategori.FormattedGrid;
begin
   dbgrd1.Columns[0].Width := 30; // width kolom id
  dbgrd1.Columns[1].Width := 370; // width kolom name
end;
procedure TFormKategori.SelectData;
var sqlText: string;
begin
  with DataModule3.queryZKategori do
  begin
      sqlText := 'SELECT * FROM kategori ORDER BY id ASC;';
      SQL.Clear;
      SQL.Text := sqlText;
      Open;

      FormattedGrid;
  end;
end;

procedure TFormKategori.ResetFormData;
begin
  edtName.Text := '';
  idKategori := -1;
  clear;
  btnNew.Enabled := True;
end;

procedure TFormKategori.edtNameChange(Sender: TObject);
begin
  if edtName.Text <> '' then
    btnInsert.Enabled := True
  else
    btnInsert.Enabled := False;
end;

procedure TFormKategori.FormShow(Sender: TObject);
begin
  FormattedGrid;
  clear;
  idKategori := -1; // ketika id kosong tidak diisi menampilkan -1

  if edtName.Text <> '' then
    btnInsert.Enabled := True
  else
    btnInsert.Enabled := False;

  if idKategori <= 0 then
  begin
    btnUpdate.Enabled := False;
    btnDelete.Enabled := False;
  end;
  btnNew.Enabled := True;

end;

procedure TFormKategori.btnUpdateClick(Sender: TObject);
var sqlText: string;
begin
  sqlText := 'UPDATE kategori SET name=:name WHERE id=:id';
  if (edtName.Text <> '') and (idKategori >= 0)  then
  begin
    with DataModule3.queryZKategori do
    begin
      SQL.Clear;
      SQL.Text := sqlText;
      ParamByName('id').AsString := IntToStr(idKategori);
      ParamByName('name').AsString := edtName.Text;
      ExecSQL;

      SelectData;
    end;
    ShowMessage('Data Berhasil Di Update');
    ResetFormData;
  end;
end;

procedure TFormKategori.dbgrd1CellClick(Column: TColumn);
begin
  edtName.Text := DataModule3.queryZKategori.Fields[1].AsString;
  idKategori := StrToInt(DataModule3.queryZKategori.Fields[0].AsString);

  clear;
  btnUpdate.Enabled := True;
  btnDelete.Enabled := True;
  btnClose.Enabled := True;
  edtName.Enabled := True;
end;

procedure TFormKategori.btnDeleteClick(Sender: TObject);
var sqlText: string;
begin
  sqlText := 'DELETE FROM kategori WHERE id=:id';
  with DataModule3.queryZKategori do
  begin
    SQL.Clear;
    SQL.Text := sqlText;
    ParamByName('id').AsString := IntToStr(idKategori);
    ExecSQL;

    SelectData;
  end;
  ShowMessage('Data berhasil di delete!');
  ResetFormData;
end;

procedure TFormKategori.btnCariClick(Sender: TObject);
begin
  if edtCari.Text <> '' then
  begin
    with DataModule3.queryZKategori do
    begin
      SQL.Clear;
      SQL.Text := 'SELECT * FROM kategori WHERE name LIKE :name OR (id=:id) ORDER BY id ASC';
      ParamByName('name').AsString := '%' + edtCari.Text + '%';
      ParamByName('id').AsString := edtCari.Text;
      Open;
      FormattedGrid;
    end;
  end
  else
    SelectData;
end;

procedure TFormKategori.btnInsertClick(Sender: TObject);
var sqlText: string;
begin
  sqlText := 'INSERT INTO kategori (name) values (:name);';
  idKategori := -1;
  if (edtName.Text <> '') then
  begin
    with DataModule3.queryZKategori do
    begin
      SQL.Clear;
      SQL.Text := sqlText;

      ParamByName('name').AsString := edtName.Text;
      ExecSQL;

      SelectData;
    end;

    ShowMessage('Data Berhasil ditambahkan!');
  end
end;

procedure TFormKategori.btnCloseClick(Sender: TObject);
begin
  clear;
  btnNew.Enabled := True;
   edtName.Text := '';
end;

end.
