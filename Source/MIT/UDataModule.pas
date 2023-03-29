{*******************************************************************************
  ����: dmzn@163.com 2023-03-02
  ����: ����ģ��
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
    {*lv����*}
  end;

var
  FDM: TFDM;
  gOPC: TOPCManager = nil;
  //���ݹ�����
  gSystem: TApplicationHelper.TAppParam;
  //ϵͳ����

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

//Date: 2007-11-30
//Parm: �����Ϣ;�б�
//Desc: ����nList�ı�ͷ���
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
//Parm: �б�
//Desc: ���nLv�ı�ͷ�����Ϣ
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
