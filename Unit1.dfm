object FormViewMenu: TFormViewMenu
  Left = 361
  Top = 287
  Width = 870
  Height = 449
  Caption = 'Menu Utama'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 24
    Top = 344
    object LLL1: TMenuItem
      Caption = 'FILE'
      object mmLogin: TMenuItem
        Caption = 'LOGIN'
        OnClick = mmLoginClick
      end
      object LOGOUT1: TMenuItem
        Caption = 'LOGOUT'
      end
    end
    object DATAMASTER2: TMenuItem
      Caption = 'DATA MASTER'
      object KATEGORI1: TMenuItem
        Caption = 'KATEGORI'
      end
      object SATUAN1: TMenuItem
        Caption = 'SATUAN'
      end
      object SUPLIER1: TMenuItem
        Caption = 'SUPLIER'
      end
      object KUSTOMER1: TMenuItem
        Caption = 'KUSTOMER'
      end
    end
    object RANSASKI1: TMenuItem
      Caption = 'TRANSAKSI'
      object PENJUALAN1: TMenuItem
        Caption = 'PENJUALAN'
      end
      object PEMBELIAN1: TMenuItem
        Caption = 'PEMBELIAN'
      end
    end
    object LAPORAN1: TMenuItem
      Caption = 'LAPORAN'
      object LAPORANPENJUALAN1: TMenuItem
        Caption = 'LAPORAN PENJUALAN'
      end
      object LAPORANSTOKBARANG1: TMenuItem
        Caption = 'LAPORAN STOK BARANG'
      end
      object LAPORANBARANG1: TMenuItem
        Caption = 'LAPORAN BARANG'
      end
    end
  end
end
