unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.TabNotBk,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons, Vcl.Imaging.jpeg;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Memo2: TMemo;
    Timer1: TTimer;
    Memo1: TRichEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Button1: TBitBtn;
    Button2: TBitBtn;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Memo2KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Memo2Click(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit1, Unit2;

procedure TForm3.Button1Click(Sender: TObject);
begin
if memo2.Text='' then
begin
  Exit;
end;
form1.Client.Socket.SendText('#MA'+Edit1.Text+';'+Edit2.Text+';'+memo2.Text+'|');
memo2.Clear;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
 form2.listview1.Items[0].ImageIndex:=6;
end;

procedure TForm3.FormClick(Sender: TObject);
begin
form2.listview1.Items[0].ImageIndex:=6;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
edit2.Text:= form1.Edit1.Text;
end;

procedure TForm3.Image1Click(Sender: TObject);
begin
form2.listview1.Items[0].ImageIndex:=6;
end;

procedure TForm3.Memo1Click(Sender: TObject);
begin
form2.listview1.Items[0].ImageIndex:=6;
end;

procedure TForm3.Memo2Click(Sender: TObject);
begin
form2.listview1.Items[0].ImageIndex:=6;
end;

procedure TForm3.Memo2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
button1.Click;
end;

procedure TForm3.N1Click(Sender: TObject);
begin
memo1.CopyToClipboard;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
label1.Caption:=TimeToStr(Time);
end;

end.
