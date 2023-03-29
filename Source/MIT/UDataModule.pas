{*******************************************************************************
  作者: dmzn@163.com 2023-03-02
  描述: 数据模块
*******************************************************************************}
unit UDataModule;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  System.IniFiles, cxImageList, cxGraphics, cxListView, ULibFun, UMgrOPC;

type
  TFDM = class(TDataModule)
    ImgSmall: TcxImageList;
  private
    { Private declarations }
  public
    { Public declarations }
    function MakeListViewColumnInfo(const nLv: TcxListView): string;
    procedure LoadListViewColumn(const nWidths: string; const nLv: TcxListView);
    {*lv配置*}
  end;

var
  FDM: TFDM;
  gOPC: TOPCManager = nil;
  //数据管理器
  gSystem: TApplicationHelper.TAppParam;
  //系统参数

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

//Date: 2007-11-30
//Parm: 宽度信息;列表
//Desc: 载入nList的表头宽度
procedure TFDM.LoadListViewColumn(const nWidths: string; const nLv: TcxListView);
var nList: TStrings;
    i,nCount: integer;
begin
  if nLv.Columns.Count > 0 then
  begin
    nList := TStringList.Create;
    try
      if TStringHelper.Split(nWidths, nList, ';', tpNo,  nLv.Columns.Count) then
      begin
        nCount := nList.Count - 1;
        for i:=0 to nCount do
         if TStringHelper.IsNumber(nList[i], False) then
          nLv.Columns[i].Width := StrToInt(nList[i]);
      end;
    finally
      nList.Free;
    end;
  end;
end;

//Date: 2007-11-30
//Parm: 列表
//Desc: 组合nLv的表头宽度信息
function TFDM.MakeListViewColumnInfo(const nLv: TcxListView): string;
var i,nCount: integer;
begin
  Result := '';
  nCount := nLv.Columns.Count - 1;

  for i:=0 to nCount do
  if i = nCount then
       Result := Result + IntToStr(nLv.Columns[i].Width)
  else Result := Result + IntToStr(nLv.Columns[i].Width) + ';';
end;

end.
