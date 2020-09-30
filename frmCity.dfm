object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cidade'
  ClientHeight = 317
  ClientWidth = 202
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 202
    Height = 317
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 15724527
    ParentBackground = False
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 183
      Width = 63
      Height = 13
      Caption = 'Faixa de Cep'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel
      Left = 8
      Top = 123
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object txtPostCodeEnd: TEdit
      Left = 8
      Top = 229
      Width = 182
      Height = 21
      MaxLength = 8
      NumbersOnly = True
      TabOrder = 4
    end
    object txtPostCodeStart: TEdit
      Left = 8
      Top = 202
      Width = 182
      Height = 21
      MaxLength = 8
      NumbersOnly = True
      TabOrder = 3
    end
    object txtCode: TEdit
      Left = 8
      Top = 27
      Width = 182
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object cbState: TComboBox
      Left = 8
      Top = 142
      Width = 182
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      Style = csDropDownList
      TabOrder = 2
      Items.Strings = (
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
    object txtName: TEdit
      Left = 8
      Top = 83
      Width = 182
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
    object panelFooter: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 264
      Width = 192
      Height = 46
      Align = alBottom
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = 13224393
      ParentBackground = False
      TabOrder = 5
      object btnRemove: TButton
        AlignWithMargins = True
        Left = 108
        Top = 5
        Width = 80
        Height = 32
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 5
        Align = alRight
        Caption = 'Remover'
        TabOrder = 0
        OnClick = btnRemoveClick
        ExplicitLeft = 28
      end
      object btnSave: TButton
        AlignWithMargins = True
        Left = 28
        Top = 5
        Width = 80
        Height = 32
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 5
        Align = alRight
        Caption = 'Salvar'
        TabOrder = 1
        OnClick = btnSaveClick
        ExplicitLeft = 108
      end
    end
  end
end
