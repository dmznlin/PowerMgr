unit UFormMain;

{$I Link.Inc}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Forms, Vcl.Menus,
  System.Classes, UDataModule, dOPCCom, dOPCDA, dOPCXMLDA, dxBarBuiltInMenu,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  cxContainer, cxEdit, Vcl.ComCtrls, dOPCIntf, dOPCComn, dOPC, dxBarExtItems,
  dxBar, cxClasses, cxTextEdit, cxMemo, dxStatusBar, cxListView, cxTreeView,
  cxGroupBox, cxSplitter, cxPC, Vcl.Controls;

type
  TfFormMain = class(TForm)
    wPage1: TcxPageControl;
    SheetSrv: TcxTabSheet;
    SheetPoint: TcxTabSheet;
    SBar1: TdxStatusBar;
    Splitter1: TcxSplitter;
    BarMgr1: TdxBarManager;
    BarMgr1Bar1: TdxBar;
    dxBarSubItem1: TdxBarSubItem;
    BtnOpen: TdxBarButton;
    BtnSave: TdxBarButton;
    BarS1: TdxBarSeparator;
    BtnConn: TdxBarButton;
    dxBarButton4: TdxBarButton;
    BtnExit: TdxBarButton;
    BarMgr1Bar2: TdxBar;
    BStatic1: TdxBarStatic;
    dxBarSubItem2: TdxBarSubItem;
    BtnAboutMe: TdxBarButton;
    BtnAboutPwd: TdxBarButton;
    BtnAddGroup: TdxBarButton;
    BtnDelGroup: TdxBarButton;
    BtnDelPoint: TdxBarButton;
    PanelPath: TcxGroupBox;
    TreePath: TcxTreeView;
    PanelPoint: TcxGroupBox;
    ListItems: TcxListView;
    oServer1: TdOPCServer;
    GroupInfo: TcxGroupBox;
    MemoLog: TcxMemo;
    Splitter2: TcxSplitter;
    PanelGroup: TcxGroupBox;
    TreeGroup: TcxTreeView;
    cxSplitter1: TcxSplitter;
    cxGroupBox2: TcxGroupBox;
    ListPoint: TcxListView;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnConnClick(Sender: TObject);
  private
    { Private declarations }
    procedure SyncFormData(const nInit: Boolean = False);
  public
    { Public declarations }
  end;

var
  fFormMain: TfFormMain;

implementation

{$R *.dfm}

uses
 ULibFun, UStyleModule, System.IniFiles, UFormGetServer;

procedure TfFormMain.FormCreate(Sender: TObject);
var nInt: Integer;
    nIni: TIniFile;
begin
  SyncFormData(True);
  //init form data

  nIni := TIniFile.Create(TApplicationHelper.gFormConfig);
  try
    TApplicationHelper.LoadFormConfig(Self, nIni);
    nInt := nIni.ReadInteger(Name, 'PanelPath', 0);
    if nInt > 100 then
      PanelPath.Width := nInt;
    //xxxxx

    nInt := nIni.ReadInteger(Name, 'PanelGroup', 0);
    if nInt > 100 then
      PanelGroup.Width := nInt;
    //xxxxx
  finally
    nIni.Free;
  end;

  TApplicationHelper.LoadParameters(gSystem);
  SBar1.SimplePanelStyle.Text := gSystem.FActive.FCopyRight;

  dOPCInitSecurity;
end;

procedure TfFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
var nIni: TIniFile;
begin
  {$IFNDEF DEBUG}
  if not FSM.QueryDlg('确定要退出吗?', '询问') then
  begin
    Action := caNone;
    Exit;
  end;
  {$ENDIF}

  nIni := TIniFile.Create(TApplicationHelper.gFormConfig);
  try
    Action := caFree;
    TApplicationHelper.SaveFormConfig(Self, nIni);
    nIni.WriteInteger(Name, 'PanelPath', PanelPath.Width);
    nIni.WriteInteger(Name, 'PanelGroup', PanelGroup.Width);
  finally
    nIni.Free;
  end;
end;

procedure TfFormMain.BtnExitClick(Sender: TObject);
begin
  Close();
end;

//Desc: 同步界面组件状态
procedure TfFormMain.SyncFormData(const nInit: Boolean);
begin
  if nInit then
  begin
    TreePath.Items.Clear;
    ListItems.Clear;
    MemoLog.Clear;

    TreeGroup.Items.Clear;
    ListPoint.Clear;
    wPage1.ActivePage := SheetSrv;

    FSM.SwitchSkinRandom();
    //choine skin
  end;
end;

//Desc: 连接服务器
procedure TfFormMain.BtnConnClick(Sender: TObject);
begin
  GetOPCServer(oServer1);
end;

end.
