object fFormMain: TfFormMain
  Left = 0
  Top = 0
  Caption = #25968#25454#28857#20301#32534#36753#22120
  ClientHeight = 500
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object SBar1: TdxStatusBar
    Left = 0
    Top = 480
    Width = 710
    Height = 20
    Panels = <>
    PaintStyle = stpsUseLookAndFeel
    SimplePanelStyle.Active = True
    ParentFont = True
  end
  object PanelMain: TcxGroupBox
    Left = 0
    Top = 48
    Align = alClient
    Ctl3D = True
    PanelStyle.Active = True
    PanelStyle.BorderWidth = 1
    PanelStyle.OfficeBackgroundKind = pobkStyleColor
    ParentCtl3D = False
    Style.BorderStyle = ebsNone
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    TabOrder = 5
    Transparent = True
    Height = 432
    Width = 710
    object Splitter2: TcxSplitter
      Left = 3
      Top = 316
      Width = 704
      Height = 8
      AlignSplitter = salBottom
      Control = PanelInfo
    end
    object PanelInfo: TcxGroupBox
      Left = 3
      Top = 324
      Align = alBottom
      Caption = #36816#34892#26085#24535
      Style.BorderStyle = ebsNone
      TabOrder = 1
      Height = 105
      Width = 704
      object MemoLog: TcxMemo
        Left = 2
        Top = 17
        Align = alClient
        Properties.ScrollBars = ssVertical
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 0
        Height = 86
        Width = 700
      end
    end
    object wPage1: TcxPageControl
      Left = 3
      Top = 3
      Width = 704
      Height = 313
      Align = alClient
      TabOrder = 2
      Properties.ActivePage = SheetPoint
      Properties.CustomButtons.Buttons = <>
      Properties.Images = FDM.ImgSmall
      Properties.Style = 11
      ClientRectBottom = 311
      ClientRectLeft = 2
      ClientRectRight = 702
      ClientRectTop = 23
      object SheetSrv: TcxTabSheet
        Caption = #26381#21153#22120
        ImageIndex = 4
        object Splitter1: TcxSplitter
          Left = 185
          Top = 0
          Width = 8
          Height = 288
          Control = PanelPath
        end
        object PanelPath: TcxGroupBox
          Left = 0
          Top = 0
          Align = alLeft
          Caption = #36335#24452
          ParentBackground = False
          Style.BorderStyle = ebsNone
          TabOrder = 1
          Height = 288
          Width = 185
          object TreePath: TcxTreeView
            Left = 2
            Top = 17
            Width = 181
            Height = 269
            Align = alClient
            PopupMenu = PMenuPath
            Style.BorderStyle = cbsNone
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            StyleFocused.BorderStyle = cbsNone
            StyleHot.BorderStyle = cbsNone
            TabOrder = 0
            Images = FDM.ImgSmall
            Items.NodeData = {
              0301000000240000000000000000000000FFFFFFFFFFFFFFFF00000000000000
              00010000000103310031003100220000000000000000000000FFFFFFFFFFFFFF
              FF000000000000000000000000010232003200}
            ReadOnly = True
            RowSelect = True
            OnChange = TreePathChange
            OnDeletion = TreePathDeletion
          end
        end
        object PanelPoint: TcxGroupBox
          Left = 193
          Top = 0
          Align = alClient
          Caption = #28857#20301#21015#34920
          Style.BorderStyle = ebsNone
          TabOrder = 2
          Height = 288
          Width = 507
          object ListItems: TcxListView
            Left = 2
            Top = 17
            Width = 503
            Height = 269
            Align = alClient
            Columns = <
              item
                Caption = #21517#31216
                Width = 120
              end
              item
                Caption = #26631#35782
                Width = 200
              end>
            Items.ItemData = {
              054E0000000100000000000000FFFFFFFFFFFFFFFF04000000FFFFFFFF000000
              0002320031000232003200189EE002023200320030A6E0020332003200320040
              41632403320032003200B0416324FFFFFFFFFFFFFFFF}
            MultiSelect = True
            ReadOnly = True
            RowSelect = True
            SmallImages = FDM.ImgSmall
            Style.BorderStyle = cbsNone
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            StyleFocused.BorderStyle = cbsNone
            StyleHot.BorderStyle = cbsNone
            TabOrder = 0
            ViewStyle = vsReport
            OnDeletion = ListItemsDeletion
          end
        end
      end
      object SheetPoint: TcxTabSheet
        Caption = #28857#20301#37197#32622
        ImageIndex = 7
        object PanelGroup: TcxGroupBox
          Left = 0
          Top = 0
          Align = alLeft
          Caption = #20998#32452
          Style.BorderStyle = ebsNone
          TabOrder = 0
          Height = 288
          Width = 185
          object TreeGroup: TcxTreeView
            Left = 2
            Top = 17
            Width = 181
            Height = 269
            Align = alClient
            Style.BorderStyle = cbsNone
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            StyleFocused.BorderStyle = cbsNone
            StyleHot.BorderStyle = cbsNone
            TabOrder = 0
            Items.NodeData = {
              0301000000240000000000000000000000FFFFFFFFFFFFFFFF00000000000000
              00090000000103310031003100220000000000000000000000FFFFFFFFFFFFFF
              FF000000000000000000000000010232003200220000000000000000000000FF
              FFFFFFFFFFFFFF00000000000000000000000001023200320020000000000000
              0000000000FFFFFFFFFFFFFFFF00000000000000000000000001013200220000
              000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010232
              003200200000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
              00000001013200200000000000000000000000FFFFFFFFFFFFFFFF0000000000
              00000000000000010132001E0000000000000000000000FFFFFFFFFFFFFFFF00
              000000000000000000000001001E0000000000000000000000FFFFFFFFFFFFFF
              FF0000000000000000000000000100220000000000000000000000FFFFFFFFFF
              FFFFFF000000000000000000000000010232003200}
            RowSelect = True
          end
        end
        object cxSplitter1: TcxSplitter
          Left = 185
          Top = 0
          Width = 8
          Height = 288
          HotZoneClassName = 'TcxSimpleStyle'
          Control = PanelGroup
        end
        object cxGroupBox2: TcxGroupBox
          Left = 193
          Top = 0
          Align = alClient
          Caption = #28857#20301#21015#34920
          Style.BorderStyle = ebsNone
          TabOrder = 2
          Height = 288
          Width = 507
          object ListPoint: TcxListView
            Left = 2
            Top = 17
            Width = 503
            Height = 269
            Align = alClient
            Columns = <
              item
              end
              item
              end
              item
              end>
            Items.ItemData = {
              056C0000000200000000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000
              00023100310000000000FFFFFFFFFFFFFFFF04000000FFFFFFFF000000000232
              0031000232003200E871182B0232003200A091182B033200320032002893182B
              03320032003200884A182BFFFFFFFFFFFFFFFF}
            ReadOnly = True
            RowSelect = True
            Style.BorderStyle = cbsNone
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            StyleFocused.BorderStyle = cbsNone
            StyleHot.BorderStyle = cbsNone
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
      end
    end
  end
  object BarMgr1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Categories.Strings = (
      'file'
      'group'
      'about'
      'other'
      'PMenuPath')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True)
    ImageOptions.Images = FDM.ImgSmall
    ImageOptions.LargeImages = FDM.ImgSmall
    NotDocking = [dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 34
    Top = 399
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      48
      0)
    object BarMgr1Bar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = 'MMenu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 669
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem2'
        end>
      MultiLine = True
      NotDocking = [dsNone]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BarMgr1Bar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = 'MTools'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 22
      DockingStyle = dsTop
      FloatLeft = 669
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BtnOpen'
        end
        item
          Visible = True
          ItemName = 'BtnSave'
        end
        item
          Visible = True
          ItemName = 'BStatic1'
        end
        item
          Visible = True
          ItemName = 'BtnConn'
        end
        item
          Visible = True
          ItemName = 'BtnDisconn'
        end
        item
          Visible = True
          ItemName = 'BStatic1'
        end
        item
          Visible = True
          ItemName = 'BtnAddGroup'
        end
        item
          Visible = True
          ItemName = 'BtnDelGroup'
        end
        item
          Visible = True
          ItemName = 'BtnDelPoint'
        end
        item
          Visible = True
          ItemName = 'BStatic1'
        end
        item
          Visible = True
          ItemName = 'BtnExit'
        end>
      NotDocking = [dsNone]
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = #25991#20214
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BtnOpen'
        end
        item
          Visible = True
          ItemName = 'BtnSave'
        end
        item
          Visible = True
          ItemName = 'BarS1'
        end
        item
          Visible = True
          ItemName = 'BtnConn'
        end
        item
          Visible = True
          ItemName = 'BtnDisconn'
        end
        item
          Visible = True
          ItemName = 'BarS1'
        end
        item
          Visible = True
          ItemName = 'BtnExit'
        end>
    end
    object BtnOpen: TdxBarButton
      Caption = #25171#24320#37197#32622
      Category = 0
      Hint = #25171#24320#37197#32622
      Visible = ivAlways
      ImageIndex = 5
      LargeImageIndex = 5
    end
    object BtnSave: TdxBarButton
      Caption = #20445#23384#37197#32622
      Category = 0
      Hint = #20445#23384#37197#32622
      Visible = ivAlways
      ImageIndex = 6
      LargeImageIndex = 6
    end
    object BtnConn: TdxBarButton
      Caption = #36830#25509#26381#21153
      Category = 0
      Hint = #36830#25509#26381#21153
      Visible = ivAlways
      ImageIndex = 2
      LargeImageIndex = 2
      OnClick = BtnConnClick
    end
    object BtnDisconn: TdxBarButton
      Caption = #26029#24320#26381#21153
      Category = 0
      Hint = #26029#24320#26381#21153
      Visible = ivAlways
      ImageIndex = 3
      LargeImageIndex = 3
      OnClick = BtnDisconnClick
    end
    object BtnExit: TdxBarButton
      Caption = #36864#20986
      Category = 0
      Hint = #36864#20986
      Visible = ivAlways
      ImageIndex = 9
      LargeImageIndex = 9
      PaintStyle = psCaptionGlyph
      OnClick = BtnExitClick
    end
    object BtnAddGroup: TdxBarButton
      Caption = #28155#21152#20998#32452
      Category = 1
      Hint = #28155#21152#20998#32452
      Visible = ivAlways
      ImageIndex = 12
      LargeImageIndex = 12
      PaintStyle = psCaptionGlyph
    end
    object BtnDelGroup: TdxBarButton
      Caption = #21024#38500#20998#32452
      Category = 1
      Hint = #21024#38500#20998#32452
      Visible = ivAlways
      ImageIndex = 13
      LargeImageIndex = 13
      PaintStyle = psCaptionGlyph
    end
    object BtnDelPoint: TdxBarButton
      Caption = #21024#38500#28857#20301
      Category = 1
      Hint = #21024#38500#28857#20301
      Visible = ivAlways
      ImageIndex = 15
      LargeImageIndex = 15
      PaintStyle = psCaptionGlyph
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = #20851#20110
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'BtnAboutMe'
        end
        item
          Visible = True
          ItemName = 'BarS1'
        end
        item
          Visible = True
          ItemName = 'BtnAboutPwd'
        end>
    end
    object BtnAboutMe: TdxBarButton
      Caption = #26412#36719#20214
      Category = 2
      Hint = #26412#36719#20214
      Visible = ivAlways
      ImageIndex = 10
      LargeImageIndex = 10
    end
    object BtnAboutPwd: TdxBarButton
      Caption = #21160#24577#23494#30721
      Category = 2
      Hint = #21160#24577#23494#30721
      Visible = ivAlways
      ImageIndex = 11
      LargeImageIndex = 11
    end
    object BarS1: TdxBarSeparator
      Category = 3
      Visible = ivAlways
      ShowCaption = False
    end
    object BStatic1: TdxBarStatic
      Caption = '|'
      Category = 3
      Hint = '|'
      Visible = ivAlways
    end
    object BtnCanRead: TdxBarButton
      Caption = #21487#35835'(Read)'
      Category = 4
      Visible = ivAlways
      ButtonStyle = bsChecked
      CloseSubMenuOnClick = False
      Down = True
      OnClick = BtnCanReadClick
    end
    object BtnCanWrite: TdxBarButton
      Caption = #21487#20889'(Write)'
      Category = 4
      Visible = ivAlways
      ButtonStyle = bsChecked
      CloseSubMenuOnClick = False
      Down = True
      OnClick = BtnCanReadClick
    end
    object BtnCanSys: TdxBarButton
      Caption = #31995#32479'(_System)'
      Category = 4
      Visible = ivAlways
      ButtonStyle = bsChecked
      CloseSubMenuOnClick = False
      Down = True
      OnClick = BtnCanReadClick
    end
    object BtnFreshPath: TdxBarButton
      Caption = #21047#26032#21015#34920
      Category = 4
      Hint = #21047#26032#21015#34920
      Visible = ivAlways
      ImageIndex = 21
      OnClick = BtnFreshPathClick
    end
    object BtnExpand: TdxBarButton
      Caption = #20840#37096#23637#24320
      Category = 4
      Hint = #20840#37096#23637#24320
      Visible = ivAlways
      ImageIndex = 19
      OnClick = BtnExpandClick
    end
    object BtnCollapse: TdxBarButton
      Caption = #20840#37096#25910#36215
      Category = 4
      Hint = #20840#37096#25910#36215
      Visible = ivAlways
      ImageIndex = 20
      OnClick = BtnExpandClick
    end
  end
  object OPCServer: TdOPCServer
    Active = False
    ClientName = 'dOPC DA Client'
    KeepAlive = 0
    Version = '4.37'
    OnServerShutdown = OPCServerServerShutdown
    OnConnect = OPCServerConnect
    OnDisconnect = OPCServerDisconnect
    Protocol = coCOM
    Params.Strings = (
      'xml-user='
      'xml-pass='
      'xml-proxy=')
    OPCGroups = <>
    OPCGroupDefault.IsActive = True
    OPCGroupDefault.UpdateRate = 1000
    OPCGroupDefault.LocaleId = 0
    OPCGroupDefault.TimeBias = 0
    ConnectDelay = 300
    Left = 83
    Top = 399
  end
  object PMenuPath: TdxBarPopupMenu
    BarManager = BarMgr1
    Images = FDM.ImgSmall
    ItemLinks = <
      item
        Visible = True
        ItemName = 'BtnExpand'
      end
      item
        Visible = True
        ItemName = 'BtnCollapse'
      end
      item
        Visible = True
        ItemName = 'BarS1'
      end
      item
        Visible = True
        ItemName = 'BtnFreshPath'
      end
      item
        Visible = True
        ItemName = 'BarS1'
      end
      item
        Visible = True
        ItemName = 'BtnCanRead'
      end
      item
        Visible = True
        ItemName = 'BtnCanWrite'
      end
      item
        Visible = True
        ItemName = 'BtnCanSys'
      end>
    UseOwnFont = False
    OnPopup = PMenuPathPopup
    Left = 138
    Top = 399
    PixelsPerInch = 96
  end
end
