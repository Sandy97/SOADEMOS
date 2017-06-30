program mydaemon;
{$APPTYPE CONSOLE}

uses
  Posix.Unistd,
  System.SysUtils,
  System.Types,
  IPPeerServer,
  IPPeerAPI,
  IdHTTPWebBrokerBridge,
  Web.WebReq,
  Web.WebBroker,
  wmodmain in 'wmodmain.pas' {WebModule1: TWebModule},
  ServerConstants in 'ServerConstants.pas';

{$R *.res}

function BindPort(Aport: Integer): Boolean;
var
  LTestServer: IIPTestServer;
begin
  Result := True;
  try
    LTestServer := PeerFactory.CreatePeer('', IIPTestServer) as IIPTestServer;
    LTestServer.TestOpenPort(APort, nil);
  except
    Result := False;
  end;
end;

function CheckPort(Aport: Integer): Integer;
begin
  if BindPort(Aport) then
    Result := Aport
  else
    Result := 0;
end;

procedure StartServer(const Aserver: TIdHTTPWebBrokerBridge);
begin
  if not (Aserver.Active) then
  begin
    if CheckPort(Aserver.DefaultPort) > 0 then
    begin
      Aserver.Bindings.Clear;
      Aserver.Active := True;
    end
  end
end;

procedure StopServer(const Aserver: TIdHTTPWebBrokerBridge);
begin
  if Aserver.Active  then
  begin
    Aserver.Active := False;
    Aserver.Bindings.Clear;
  end
end;

procedure RunServer(APort: Integer);
var
  LServer: TIdHTTPWebBrokerBridge;
  LResponse: string;
begin
  LServer := TIdHTTPWebBrokerBridge.Create(nil);
  try
    LServer.DefaultPort := APort;
    StartServer(LServer);
    while KeepGoing do Sleep(0);
    StopServer(LServer);
  finally
    LServer.Free;
  end;
end;

begin
  if fork()<>0 then begin
    exit;
  end;
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  RunServer(53280);
end.
