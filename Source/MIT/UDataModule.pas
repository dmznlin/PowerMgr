{*******************************************************************************
  ����: dmzn@163.com 2023-03-02
  ����: ����ģ��
*******************************************************************************}
unit UDataModule;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  cxImageList, cxGraphics, ULibFun;

type
  TFDM = class(TDataModule)
    ImgSmall: TcxImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDM: TFDM;
  gSystem: TApplicationHelper.TAppParam;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
