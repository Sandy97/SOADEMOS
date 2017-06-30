program SoapClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  cliMain in 'cliMain.pas' {Form4},
  soap.sampleauth in 'soap.sampleauth.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
