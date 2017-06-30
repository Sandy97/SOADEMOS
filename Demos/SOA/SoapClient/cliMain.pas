unit cliMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit;

type
  TForm4 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    btnAuth: TButton;
    procedure btnAuthClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses
  soap.sampleauth
;

{$R *.fmx}

procedure TForm4.btnAuthClick(Sender: TObject);
var
  crd: TUserCredentials;
begin
  crd := TUserCredentials.Create;
  try
    crd.username := Edit1.Text;
    crd.passw := Edit2.Text;
    if GetIsampleauth().Authenticate(crd) then
    ShowMessage('Проверку прошел')
    else
    ShowMessage('Не прошел')
    ;
  finally
    crd.Free;
  end;
end;


end.
