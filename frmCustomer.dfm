object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cliente'
  ClientHeight = 366
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 314
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 15724527
    ParentBackground = False
    TabOrder = 0
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
    object Label5: TLabel
      Left = 8
      Top = 121
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label6: TLabel
      Left = 8
      Top = 182
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label7: TLabel
      Left = 8
      Top = 248
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object txtCode: TEdit
      Left = 8
      Top = 27
      Width = 182
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object txtName: TEdit
      Left = 8
      Top = 83
      Width = 182
      Height = 21
      MaxLength = 150
      TabOrder = 1
    end
    object txtCpf: TEdit
      Left = 8
      Top = 140
      Width = 182
      Height = 21
      MaxLength = 14
      NumbersOnly = True
      TabOrder = 2
    end
    object txtTel: TEdit
      Left = 8
      Top = 201
      Width = 182
      Height = 21
      MaxLength = 50
      NumbersOnly = True
      TabOrder = 3
    end
    object txtEmail: TEdit
      Left = 8
      Top = 267
      Width = 182
      Height = 21
      MaxLength = 100
      TabOrder = 4
    end
    object Panel3: TPanel
      Left = 208
      Top = 8
      Width = 225
      Height = 297
      BevelKind = bkTile
      TabOrder = 5
      object Label8: TLabel
        Left = 16
        Top = 5
        Width = 19
        Height = 13
        Caption = 'Cep'
      end
      object Label9: TLabel
        Left = 16
        Top = 196
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label10: TLabel
        Left = 16
        Top = 245
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label3: TLabel
        Left = 16
        Top = 54
        Width = 33
        Height = 13
        Caption = 'Cidade'
        Enabled = False
      end
      object Label4: TLabel
        Left = 16
        Top = 102
        Width = 33
        Height = 13
        Caption = 'Estado'
        Enabled = False
      end
      object Label11: TLabel
        Left = 16
        Top = 150
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object txtCity: TEdit
        Left = 16
        Top = 73
        Width = 182
        Height = 21
        Enabled = False
        MaxLength = 8
        TabOrder = 1
      end
      object txtAddress: TEdit
        Left = 16
        Top = 213
        Width = 182
        Height = 21
        MaxLength = 150
        TabOrder = 4
      end
      object txtComplement: TEdit
        Left = 16
        Top = 261
        Width = 182
        Height = 21
        MaxLength = 150
        TabOrder = 5
      end
      object txtPostCode: TEdit
        Left = 16
        Top = 24
        Width = 182
        Height = 21
        MaxLength = 8
        NumbersOnly = True
        TabOrder = 0
        OnChange = txtPostCodeChange
      end
      object cbState: TComboBox
        Left = 16
        Top = 120
        Width = 182
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csDropDownList
        Enabled = False
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
      object txtDistrict: TEdit
        Left = 16
        Top = 167
        Width = 182
        Height = 21
        MaxLength = 150
        TabOrder = 3
      end
    end
  end
  object panelFooter: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 317
    Width = 441
    Height = 46
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    Color = 13224393
    ParentBackground = False
    TabOrder = 1
    object btnRemove: TButton
      AlignWithMargins = True
      Left = 354
      Top = 5
      Width = 80
      Height = 32
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Remover'
      TabOrder = 0
      OnClick = btnRemoveClick
    end
    object btnSave: TButton
      AlignWithMargins = True
      Left = 268
      Top = 5
      Width = 80
      Height = 32
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSaveClick
    end
  end
end
