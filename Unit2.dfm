object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 485
  ClientWidth = 999
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 25
    Width = 209
    Height = 440
    AutoSize = False
    WordWrap = True
  end
  object Button4: TButton
    Left = 624
    Top = 392
    Width = 75
    Height = 25
    Caption = #1057#1085#1072#1095#1072#1083#1072
    TabOrder = 0
    OnClick = Button4Click
  end
  object Panel1: TPanel
    Left = 256
    Top = 56
    Width = 43
    Height = 41
    Caption = '1'
    ParentBackground = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 344
    Top = 56
    Width = 43
    Height = 41
    Caption = '1'
    Color = clCream
    ParentBackground = False
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 440
    Top = 56
    Width = 43
    Height = 41
    Caption = '1'
    ParentBackground = False
    TabOrder = 3
  end
  object Panel4: TPanel
    Left = 536
    Top = 56
    Width = 43
    Height = 41
    Caption = '1'
    ParentBackground = False
    TabOrder = 4
  end
  object Panel5: TPanel
    Left = 624
    Top = 56
    Width = 43
    Height = 41
    Caption = '1'
    ParentBackground = False
    TabOrder = 5
  end
  object Panel6: TPanel
    Left = 264
    Top = 25
    Width = 9
    Height = 25
    Color = clYellow
    ParentBackground = False
    TabOrder = 6
    Visible = False
  end
  object Panel7: TPanel
    Left = 279
    Top = 25
    Width = 9
    Height = 25
    Color = clBlue
    ParentBackground = False
    TabOrder = 7
    Visible = False
  end
  object Panel8: TPanel
    Left = 352
    Top = 25
    Width = 9
    Height = 25
    Color = clYellow
    ParentBackground = False
    TabOrder = 8
    Visible = False
  end
  object Panel9: TPanel
    Left = 367
    Top = 25
    Width = 9
    Height = 25
    Color = clBlue
    ParentBackground = False
    TabOrder = 9
    Visible = False
  end
  object Panel10: TPanel
    Left = 448
    Top = 25
    Width = 9
    Height = 25
    Color = clYellow
    ParentBackground = False
    TabOrder = 10
    Visible = False
  end
  object Panel11: TPanel
    Left = 463
    Top = 25
    Width = 9
    Height = 25
    Color = clBlue
    ParentBackground = False
    TabOrder = 11
    Visible = False
  end
  object Panel12: TPanel
    Left = 544
    Top = 25
    Width = 9
    Height = 25
    Color = clYellow
    ParentBackground = False
    TabOrder = 12
    Visible = False
  end
  object Panel13: TPanel
    Left = 559
    Top = 25
    Width = 9
    Height = 25
    Color = clBlue
    ParentBackground = False
    TabOrder = 13
    Visible = False
  end
  object Panel14: TPanel
    Left = 632
    Top = 25
    Width = 9
    Height = 25
    Color = clYellow
    ParentBackground = False
    TabOrder = 14
    Visible = False
  end
  object Panel15: TPanel
    Left = 647
    Top = 25
    Width = 9
    Height = 25
    Color = clBlue
    ParentBackground = False
    TabOrder = 15
    Visible = False
  end
  object ScrollBar1: TScrollBar
    Left = 231
    Top = 25
    Width = 17
    Height = 440
    Kind = sbVertical
    PageSize = 0
    TabOrder = 16
    OnChange = ScrollBar1Change
  end
  object IdThreadComponent1: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smTerminate
    OnRun = IdThreadComponent1Run
    Left = 936
    Top = 432
  end
end
