﻿object Form9: TForm9
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 208
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object CategoryPanelGroup1: TCategoryPanelGroup
    Left = 0
    Top = 0
    Width = 422
    Height = 208
    VertScrollBar.Tracking = True
    Align = alClient
    Color = clSilver
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    TabOrder = 0
    object Общее: TCategoryPanel
      AlignWithMargins = True
      Top = 3
      Caption = #1054#1073#1097#1077#1077
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 16
        Top = 16
        Width = 105
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1079#1074#1091#1082#1080
        Checked = True
        DoubleBuffered = True
        ParentDoubleBuffered = False
        State = cbChecked
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 16
        Top = 39
        Width = 257
        Height = 17
        Caption = #1053#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1079#1085#1072#1095#1086#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1103' '#1086#1073#1097#1077#1075#1086' '#1095#1072#1090#1072
        TabOrder = 1
      end
      object CheckBox4: TCheckBox
        Left = 16
        Top = 62
        Width = 185
        Height = 17
        Caption = #1042#1077#1089#1090#1080' '#1083#1086#1075' ('#1076#1083#1103' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1086#1074')'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object Button1: TButton
        Left = 160
        Top = 136
        Width = 75
        Height = 25
        Caption = #1043#1086#1090#1086#1074#1086
        TabOrder = 3
        OnClick = Button1Click
      end
    end
  end
end
