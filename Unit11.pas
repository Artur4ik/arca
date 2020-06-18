unit Unit11;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TForm11 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Memo1: TMemo;
    Label1: TLabel;
    Button1: TButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm11.Button1Click(Sender: TObject);
begin
close;
form1.AlphaBlend:=false;
end;

procedure TForm11.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

end.
