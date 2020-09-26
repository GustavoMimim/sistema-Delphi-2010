object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object header: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 15395562
    ParentBackground = False
    TabOrder = 0
    object Button1: TButton
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 465
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 546
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Remover'
      TabOrder = 2
    end
  end
  object sideMenu: TTreeView
    Left = 0
    Top = 41
    Width = 121
    Height = 258
    Align = alLeft
    Indent = 19
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
    Top = 41
    Width = 514
    Height = 258
    Align = alClient
    TabOrder = 2
  end
  object tabPages: TPageControl
    Left = 121
    Top = 41
    Width = 514
    Height = 258
    ActivePage = Cidades
    TabOrder = 3
    object Cidades: TTabSheet
      Caption = 'Cidades'
      object ListView1: TListView
        Left = 0
        Top = 49
        Width = 506
        Height = 181
        Align = alClient
        Columns = <>
        GridLines = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 506
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Color = 15395562
        ParentBackground = False
        TabOrder = 1
        object Label1: TLabel
          Left = 3
          Top = 3
          Width = 46
          Height = 13
          Caption = 'Pesquisar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Edit1: TEdit
          Left = 0
          Top = 20
          Width = 505
          Height = 21
          TabOrder = 0
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Clientes'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TabSheet2: TTabSheet
      Caption = 'Relat'#243'rios'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
end
