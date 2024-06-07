object Form5: TForm5
  Left = 200
  Top = 198
  Width = 609
  Height = 450
  Caption = 'KATEGORI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 120
    Top = 48
    Width = 28
    Height = 13
    Caption = 'NAME'
  end
  object lbl2: TLabel
    Left = 120
    Top = 336
    Width = 85
    Height = 13
    Caption = 'MASUKKAN NAME'
  end
  object edt1: TEdit
    Left = 184
    Top = 48
    Width = 337
    Height = 21
    TabOrder = 0
    Text = 'edt1'
  end
  object btn1: TButton
    Left = 184
    Top = 96
    Width = 75
    Height = 25
    Caption = 'INSERT'
    TabOrder = 1
  end
  object btn2: TButton
    Left = 280
    Top = 96
    Width = 75
    Height = 25
    Caption = 'UPDATE'
    TabOrder = 2
  end
  object btn3: TButton
    Left = 384
    Top = 96
    Width = 75
    Height = 25
    Caption = 'DELETE'
    TabOrder = 3
  end
  object dbgrd1: TDBGrid
    Left = 184
    Top = 152
    Width = 337
    Height = 137
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edt2: TEdit
    Left = 224
    Top = 336
    Width = 201
    Height = 21
    TabOrder = 5
    Text = 'edt2'
  end
  object btn4: TButton
    Left = 448
    Top = 336
    Width = 75
    Height = 25
    Caption = 'CARI'
    TabOrder = 6
  end
end
