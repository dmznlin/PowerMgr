{*******************************************************************************
  作者: dmzn@163.com 2023-03-08
  描述: 选择OPC Server
*******************************************************************************}
unit UFormGetServer;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Forms, dOPCIntf, dOPC,
  dOPCComn, dOPCIntfGen, dxBarBuiltInMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, Vcl.Menus, cxContainer,
  cxEdit, cxCustomListBox, cxListBox, cxTextEdit, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxGroupBox, Vcl.StdCtrls, cxButtons, cxPC, Vcl.Controls;

type
  TfFormGetServer = class(TForm)
    wPage: TcxPageControl;
    SheetCOM: TcxTabSheet;
    SheetXML: TcxTabSheet;
    BtnOK: TcxButton;
    BtnExit: TcxButton;
    PanelHost: TcxGroupBox;
    PanelServers: TcxGroupBox;
    EditHosts: TcxComboBox;
    BtnRefresh: TcxButton;
    PanelInfo: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    EditName: TcxTextEdit;
    EditID: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    EditURL: TcxTextEdit;
    EditProxy: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    EditUser: TcxTextEdit;
    EditPass: TcxTextEdit;
    ListServer: TcxListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnRefreshClick(Sender: TObject);
    procedure EditHostsPropertiesInitPopup(Sender: TObject);
    procedure ListServerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure wPagePageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
  private
    { Private declarations }
    FBrowser: TdOPCServerBrowser;
    FProtocol: tdOPCConnectionType;
    FLoadHosts: Boolean;
  public
    { Public declarations }
  end;

function GetOPCServer(nServer: TdOPCSvr; nType: tdopcServerSet = []): Boolean;
//入口函数

implementation

{$R *.dfm}

uses
  Winapi.Windows, UDataModule, UStyleModule, ULibFun;

//Date: 2023-03-08
//Parm: 服务类型
//Desc: 选择提供nType服务的OPC Server
function GetOPCServer(nServer: TdOPCSvr; nType: tdopcServerSet): Boolean;
begin
  if nType = [] then
    nType := [svr_DA10,svr_DA20,svr_DA30];
  //default type: DA

  with TfFormGetServer.Create(Application) do
  try
    if (svr_HDA10 in nType) or (svr_AE10 in nType) then
         SheetXML.TabVisible := False
    else SheetXML.TabVisible := True;

    if not IFSupportConnection(coXML) then
      SheetXML.TabVisible := False;
    if not IFSupportConnection(coCOM) then
      SheetCOM.TabVisible := False;
    //support type

    FProtocol := nServer.Protocol;
    FBrowser.Servertype := nType;
    //xxxxx

    if FProtocol = coCOM then
    begin
      wPage.ActivePage := SheetCOM;
      EditHosts.Text := nServer.ComputerName;
      EditName.Text := nServer.ServerCaption;
      EditID.Text := nServer.ServerClsId;
    end else
    begin
      wPage.ActivePage := SheetXML;
      if nServer.ServerName <> '' then
        EditURL.Text := nServer.ServerName;
      //xxxxx

      EditName.Text := '';
      EditID.Text := '';
    end;

    EditUser.Text  := nServer.Params.Values['xml-user'];
    EditPass.Text  := nServer.Params.Values['xml-pass'];
    EditProxy.Text := nServer.Params.Values['xml-proxy'];

    Result := ShowModal = mrOk;
    if Result then
    begin
      nServer.Active := False;
      nServer.ComputerName  := EditHosts.Text;
      nServer.Protocol  := FProtocol;

      if FProtocol = coCOM then
           nServer.ServerName := EditID.Text
      else nServer.ServerName := EditURL.Text;

      nServer.Params.Values['xml-user'] := EditUser.Text;
      nServer.Params.Values['xml-pass'] := EditPass.Text;
      nServer.Params.Values['xml-proxy']:= EditProxy.Text;

      with gOPC.ServerInfo do
      begin
        FComputerName := EditHosts.Text;
        FServerName   := EditName.Text;
        FClassID      := EditID.Text;
        FURL          := EditURL.Text;
        FParams       := nServer.Params.Text;
        FProtocol     := FProtocol;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfFormGetServer.FormCreate(Sender: TObject);
begin
  FLoadHosts := False;
  FBrowser := TdOPCServerBrowser.Create(nil);
  TApplicationHelper.LoadFormConfig(Self);
end;

