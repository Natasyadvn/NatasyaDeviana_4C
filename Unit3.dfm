object DataModule3: TDataModule3
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 217
  Width = 286
  object dsKategori: TDataSource
    DataSet = queryZKategori
    Left = 40
    Top = 24
  end
  object connection: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'sistem_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'D:\Learning\delphi\NatasyaDeviana_4C\libmysql.dll'
    Left = 104
    Top = 32
  end
  object queryZKategori: TZQuery
    Connection = connection
    Active = True
    SQL.Strings = (
      'SELECT * FROM kategori ORDER BY id ASC')
    Params = <>
    Left = 64
    Top = 80
  end
end
