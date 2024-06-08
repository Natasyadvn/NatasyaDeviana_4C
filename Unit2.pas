unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormLogin = class(TForm)
    edtRole: TEdit;
    btnLogin: TButton;
    lblRole: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure edtRoleKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

uses Unit1;

{$R *.dfm}

procedure TFormLogin.btnLoginClick(Sender: TObject);
begin
  // Remove visibility from all forms and then turn on only the active ones
  FormViewMenu.mm1.Items[1].Visible := False;
  FormViewMenu.mm1.Items[2].Visible := False;
  FormViewMenu.mm1.Items[3].Visible := False;

  if edtRole.Text = 'admin' then
  begin
    FormViewMenu.mm1.Items[1].Visible := True;
    Close;
  end
  else if edtRole.Text = 'kasir' then
  begin
    FormViewMenu.mm1.Items[2].Visible := True;
    Close;
  end
  else if edtRole.Text = 'pemilik' then
  begin
    FormViewMenu.mm1.Items[3].Visible := True;
    Close;
  end
  else
    begin
      MessageDlg('ERROR: Anda gagal login harap masukan dengan benar', mtError, [mbOK], 0);
      edtRole.SetFocus;
    end;

end;

procedure TFormLogin.edtRoleKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then  // 13 adalah kode ASCII untuk Enter
  begin
    Key := #0;
    btnLogin.Click; 
  end;
end;

end.
