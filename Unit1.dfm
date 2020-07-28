object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Write Together!'
  ClientHeight = 536
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 667
    Height = 517
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1043#1083#1072#1074#1085#1072#1103
      object Splitter1: TSplitter
        Left = 0
        Top = 282
        Width = 659
        Height = 6
        Cursor = crVSplit
        Align = alBottom
        ExplicitLeft = 2
        ExplicitTop = 280
        ExplicitWidth = 655
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 659
        Height = 282
        Align = alClient
        Caption = #1055#1086#1083#1085#1099#1081' '#1090#1077#1082#1089#1090
        TabOrder = 0
        object Memo1: TMemo
          Left = 2
          Top = 15
          Width = 655
          Height = 265
          Align = alClient
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          Lines.Strings = (
            'Memo1')
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          WantTabs = True
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 288
        Width = 659
        Height = 201
        Align = alBottom
        Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1090#1077#1082#1089#1090
        TabOrder = 1
        object Panel1: TPanel
          Left = 2
          Top = 158
          Width = 655
          Height = 41
          Align = alBottom
          TabOrder = 0
          DesignSize = (
            655
            41)
          object Button1: TButton
            Left = 296
            Top = 8
            Width = 75
            Height = 25
            Anchors = [akTop]
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            ImageIndex = 0
            TabOrder = 0
            OnClick = Button1Click
          end
          object CheckBox1: TCheckBox
            Left = 472
            Top = 13
            Width = 169
            Height = 17
            Anchors = [akTop]
            Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1089#1083#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object Memo2: TMemo
          Left = 2
          Top = 15
          Width = 655
          Height = 143
          Align = alClient
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = []
          Lines.Strings = (
            'Memo1')
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
          WantTabs = True
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 517
    Width = 667
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    Left = 608
    Top = 56
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N2Click
      end
    end
  end
end
