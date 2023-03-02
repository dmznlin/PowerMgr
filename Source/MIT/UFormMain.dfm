object fFormMain: TfFormMain
  Left = 0
  Top = 0
  Caption = #25968#25454#28857#20301#32534#36753#22120
  ClientHeight = 400
  ClientWidth = 601
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
  object wPage1: TcxPageControl
    Left = 0
    Top = 48
    Width = 601
    Height = 332
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = SheetSrv
    Properties.CustomButtons.Buttons = <>
    Properties.Images = FDM.ImgSmall
    Properties.Style = 11
    Properties.TabPosition = tpBottom
    ExplicitTop = 42
    ClientRectBottom = 309
    ClientRectLeft = 2
    ClientRectRight = 599
    ClientRectTop = 2
    object SheetSrv: TcxTabSheet
      Caption = #26381#21153#22120
      ImageIndex = 4
      object cxSplitter1: TcxSplitter
        Left = 185
        Top = 0
        Width = 8
        Height = 307
        HotZoneClassName = 'TcxSimpleStyle'
        Control = GroupPath
      end
      object GroupPath: TcxGroupBox
        Left = 0
        Top = 0
        Align = alLeft
        Caption = #36335#24452
        ParentFont = False
        Style.BorderStyle = ebsNone
        TabOrder = 1
        ExplicitHeight = 298
        Height = 307
        Width = 185
        object TreePath: TcxTreeView
          Left = 2
          Top = 18
          Width = 181
          Height = 287
          Align = alClient
          ParentFont = False
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
      object GroupPoint: TcxGroupBox
        Left = 193
        Top = 0
        Align = alClient
        Caption = #28857#20301#21015#34920
        ParentFont = False
        Style.BorderStyle = ebsNone
        TabOrder = 2
        ExplicitLeft = 191
        ExplicitWidth = 402
        ExplicitHeight = 298
        Height = 307
        Width = 404
        object ListItems: TcxListView
          Left = 2
          Top = 18
          Width = 400
          Height = 287
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
          ParentFont = False
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
    object SheetPoint: TcxTabSheet
      Caption = #28857#20301#37197#32622
      ImageIndex = 7
    end
  end
  object SBar1: TdxStatusBar
    Left = 0
    Top = 380
    Width = 601
    Height = 20
    Panels = <>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
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
      'other')
    Categories.ItemsVisibles = (
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True)
    ImageOptions.Images = FDM.ImgSmall
    ImageOptions.LargeImages = FDM.ImgSmall
    NotDocking = [dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 26
    Top = 98
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
          ItemName = 'dxBarButton4'
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
          ItemName = 'dxBarButton4'
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
    end
    object dxBarButton4: TdxBarButton
      Caption = #26029#24320#26381#21153
      Category = 0
      Hint = #26029#24320#26381#21153
      Visible = ivAlways
      ImageIndex = 3
      LargeImageIndex = 3
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
      OnClick = BtnDelPointClick
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
  end
end
