object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 99
  Width = 177
  object sqlCity: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 104
    Top = 16
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog="";Data Source=localhost;In' +
      'itial File Name="";Server SPN=""'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 40
    Top = 16
  end
end
