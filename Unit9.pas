unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, inifiles;

type
  TForm9 = class(TForm)
    CategoryPanelGroup1: TCategoryPanelGroup;
    �����: TCategoryPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  ini:tinifile;
implementation

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
ini:=tinifile.Create(ExtractFilePath(Application.ExeName)+'settings.ini');
ini.WriteBool('Settings','Sound',checkbox1.Checked);
ini.WriteBool('Settings','ChatIcon',checkbox2.Checked);
ini.WriteBool('Settings','Logs',checkbox4.Checked);
Close;
end;

end.
