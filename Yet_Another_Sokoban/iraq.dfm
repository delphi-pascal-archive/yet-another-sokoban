object Form1: TForm1
  Left = 216
  Top = 128
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Yet Another Sokoban'
  ClientHeight = 465
  ClientWidth = 827
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 616
    Top = 2
    Width = 201
    Height = 127
    Caption = ' '#1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' '
    TabOrder = 2
    object Label1: TLabel
      Left = 89
      Top = 30
      Width = 17
      Height = 20
      Caption = #1080#1079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object nowlev: TLabel
      Left = 138
      Top = 59
      Width = 17
      Height = 53
      Caption = '1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -38
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 79
      Width = 91
      Height = 25
      Caption = #1059#1088#1086#1074#1077#1085#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object found: TStaticText
      Left = 10
      Top = 30
      Width = 60
      Height = 24
      AutoSize = False
      BevelKind = bkFlat
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object must: TStaticText
      Left = 128
      Top = 30
      Width = 60
      Height = 24
      AutoSize = False
      BevelKind = bkFlat
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 723
    Top = 220
    Width = 94
    Height = 30
    Caption = #1042#1067#1061#1054#1044
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 616
    Top = 220
    Width = 93
    Height = 30
    Caption = #1057#1058#1040#1056#1058
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    OnClick = Button2Click
  end
  object dg: TDrawGrid
    Left = 8
    Top = 8
    Width = 601
    Height = 449
    BorderStyle = bsNone
    Color = clBlack
    ColCount = 20
    DefaultColWidth = 30
    DefaultRowHeight = 30
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 15
    FixedRows = 0
    GridLineWidth = 0
    Options = []
    ScrollBars = ssNone
    TabOrder = 3
    OnDrawCell = dgDrawCell
    OnKeyDown = FormKeyDown
    OnMouseDown = dgMouseDown
  end
  object Button3: TButton
    Left = 616
    Top = 261
    Width = 201
    Height = 31
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 616
    Top = 348
    Width = 105
    Height = 30
    Caption = #1055#1091#1089#1090#1086
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 728
    Top = 348
    Width = 89
    Height = 30
    Caption = #1057#1090#1077#1085#1072
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 616
    Top = 387
    Width = 105
    Height = 31
    Caption = #1063#1091#1074#1072#1082
    TabOrder = 7
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 728
    Top = 387
    Width = 89
    Height = 31
    Caption = #1071#1097#1080#1082
    TabOrder = 8
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 616
    Top = 426
    Width = 201
    Height = 31
    Caption = #1057#1082#1083#1072#1076
    TabOrder = 9
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 616
    Top = 300
    Width = 201
    Height = 31
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 10
    OnClick = Button9Click
  end
end
