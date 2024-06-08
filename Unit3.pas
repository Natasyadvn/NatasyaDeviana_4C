unit Unit3;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TDataModule3 = class(TDataModule)
    dsKategori: TDataSource;
    connection: TZConnection;
    queryZKategori: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule3: TDataModule3;

implementation

{$R *.dfm}

end.
