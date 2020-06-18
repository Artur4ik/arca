unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Imaging.jpeg;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Timer1: TTimer;
    Image1: TImage;
    Button1: TBitBtn;
    Button2: TBitBtn;
    Memo2: TMemo;
    Memo1: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Memo2KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure Memo1MouseEnter(Sender: TObject);
    procedure Memo2MouseEnter(Sender: TObject);
  private
    { Private declarations }
  public


   { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit1, Unit2;

procedure TForm4.Button1Click(Sender: TObject);
begin
if memo2.Text='' then
begin
  Exit;
end;
form1.Client.Socket.SendText('#M'+Edit1.Text+';'+Edit2.Text+';'+memo2.Text+'|');
form4.memo1.SelLength:=5000000000;
form4.memo1.SelStart := Length(form4.memo1.Text);
form4.memo1.Perform(EM_SCROLLCARET, 0, 0);
form4.memo1.Lines.Add(form1.AddColorText4(edit2.Text+' ['+TimeToStr(Time)+', '+DateToStr(Date)+']',clBlue));
form4.memo1.Lines.Add(memo2.text);
memo2.Clear;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
edit1.Text:='';
edit2.Text:='';
memo1.Clear;
memo2.Clear;
Caption:='Беседа с ';
end;

procedure TForm4.FormMouseActivate(Sender: TObject; Button: TMouseButton;
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

procedure TForm4.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
button1.Click;
end;

procedure TForm4.Memo1MouseEnter(Sender: TObject);
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

procedure TForm4.Memo2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
button1.Click;
end;

procedure TForm4.Memo2MouseEnter(Sender: TObject);
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

procedure TForm4.Timer1Timer(Sender: TObject);
begin
label1.Caption:=TimeToStr(Time);
end;
end.
