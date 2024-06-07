object FormLogin: TFormLogin
  Left = 658
  Top = 267
  Width = 410
  Height = 250
  Caption = 'LOGIN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblRole: TLabel
    Left = 48
    Top = 56
    Width = 78
    Height = 13
    Caption = 'Masukkan Role: '
  end
  object edtRole: TEdit
    Left = 136
    Top = 56
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object btnLogin: TButton
    Left = 160
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 1
    OnClick = btnLoginClick
  end
end