procedure TfFormGetServer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TApplicationHelper.SaveFormConfig(Self);
  FBrowser.Free;
end;

procedure TfFormGetServer.FormShow(Sender: TObject);
begin
  BtnRefreshClick(nil);
  ActiveControl := BtnOK;
end;

procedure TfFormGetServer.BtnRefreshClick(Sender: TObject);
var nCursor : TCursor;
begin
  ListServer.Items.Clear;
  if not SheetCOM.TabVisible then Exit;

  nCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    with FBrowser do
    begin
      ComputerName := EditHosts.Text;
      Execute(False);
      GetServerCaptions(ListServer.Items);
    end;

    if ListServer.Items.Count > 0 then
    begin
      ListServer.ItemIndex := -1;
      if EditName.Text <> '' then
        ListServer.ItemIndex := FBrowser.FindServer(EditName.Text);
      //xxxxx

      if (ListServer.ItemIndex < 0) and (EditID.Text <> '') then
        ListServer.ItemIndex := FBrowser.FindServer(EditID.Text);
      //xxxxx

      if ListServer.ItemIndex < 0 then
        ListServer.ItemIndex := 0;
      //default
    end;
  finally
    ListServerClick(nil);
    Screen.Cursor := nCursor;
  end;
end;

procedure TfFormGetServer.ListServerClick(Sender: TObject);
var nIdx: Integer;
begin
  nIdx := ListServer.ItemIndex;
  if nIdx >= 0 then
  begin
    EditName.Text := FBrowser[nIdx].ServerName;
    EditID.Text := FBrowser[nIdx].ServerClsId;
  end;
end;

procedure GetComputerNames(ServerList: TStrings);
var Enum: THandle;
    Count, BufferSize: DWORD;
    Buffer: array[0..16384 div SizeOf(TNetResource)] of TNetResource;
    i: Integer;
begin
  ServerList.Clear;
  if WNetOpenEnum(5, RESOURCETYPE_ANY, 0, nil, Enum) = NO_ERROR then
  try
   Count := $FFFFFFFF;
   BufferSize := SizeOf(Buffer);
   while WNetEnumResource(Enum, Count, @Buffer, BufferSize) = NO_ERROR do
     for i := 0 to Count - 1 do
     begin
       if Buffer[i].dwDisplayType = RESOURCEDISPLAYTYPE_SERVER then
         ServerList.Add(Buffer[i].lpRemotename);
     end;
  finally
   WNetCloseEnum(Enum);
  end;
end;


procedure TfFormGetServer.EditHostsPropertiesInitPopup(Sender: TObject);
var nCursor: TCursor;
begin
  if FLoadHosts then Exit;
  FLoadHosts := True;
  nCursor := Screen.Cursor;

  Screen.Cursor := crHourGlass;
  try
    GetComputerNames(EditHosts.Properties.Items);
  except
    //ignor any error
  end;

  Screen.Cursor := nCursor;
end;

procedure TfFormGetServer.wPagePageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if NewPage = SheetCOM then
    FProtocol := coCOM;
  if NewPage = SheetXML then
    FProtocol := coXML;
  //swtich protocol
end;

procedure TfFormGetServer.BtnOKClick(Sender: TObject);
var nHost,nPath: string;
    nPos: Integer;
begin
  if FProtocol = coCOM then
  begin
    if (EditName.Text = '') and (EditID.Text = '') then
    begin
      FSM.ShowMsg('请在"服务列表"中选择有效的项');
      Exit;
    end
  end else

  if FProtocol = coXML then
  begin
    EditURL.Text := Trim(EditURL.Text);
    nPos := Pos('//', EditURL.Text);
    //url: http://host:port/path

    if nPos < 3 then
    begin
      FSM.ShowMsg('请填写有效的URL地址');
      Exit;
    end;

    nHost := EditURL.Text;
    System.Delete(nHost, 1, nPos+1);
    nPath := nHost;

    nPos := Pos('/', nHost);
    if nPos > 0 then
    begin
      nHost := Copy(nHost, 1, nPos-1);
      System.Delete(nPath, 1, nPos);
    end;

    nPos := Pos(':', nHost);
    if nPos > 0 then
      nHost := Copy(nHost, 1, nPos-1);
    //delete port

    EditHosts.Text := nHost;
    EditName.Text := nHost;
    EditID.Text := nPath;
  end;

  ModalResult := mrOk;
end;

end.
