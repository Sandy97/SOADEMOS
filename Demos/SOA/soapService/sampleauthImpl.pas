unit sampleauthImpl;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns, sampleauthIntf;

type

  Tsampleauth = class(TInvokableClass, Isampleauth)
  public
     function Authenticate(const Credentials: TUserCredentials): Boolean; stdcall;
  end;

implementation

function Tsampleauth.Authenticate(const Credentials: TUserCredentials): Boolean; stdcall;
begin
  Result:= not ((Credentials.username='Abc') and (Credentials.passw='123456'));
end;

initialization
   InvRegistry.RegisterInvokableClass(Tsampleauth);
end.

