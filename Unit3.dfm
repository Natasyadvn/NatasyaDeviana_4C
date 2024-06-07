object DataModule3: TDataModule3
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 217
  Width = 286
  object ds1: TDataSource
    DataSet = zqry1
    Left = 40
    Top = 24
  end
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 0
    Database = 'C:\Users\LENOVO\Downloads\code_sql.sql'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\LENOVO\Documents\LOGIN\libmysql.dll'
    Left = 104
    Top = 32
  end
  object zqry1: TZQuery
    Connection = con1
    SQL.Strings = (
      'Select*Foamtablename')
    Params = <>
    Left = 64
    Top = 80
  end
end
