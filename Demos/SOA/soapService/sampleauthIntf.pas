unit sampleauthIntf;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns;

type

  TUserCredentials = class(TRemotable)
  private
    Fpassw: string;
    Fusername: string;
  published
    property username: string read Fusername write Fusername;
    property passw: string read Fpassw write Fpassw;
  end;

  Isampleauth = interface(IInvokable)
    ['{5DC4E5DC-CB0E-4A37-833C-03D8E325C6EA}']
    function Authenticate(const Credentials: TUserCredentials): Boolean; stdcall;
  end;

implementation

{ TUserCredentials }

initialization

InvRegistry.RegisterInterface(TypeInfo(Isampleauth));

end.
