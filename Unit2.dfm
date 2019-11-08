object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Test OAUTH2 Gmail Send Message'
  ClientHeight = 214
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 409
    Height = 182
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 423
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Authenticate'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 423
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Send MSG'
    TabOrder = 2
    OnClick = Button2Click
  end
  object IdSMTP1: TIdSMTP
    Intercept = IdConnectionIntercept1
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 88
    Top = 128
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    Intercept = IdConnectionIntercept1
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 248
    Top = 56
  end
  object IdConnectionIntercept1: TIdConnectionIntercept
    OnReceive = IdConnectionIntercept1Receive
    Left = 88
    Top = 64
  end
  object OAuth2_GMail: TOAuth2Authenticator
    AccessTokenEndpoint = 'https://accounts.google.com/o/oauth2/token'
    AccessTokenExpiry = 41488.448189351900000000
    AuthorizationEndpoint = 'https://accounts.google.com/o/oauth2/auth'
    RedirectionEndpoint = 'http://localhost:2132'
    Scope = 'https://mail.google.com/'
    Left = 208
    Top = 138
    AccessTokenExpiryDate = 41488.4481893519d
  end
  object IdHTTPServer1: TIdHTTPServer
    Active = True
    Bindings = <>
    DefaultPort = 2132
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 352
    Top = 120
  end
end