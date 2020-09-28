object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Sistema'
  ClientHeight = 380
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object headerBottom: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 337
    Width = 719
    Height = 40
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    Color = 13224393
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 333
    ExplicitWidth = 734
    object Label1: TLabel
      Left = -2
      Top = 6
      Width = 121
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'LOGO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object panelButtons: TPanel
      AlignWithMargins = True
      Left = 476
      Top = 3
      Width = 236
      Height = 30
      Align = alRight
      BevelOuter = bvNone
      Color = 13224393
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitHeight = 26
      object btnUpdate: TButton
        Left = 161
        Top = 0
        Width = 75
        Height = 30
        Align = alRight
        Caption = 'Detalhes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnUpdateClick
        ExplicitHeight = 26
      end
      object btnAdd: TButton
        Left = 86
        Top = 0
        Width = 75
        Height = 30
        Align = alRight
        Caption = 'Adicionar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnAddClick
        ExplicitLeft = 80
        ExplicitHeight = 662
      end
    end
  end
  object mainBody: TPanel
    Left = 137
    Top = 0
    Width = 588
    Height = 334
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 132
    ExplicitWidth = 609
    ExplicitHeight = 319
    object panelSeach: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 578
      Height = 52
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alTop
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = 15395562
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 609
      object lblSearch: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 3
        Width = 564
        Height = 16
        Margins.Left = 5
        Margins.Right = 5
        Align = alTop
        Caption = 'Pesquisar (codigo, nome ou cep)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 191
      end
      object txtSearch: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 25
        Width = 564
        Height = 20
        Margins.Left = 5
        Margins.Right = 5
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = txtSearchChange
        ExplicitWidth = 541
        ExplicitHeight = 24
      end
    end
    object lvRecords: TListView
      AlignWithMargins = True
      Left = 5
      Top = 62
      Width = 578
      Height = 267
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Columns = <
        item
          Caption = 'C'#243'digo'
          Width = 80
        end
        item
          Caption = 'Nome'
          Width = 160
        end
        item
          Caption = 'UF'
          Width = 120
        end
        item
          Caption = 'Faixa de Cep'
          Width = 150
        end>
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      FlatScrollBars = True
      GridLines = True
      HideSelection = False
      IconOptions.WrapText = False
      RowSelect = True
      ParentFont = False
      TabOrder = 1
      ViewStyle = vsReport
      ExplicitTop = 57
      ExplicitWidth = 541
      ExplicitHeight = 201
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 334
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 2
    ExplicitHeight = 330
    object sideMenu: TTreeView
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 127
      Height = 292
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Indent = 19
      ParentFont = False
      TabOrder = 0
      OnClick = sideMenuClick
      Items.NodeData = {
        03030000002C0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000010743006900640061006400650073002E00000000000000010000
        00FFFFFFFFFFFFFFFF000000000000000000000000010843006C00690065006E
        00740065007300320000000000000002000000FFFFFFFFFFFFFFFF0000000000
        00000000000000010A520065006C0061007400F300720069006F007300}
      ExplicitLeft = 58
      ExplicitTop = 6
      ExplicitWidth = 318
      ExplicitHeight = 121
    end
    object btnRefresh: TButton
      AlignWithMargins = True
      Left = 5
      Top = 302
      Width = 127
      Height = 27
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = 'Atualizar Lista'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnRefreshClick
      ExplicitLeft = 16
      ExplicitTop = 281
      ExplicitWidth = 97
    end
  end
end
