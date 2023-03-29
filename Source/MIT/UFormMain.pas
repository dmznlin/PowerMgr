unit UFormMain;

{$I Link.Inc}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Vcl.Forms, Vcl.Menus,
  System.Classes, UDataModule, dOPCCom, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, cxContainer, cxEdit, dxBarBuiltInMenu,
  Vcl.ComCtrls, dOPCIntf, dOPCComn, dOPCDA, dOPC, dxBarExtItems, dxBar,
  cxClasses, cxListView, cxTreeView, cxPC, cxTextEdit, cxMemo, cxSplitter,
  cxGroupBox, Vcl.Controls, dxStatusBar, cxCheckBox;

type
  TfFormMain = class(TForm)
    SBar1: TdxStatusBar;
    BarMgr1: TdxBarManager;
    BarMgr1Bar1: TdxBar;
    dxBarSubItem1: TdxBarSubItem;
    BtnOpen: TdxBarButton;
    BtnSave: TdxBarButton;
    BarS1: TdxBarSeparator;
    BtnConn: TdxBarButton;
    BtnDisconn: TdxBarButton;
    BtnExit: TdxBarButton;
    BarMgr1Bar2: TdxBar;
    BStatic1: TdxBarStatic;
    dxBarSubItem2: TdxBarSubItem;
    BtnAboutMe: TdxBarButton;
    BtnAboutPwd: TdxBarButton;
    BtnAddGroup: TdxBarButton;
    BtnDelGroup: TdxBarButton;
    BtnDelPoint: TdxBarButton;
    OPCServer: TdOPCServer;
    PanelMain: TcxGroupBox;
    Splitter2: TcxSplitter;
    PanelInfo: TcxGroupBox;
    MemoLog: TcxMemo;
    wPage1: TcxPageControl;
    SheetSrv: TcxTabSheet;
    Splitter1: TcxSplitter;
    PanelPath: TcxGroupBox;
    TreePath: TcxTreeView;
    PanelPoint: TcxGroupBox;
    ListItems: TcxListView;
    SheetPoint: TcxTabSheet;
    PanelGroup: TcxGroupBox;
    TreeGroup: TcxTreeView;
    cxSplitter1: TcxSplitter;
    cxGroupBox2: TcxGroupBox;
    ListPoint: TcxListView;
    PMenuPath: TdxBarPopupMenu;
    BtnCanRead: TdxBarButton;
    BtnCanWrite: TdxBarButton;
    BtnCanSys: TdxBarButton;
    BtnFreshPath: TdxBarButton;
    BtnExpand: TdxBarButton;
    BtnCollapse: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnConnClick(Sender: TObject);
    procedure OPCServerConnect(Sender: TObject);
    procedure OPCServerDisconnect(Sender: TObject);
    procedure OPCServerServerShutdown(Sender: TObject; Reason: string);
    procedure BtnDisconnClick(Sender: TObject);
    procedure TreePathDeletion(Sender: TObject; Node: TTreeNode);
    procedure PMenuPathPopup(Sender: TObject);
    procedure BtnCanReadClick(Sender: TObject);
    procedure BtnExpandClick(Sender: TObject);
    procedure BtnFreshPathClick(Sender: TObject);
    procedure TreePathChange(Sender: TObject; Node: TTreeNode);
    procedure ListItemsDeletion(Sender: TObject; Item: TListItem);
  private
    { Private declarations }
    procedure SyncFormData(const nInit: Boolean = False);
    {*同步数据*}
    procedure DoWriteLog(const nEvent: string);
    {*记录日志*}
  public
    { Public declarations }
  end;

var
  fFormMain: TfFormMain;

implementation

{$R *.dfm}

uses
  ULibFun, UManagerGroup, UStyleModule, System.IniFiles, UFormGetServer,
  UMgrOPC;

procedure WriteLog(const nEvent: string);
begin
  gMG.FLogManager.AddLog(TfFormMain, '系统主界面', nEvent);
end;

procedure TfFormMain.FormCreate(Sender: TObject);
var nInt: Integer;
    nIni: TIniFile;
begin
  gMG.FLogManager.SyncMainUI := True;
  gMG.FLogManager.SyncSimple := DoWriteLog;
  gMG.FLogManager.StartService();

  SyncFormData(True);
  //init form data

  dOPCInitSecurity;
  //init opc
  gOPC := TOPCManager.Create(OPCServer);

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

    nInt := nIni.ReadInteger(Name, 'PanelInfo', 0);
    if nInt > 100 then
      PanelInfo.Height := nInt;
    //xxxxx

    FDM.LoadListViewColumn(nIni.ReadString(Name, 'ListItems', ''), ListItems);
    FDM.LoadListViewColumn(nIni.ReadString(Name, 'ListPoint', ''), ListPoint);
  finally
    nIni.Free;
  end;

  TApplicationHelper.LoadParameters(gSystem);
  SBar1.SimplePanelStyle.Text := gSystem.FActive.FCopyRight;
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
    nIni.WriteInteger(Name, 'PanelInfo', PanelInfo.Height);
    nIni.WriteString(Name, 'ListItems', FDM.MakeListViewColumnInfo(ListItems));
    nIni.WriteString(Name, 'ListPoint', FDM.MakeListViewColumnInfo(ListPoint));
  finally
    nIni.Free;
  end;

  gOPC.Free;
  //opc data manager
end;

procedure TfFormMain.BtnExitClick(Sender: TObject);
begin
  Close();
end;

//Desc: 清理节点对象
procedure TfFormMain.TreePathDeletion(Sender: TObject; Node: TTreeNode);
begin
  TdOPCBrowseItem(Node.Data).Free;
