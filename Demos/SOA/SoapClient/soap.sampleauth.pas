// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8080/wsdl/Isampleauth
//  >Import : http://localhost:8080/wsdl/Isampleauth>0
// Version  : 1.0
// (29.06.2017 9:34:10 - - $Rev: 90173 $)
// ************************************************************************ //

unit soap.sampleauth;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  TUserCredentials     = class;                 { "urn:sampleauthIntf"[GblCplx] }



  // ************************************************************************ //
  // XML       : TUserCredentials, global, <complexType>
  // Namespace : urn:sampleauthIntf
  // ************************************************************************ //
  TUserCredentials = class(TRemotable)
  private
    Fusername: string;
    Fpassw: string;
  published
    property username: string  read Fusername write Fusername;
    property passw:    string  read Fpassw write Fpassw;
  end;


  // ************************************************************************ //
  // Namespace : urn:sampleauthIntf-Isampleauth
  // soapAction: urn:sampleauthIntf-Isampleauth#Authenticate
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : Isampleauthbinding
  // service   : Isampleauthservice
  // port      : IsampleauthPort
  // URL       : http://localhost:8080/soap/Isampleauth
  // ************************************************************************ //
  Isampleauth = interface(IInvokable)
  ['{BEDD2F9A-2CF9-F8AA-0669-4CB3C6411B16}']
    function  Authenticate(const Credentials: TUserCredentials): Boolean; stdcall;
  end;

function GetIsampleauth(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): Isampleauth;


implementation
  uses System.SysUtils;

function GetIsampleauth(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): Isampleauth;
const
  defWSDL = 'http://localhost:8080/wsdl/Isampleauth';
  defURL  = 'http://localhost:8080/soap/Isampleauth';
  defSvc  = 'Isampleauthservice';
  defPrt  = 'IsampleauthPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as Isampleauth);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { Isampleauth }
  InvRegistry.RegisterInterface(TypeInfo(Isampleauth), 'urn:sampleauthIntf-Isampleauth', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Isampleauth), 'urn:sampleauthIntf-Isampleauth#Authenticate');
  RemClassRegistry.RegisterXSClass(TUserCredentials, 'urn:sampleauthIntf', 'TUserCredentials');

end.