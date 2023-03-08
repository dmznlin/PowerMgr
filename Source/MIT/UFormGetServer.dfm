object fFormGetServer: TfFormGetServer
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #26381#21153#22120
  ClientHeight = 417
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    361
    417)
  PixelsPerInch = 96
  TextHeight = 12
  object wPage: TcxPageControl
    Left = 8
    Top = 8
    Width = 348
    Height = 368
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Properties.ActivePage = SheetXML
    Properties.CustomButtons.Buttons = <>
    OnPageChanging = wPagePageChanging
    ExplicitWidth = 365
    ExplicitHeight = 321
    ClientRectBottom = 368
    ClientRectRight = 348
    ClientRectTop = 23
    object SheetCOM: TcxTabSheet
      Caption = ' COM '
      ImageIndex = 0
      ExplicitWidth = 289
      ExplicitHeight = 170
      object PanelHost: TcxGroupBox
        Left = 0
        Top = 0
        Align = alTop
        Caption = #20027#26426#21015#34920
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 11
        ExplicitWidth = 350
        DesignSize = (
          348
          62)
        Height = 62
        Width = 348
        object EditHosts: TcxComboBox
          Left = 10
          Top = 25
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.OnInitPopup = EditHostsPropertiesInitPopup
          TabOrder = 0
          Width = 256
        end
        object BtnRefresh: TcxButton
          Left = 270
          Top = 24
          Width = 65
          Height = 22
          Anchors = [akRight]
          Caption = #21047#26032
          TabOrder = 1
          OnClick = BtnRefreshClick
        end
      end
      object PanelServers: TcxGroupBox
        Left = 0
        Top = 62
        Align = alClient
        Caption = #26381#21153#21015#34920
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 5
        ExplicitTop = 79
        ExplicitWidth = 350
        ExplicitHeight = 212
        Height = 203
        Width = 348
        object ListServer: TcxListBox
          Left = 2
          Top = 18
          Width = 344
          Height = 183
          Align = alClient
          ItemHeight = 22
          ListStyle = lbOwnerDrawFixed
          ParentFont = False
          TabOrder = 0
          OnClick = ListServerClick
          ExplicitLeft = 64
          ExplicitTop = 72
          ExplicitWidth = 121
          ExplicitHeight = 97
        end
      end
      object PanelInfo: TcxGroupBox
        Left = 0
        Top = 265
        Align = alBottom
        Caption = #35814#32454#20449#24687
        ParentFont = False
        TabOrder = 2
        ExplicitTop = 275
        DesignSize = (
          348
          80)
        Height = 80
        Width = 348
        object cxLabel1: TcxLabel
          Left = 10
          Top = 25
          Caption = #21517#31216':'
          ParentFont = False
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 10
          Top = 50
          Caption = #26631#35782':'
          ParentFont = False
          Transparent = True
        end
        object EditName: TcxTextEdit
          Left = 50
          Top = 23
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ReadOnly = True
          TabOrder = 2
          Width = 285
        end
        object EditID: TcxTextEdit
          Left = 50
          Top = 48
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ReadOnly = True
          TabOrder = 3
          Width = 285
        end
      end
    end
    object SheetXML: TcxTabSheet
      Caption = ' XML '
      ImageIndex = 1
      ExplicitWidth = 289
      ExplicitHeight = 170
      object cxGroupBox1: TcxGroupBox
        Left = 0
        Top = 0
        Align = alClient
        Caption = #35814#32454#20449#24687
        ParentFont = False
        TabOrder = 0
        ExplicitHeight = 125
        DesignSize = (
          348
          345)
        Height = 345
        Width = 348
        object cxLabel3: TcxLabel
          Left = 10
          Top = 25
          Caption = ' URL:'
          ParentFont = False
          Transparent = True
        end
        object cxLabel4: TcxLabel
          Left = 10
          Top = 50
          Caption = #20195#29702':'
          ParentFont = False
          Transparent = True
        end
        object EditURL: TcxTextEdit
          Left = 50
          Top = 23
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ReadOnly = False
          TabOrder = 2
          Text = 'http://localhost:80/opcxmlda/servername'
          Width = 285
        end
        object EditProxy: TcxTextEdit
          Left = 50
          Top = 48
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ReadOnly = False
          TabOrder = 3
          Width = 285
        end
        object cxLabel5: TcxLabel
          Left = 10
          Top = 74
          Caption = #29992#25143':'
          ParentFont = False
          Transparent = True
        end
        object cxLabel6: TcxLabel
          Left = 10
          Top = 99
          Caption = #23494#30721':'
          ParentFont = False
          Transparent = True
        end
        object EditUser: TcxTextEdit
          Left = 50
          Top = 72
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ReadOnly = False
          TabOrder = 6
          Width = 285
        end
        object EditPass: TcxTextEdit
          Left = 50
          Top = 97
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.ReadOnly = False
          TabOrder = 7
          Width = 285
        end
      end
    end
  end
  object BtnOK: TcxButton
    Left = 200
    Top = 384
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #30830#23450
    TabOrder = 1
    OnClick = BtnOKClick
    ExplicitLeft = 217
    ExplicitTop = 337
  end
  object BtnExit: TcxButton
    Left = 281
    Top = 384
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
    ExplicitLeft = 298
    ExplicitTop = 337
  end
end