end;

procedure TfFormMain.ListItemsDeletion(Sender: TObject; Item: TListItem);
begin
  TdOPCBrowseItem(Item.Data).Free;
end;

//------------------------------------------------------------------------------
//Date: 2023-03-09
//Parm: 日志内容
//Desc: 记录日志到文件和窗口
procedure TfFormMain.DoWriteLog(const nEvent: string);
begin
  MemoLog.Lines.BeginUpdate;
  try
    MemoLog.Lines.Add(nEvent);
    if MemoLog.Lines.Count > 100 then
    begin
      while MemoLog.Lines.Count > 80 do
        MemoLog.Lines.Delete(0);
      //clear old event
    end;
  finally
    MemoLog.Lines.EndUpdate;
  end;

  MemoLog.SelLength := 0;
  MemoLog.SelStart := MemoLog.GetTextLen;
  //move to last line
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
  if GetOPCServer(gOPC.OPCServer) then
    gOPC.OPCServer.Active := True;
  //xxxxx
end;

//Desc: 断开服务器
procedure TfFormMain.BtnDisconnClick(Sender: TObject);
begin
  gOPC.OPCServer.Active := False;
end;

//Date: 2023-03-12
//Parm: 服务
//Desc: nServer的描述信息
function OPCServerInfo: string;
var nStr: string;
    nState: tServerStateRec;
begin
  with gOPC.OPCServer do
  begin
    if Protocol = coXML then
         nStr := 'XML'
    else nStr := 'COM';

    Result := '主机:[%s] 服务:[%s] 协议:[%s] ';
    Result := Format(Result, [ComputerName, ServerName, nStr]);

    if Active then
    begin
      nState := GetState;
      nStr := '版本:[%s] 提供商:[%s]';
      Result := Result + Format(nStr, [nState.Version, nState.VendorInfo]);
    end;
  end;
end;

procedure TfFormMain.OPCServerConnect(Sender: TObject);
begin
  WriteLog('连接成功! ' + OPCServerInfo);
  BtnFreshPath.Click();
end;

procedure TfFormMain.OPCServerDisconnect(Sender: TObject);
begin
  WriteLog('服务断开! ' + OPCServerInfo);
end;

procedure TfFormMain.OPCServerServerShutdown(Sender: TObject; Reason: string);
begin
  WriteLog('服务关闭! ' + OPCServerInfo);
end;

//Desc: 控制哪些项出现在路径列表中
procedure TfFormMain.PMenuPathPopup(Sender: TObject);
begin
  BtnFreshPath.Enabled := gOPC.OPCServer.Active;
  BtnCanSys.Down := gOPC.ServerInfo.FAcessSystem;
  BtnCanRead.Down := opcReadable in gOPC.ServerInfo.FAcesstype;
  BtnCanWrite.Down := opcWritable in gOPC.ServerInfo.FAcesstype;
end;

//Desc: 同步控制项
procedure TfFormMain.BtnCanReadClick(Sender: TObject);
begin
  with gOPC.ServerInfo do
  begin
    FAcessSystem := BtnCanSys.Down;
    if BtnCanRead.Down then
         FAcesstype := FAcesstype + [opcReadable]
    else FAcesstype := FAcesstype - [opcReadable];

    if BtnCanWrite.Down then
         FAcesstype := FAcesstype + [opcWritable]
    else FAcesstype := FAcesstype - [opcWritable];
  end;
end;

//Desc: 展开收起
procedure TfFormMain.BtnExpandClick(Sender: TObject);
begin
  if Sender = BtnExpand then
       TreePath.FullExpand
  else TreePath.FullCollapse;
end;

//Desc: 构建路径树
procedure TfFormMain.BtnFreshPathClick(Sender: TObject);
var nList: TStrings;
    nTemp: TTreeNode;
begin
  nList := TStringList.Create;
  try
    nTemp := TreePath.Items.GetFirstNode;
    while Assigned(nTemp) do
    begin
      if nTemp.Expanded and Assigned(nTemp.Data) then
        nList.Add(TdOPCBrowseItem(nTemp.Data).ItemId);
      nTemp := nTemp.GetNext;
    end;

    gOPC.MakeItemsTree(TreePath,
      procedure (const nItem: TdOPCBrowseItem; const nNode: TTreeNode)
      begin
        if Assigned(nItem) then
        begin
          nNode.ImageIndex := 16;
          nNode.SelectedIndex := 17;
        end else
        begin
          nNode.ImageIndex := 4;
          nNode.SelectedIndex := 4;
        end;
      end);
    //xxxxx

    nTemp := TreePath.Items.GetFirstNode;
    if Assigned(nTemp) then
      nTemp.Expand(False);
    //xxxxx

    while Assigned(nTemp) do
    begin
      if nTemp.HasChildren and Assigned(nTemp.Data) and
         (nList.IndexOf(TdOPCBrowseItem(nTemp.Data).ItemId) >= 0) then
        nTemp.Expanded := True;
      nTemp := nTemp.GetNext;
    end;
  finally
    nList.Free;
  end;
end;

//Desc: 显示选中Path下的item
procedure TfFormMain.TreePathChange(Sender: TObject; Node: TTreeNode);
begin
  if (Node = nil) or (Node.Data = nil) then Exit;
  //invalid node

  gOPC.MakeItemsList(TdOPCBrowseItem(Node.Data), ListItems,
    procedure (const nItem: TdOPCBrowseItem; const nNode: TListItem)
    begin
      if gOPC.PointExists(nItem.ItemId) then
           nNode.ImageIndex := 23
      else nNode.ImageIndex := 22;
    end);
end;

end.
