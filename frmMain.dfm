object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Sistema'
  ClientHeight = 299
  ClientWidth = 672
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
  PixelsPerInch = 96
  TextHeight = 13
  object header: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 36
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 15395562
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = -2
      Top = 3
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
      Left = 429
      Top = 3
      Width = 236
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      Color = 15395562
      ParentBackground = False
      TabOrder = 0
      object btnUpdate: TButton
        Left = 161
        Top = 0
        Width = 75
        Height = 26
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
      end
      object btnAdd: TButton
        Left = 86
        Top = 0
        Width = 75
        Height = 26
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
      end
    end
  end
  object sideMenu: TTreeView
    Left = 0
    Top = 36
    Width = 121
    Height = 263
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alLeft
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Indent = 19
    ParentFont = False
    TabOrder = 1
    OnClick = sideMenuClick
    Items.NodeData = {
      03030000002C0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      0000000000010743006900640061006400650073002E00000000000000010000
      00FFFFFFFFFFFFFFFF000000000000000000000000010843006C00690065006E
      00740065007300320000000000000002000000FFFFFFFFFFFFFFFF0000000000
      00000000000000010A520065006C0061007400F300720069006F007300}
  end
  object mainBody: TPanel
    Left = 121
    Top = 36
    Width = 551
    Height = 263
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object panelSeach: TPanel
      Left = 0
      Top = 0
      Width = 551
      Height = 52
      Align = alTop
      BevelOuter = bvNone
      Color = 15395562
      ParentBackground = False
      TabOrder = 0
      object lblSearch: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 3
        Width = 541
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
        Width = 541
        Height = 24
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
      end
    end
    object lvRecords: TListView
      AlignWithMargins = True
      Left = 5
      Top = 57
      Width = 541
      Height = 201
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
    end
  end
end
