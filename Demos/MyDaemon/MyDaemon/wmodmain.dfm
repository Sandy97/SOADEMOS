object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      Name = 'wactStop'
      PathInfo = '/stop'
      OnAction = WebModule1wactStopAction
    end>
  Height = 230
  Width = 415
end
