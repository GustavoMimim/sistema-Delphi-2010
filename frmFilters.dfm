object Form4: TForm4
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Filtros'
  ClientHeight = 237
  ClientWidth = 166
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelFilters: TPanel
    AlignWithMargins = True
    Left = 2
    Top = 2
    Width = 162
    Height = 233
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelKind = bkSoft
    BevelOuter = bvNone
    Color = 15395562
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 165
    object Label3: TLabel
      Left = 10
      Top = 131
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label4: TLabel
      Left = 10
      Top = 12
      Width = 82
      Height = 13
      Caption = 'C'#243'digo do cliente'
    end
    object Label5: TLabel
      Left = 10
      Top = 72
      Width = 82
      Height = 13
      Caption = 'C'#243'digo da cidade'
    end
    object Label1: TLabel
      Left = 39
      Top = 51
      Width = 36
      Height = 14
      Caption = 'min'#237'mo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 107
      Top = 112
      Width = 39
      Height = 14
      Caption = 'm'#225'ximo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 107
      Top = 51
      Width = 39
      Height = 14
      Caption = 'm'#225'ximo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 39
      Top = 112
      Width = 36
      Height = 14
      Caption = 'min'#237'mo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object cbState: TComboBox
      Left = 10
      Top = 150
      Width = 136
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        ''
        'Acre'
        'Alagoas'
        'Amap'#225
        'Amazonas'
        'Bahia'
        'Cear'#225
        'Esp'#237'rito Santo'
        'Goi'#225's'
        'Maranh'#227'o'
        'Mato Grosso'
        'Mato Grosso do Sul'
        'Minas Gerais'
        'Par'#225
        'Para'#237'ba'
        'Paran'#225
        'Pernambuco'
        'Piau'#237
        'Rio de Janeiro'
        'Rio Grande do Norte'
        'Rio Grande do Sul'
        'Rond'#244'nia'
        'Roraima'
        'Santa Catarina'
        'S'#227'o Paulo'
        'Sergipe'
        'Tocantins'
        'Distrito Federal')
    end
    object txtCodeCityMin: TEdit
      Left = 10
      Top = 91
      Width = 65
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object txtCodeCityMax: TEdit
      Left = 81
      Top = 91
      Width = 65
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
    object txtCodeCustomerMin: TEdit
      Left = 10
      Top = 31
      Width = 65
      Height = 21
      NumbersOnly = True
      TabOrder = 3
    end
    object txtCodeCustomerMax: TEdit
      Left = 81
      Top = 31
      Width = 65
      Height = 21
      NumbersOnly = True
      TabOrder = 4
    end
    object chkGroupByCity: TCheckBox
      Left = 10
      Top = 185
      Width = 136
      Height = 38
      Caption = 'Ordenar por cidade'
      TabOrder = 5
      WordWrap = True
    end
  end
end
