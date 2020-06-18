unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm7 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Memo2KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

uses Unit1, Unit3, Unit2;

procedure TForm7.Button1Click(Sender: TObject);
begin
if memo2.Text='' then
begin
  Exit;
end;
form1.Client.Socket.SendText('#M'+Edit1.Text+';'+Edit2.Text+';'+memo2.Text+'|');
Memo1.Lines.Add(edit2.Text+' ['+TimeToStr(Time)+', '+DateToStr(Date)+']');
Memo1.Lines.Add(memo2.Text);
memo2.Clear;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
edit1.Text:='';
memo1.Clear;
memo2.Clear;
Caption:='Беседа с ';
end;

procedure TForm7.FormMouseActivate(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
  var
  i:integer;
  l:string;
begin
 for I := 0 to form2.ListView1.Items.Count-1 do
  begin
    l:=form2.ListView1.Items[i].Caption;
    if edit1.Text=l then
    begin
      form2.ListView1.Items[i].ImageIndex:=StrToInt(form1.ids.Lines.Strings[i]);
    end;
  end;
end;

procedure TForm7.Memo2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
button1.Click;
end;

procedure TForm7.Timer1Timer(Sender: TObject);
begin
label1.Caption:=TimeToStr(Time);
end;

end.
