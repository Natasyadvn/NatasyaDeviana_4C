object DataModule3: TDataModule3
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 306
  Width = 403
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
    Password = 'root'
    Protocol = 'mysql'
    LibraryLocation = 
      'D:\Akademik\Semester 4\Visual 2\penjualan\sistem_penjualan\libmy' +
      'sql.dll'
    Left = 112
    Top = 16
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
  object queryZSatuan: TZQuery
    Connection = connection
    Active = True
    SQL.Strings = (
      'SELECT * FROM satuan ORDER BY id ASC')
    Params = <>
    Left = 200
    Top = 56
  end
  object dsSatuan: TDataSource
    DataSet = queryZSupplier
    Left = 128
    Top = 88
  end
  object queryZSupplier: TZQuery
    Connection = connection
    Active = True
    SQL.Strings = (
      'SELECT * FROM supplier ORDER BY id ASC')
    Params = <>
    Left = 168
    Top = 160
  end
  object dsSupplier: TDataSource
    DataSet = queryZSupplier
    Left = 72
    Top = 160
  end
  object queryZCustomer: TZQuery
    Connection = connection
    SQL.Strings = (
      'SELECT * FROM customer ORDER BY id ASC')
    Params = <>
    Left = 272
    Top = 184
  end
  object dsCustomer: TDataSource
    DataSet = queryZCustomer
    Left = 232
    Top = 112
  end
end
