object WebModule2: TWebModule2
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule2DefaultHandlerAction
    end
    item
      Name = 'acAuth'
      PathInfo = '/Auth'
      OnAction = WebModule2acAuthAction
    end
    item
      Name = 'acLogin'
      PathInfo = '/login'
      Producer = PageProducer1
    end
    item
      Name = 'acFile'
      PathInfo = '/file'
      OnAction = WebModule2acFileAction
    end>
  Height = 230
  Width = 415
  object PageProducer1: TPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<body>'
      '  <#something>'
      '</body>'
      '</html>')
    OnHTMLTag = PageProducer1HTMLTag
    Left = 192
    Top = 96
  end
end
