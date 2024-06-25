object FormKategori: TFormKategori
  Left = 560
  Top = 253
  Width = 587
  Height = 450
  Caption = 'KATEGORI'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object lbl1: TLabel
    Left = 56
    Top = 48
    Width = 47
    Height = 18
    Caption = 'NAMA'
  end
  object lbl2: TLabel
    Left = 40
    Top = 336
    Width = 144
    Height = 18
    Caption = 'MASUKKAN NAMA'
  end
  object edtName: TEdit
    Left = 112
    Top = 48
    Width = 441
    Height = 26
    TabOrder = 0
    OnChange = edtNameChange
  end
  object btnNew: TButton
    Left = 40
    Top = 88
    Width = 89
    Height = 41
    Caption = 'BARU'
    TabOrder = 1
    OnClick = btnNewClick
  end
  object btnUpdate: TButton
    Left = 256
    Top = 88
    Width = 89
    Height = 41
    Caption = 'UBAH'
    TabOrder = 2
    OnClick = btnUpdateClick
  end
  object btnDelete: TButton
    Left = 360
    Top = 88
    Width = 89
    Height = 41
    Caption = 'HAPUS'
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object dbgrd1: TDBGrid
    Left = 40
    Top = 144
    Width = 513
    Height = 169
    DataSource = DataModule3.dsKategori
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
  end
  object edtCari: TEdit
    Left = 200
    Top = 336
    Width = 201
    Height = 26
    TabOrder = 5
  end
  object btnCari: TButton
    Left = 424
    Top = 336
    Width = 75
    Height = 33
    Caption = 'CARI'
    TabOrder = 6
    OnClick = btnCariClick
  end
  object btnClose: TButton
    Left = 472
    Top = 88
    Width = 89
    Height = 41
    Caption = 'BATAL'
    TabOrder = 7
    OnClick = btnCloseClick
  end
  object btnInsert: TButton
    Left = 144
    Top = 88
    Width = 89
    Height = 41
    Caption = 'SIMPEN'
    TabOrder = 8
    OnClick = btnInsertClick
  end
end
