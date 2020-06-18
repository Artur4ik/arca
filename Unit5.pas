unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ComCtrls;

type
  TForm5 = class(TForm)
    Memo2: TMemo;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Timer1: TTimer;
    Image1: TImage;
    Button2: TBitBtn;
    Button1: TBitBtn;
    Memo1: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Memo2KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure Memo1MouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses Unit1, Unit2;

procedure TForm5.Button1Click(Sender: TObject);
begin
if memo2.Text='' then
begin
  Exit;
end;
form1.Client.Socket.SendText('#M'+Edit1.Text+';'+Edit2.Text+';'+memo2.Text+'|');
form5.memo1.SelLength:=5000000000;
form5.memo1.SelStart := Length(form5.memo1.Text);
form5.memo1.Perform(EM_SCROLLCARET, 0, 0);
form5.memo1.Lines.Add(form1.AddColorText5(edit2.Text+' ['+TimeToStr(Time)+', '+DateToStr(Date)+']',clBlue));
form5.memo1.Lines.Add(memo2.text);
memo2.Clear;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if memo2.Text='' then
begin
  Exit;
end;
edit1.Text:='';
edit2.Text:='';
memo1.Clear;
memo2.Clear;
Caption:='Беседа с ';
end;

procedure TForm5.FormMouseActivate(Sender: TObject; Button: TMouseButton;
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

procedure TForm5.Memo1MouseEnter(Sender: TObject);
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

procedure TForm5.Memo2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
button1.Click;
end;

procedure TForm5.Timer1Timer(Sender: TObject);
begin
label1.Caption:=TimeToStr(Time);
end;

end.
