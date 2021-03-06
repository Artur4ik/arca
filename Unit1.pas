unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, System.Win.ScktComp, inifiles,mmsystem,
  Vcl.Buttons,Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Client: TClientSocket;
    Label3: TLabel;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    ids: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure NewMsg(s:string);
    procedure Button2Click(Sender: TObject);
    procedure ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button4Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
  private
    { Private declarations }
  public
  function AddColorText3(Text: String; Color: TColor): String;
  function AddColorText4(Text: String; Color: TColor): String;
  function AddColorText5(Text: String; Color: TColor): String;
    { forms:array[0..30] of TForm;
  imgs:array[0..30] of timage;
  buts:array[0..30] of tbitbtn;
  buts2:array[0..30] of tbitbtn;
  mems:array[0..30] of trichedit;
  mems2:array[0..30] of tmemo;
  labels:array[0..30] of tlabel;
  edits:array[0..30] of tedit;
  edits2:array[0..30] of tedit;     }
  end;

var
  Form1: TForm1;
  reg,num:integer;
  ini:tinifile;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit8, Unit4, Unit5, Unit6, Unit7, Unit9, Unit11;

function TForm1.AddColorText3(Text: String; Color: TColor): String;
begin
 form3.memo1.SelAttributes.Color := Color;
 form3.memo1.SelAttributes.Style:=[fsbold];
 form3.memo1.SelText := Text;
 form3.memo1.SelAttributes.Style:=[];
 form3.memo1.SelAttributes.Color := clBlack;
end;

function TForm1.AddColorText5(Text: String; Color: TColor): String;
begin
 form5.memo1.SelAttributes.Color := Color;
 form5.memo1.SelAttributes.Style:=[fsbold];
 form5.memo1.SelText := Text;
 form5.memo1.SelAttributes.Style:=[];
 form5.memo1.SelAttributes.Color := clBlack;
end;

function TForm1.AddColorText4(Text: String; Color: TColor): String;
begin
 form4.memo1.SelAttributes.Color := Color;
 form4.memo1.SelAttributes.Style:=[fsbold];
 form4.memo1.SelText := Text;
 form4.memo1.SelAttributes.Style:=[];
 form4.memo1.SelAttributes.Color := clBlack;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if (edit1.Text='') or (edit2.Text='') then
begin
  MessageDlg('�� ��� ���� ���������!',mterror,[mbok],0);
  Exit;
end;
  label4.visible:=false;
  label5.visible:=false;
  label6.visible:=false;
button1.Enabled:=false;
button2.Enabled:=false;
edit1.Enabled:=false;
edit2.Enabled:=false;
client.Host:=form8.Edit1.Text;
client.Port:=StrToInt(form8.Edit2.Text);
Client.Active:=True;
reg:=1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if (edit1.Text='') or (edit2.Text='') then
begin
  label4.visible:=true;
  label5.visible:=true;
  label6.visible:=true;
  Exit;
end;
  label4.visible:=false;
  label5.visible:=false;
  label6.visible:=false;
button1.Enabled:=false;
button2.Enabled:=false;
edit1.Enabled:=false;
edit2.Enabled:=false;
client.Host:=form8.Edit1.Text;
client.Port:=StrToInt(form8.Edit2.Text);
Client.Active:=True;
reg:=0;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
form8.Show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
close;
end;

procedure TForm1.ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
ini.WriteString('General','IP',form8.Edit1.Text);
ini.WriteString('General','Port',form8.Edit2.Text);
if reg=0 then
begin
socket.SendText('#R'+edit1.Text+'?'+edit2.Text+'|');
end;
if reg=1 then
begin
socket.SendText('#L'+edit1.Text+'?'+edit2.Text+'|');
end;
end;

procedure TForm1.ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
form2.Close;
form2.TrayIcon1.Visible:=false;
Show;
button1.Enabled:=True;
button2.Enabled:=True;
edit1.Enabled:=True;
edit2.Enabled:=True;
end;

procedure TForm1.ClientError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
button1.Enabled:=True;
button2.Enabled:=True;
edit1.Enabled:=True;
edit2.Enabled:=True;
 MessageDlg('�� ������� ������������. ���������� �������� IP � ����������. (��� ������: '+IntToStr(Errorcode)+')',mterror,[mbok],0);
 errorcode:=0;
 end;

procedure TForm1.ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
text:string;
begin
text:=socket.ReceiveText;
if form9.CheckBox4.Checked=true then
begin
  memo1.Lines.Add(text);
end;
     while Pos('|',text) > 0 do
     begin
      newmsg(Copy(text,1,Pos('|',text)-1));
       Delete(text,1,Pos('|',text));
     end;
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if form9.CheckBox4.Checked=true then
begin
memo1.Lines.SaveToFile(ExtractfilepatH(application.ExeName)+'logs.log');
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
if fileexists(ExtractfilepatH(application.ExeName)+'logs.log') then
                                                              begin
memo1.Lines.LoadFromFile(ExtractfilepatH(application.ExeName)+'logs.log');
                                                              end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i: Integer;
begin
ini:=tinifile.Create(ExtractFilePath(Application.ExeName)+'settings.ini');
form2.Top:=ini.ReadInteger('General','Top',0);
form2.Left:=ini.ReadInteger('General','Left',500);
edit1.Text:=ini.ReadString('General','Nick','');
form8.Edit1.Text:=ini.ReadString('General','IP','127.0.0.1');
form8.Edit2.Text:=ini.ReadString('General','Port','2048');
form9.CheckBox1.Checked:=ini.ReadBool('Settings','Sound',form9.checkbox1.Checked);
form9.CheckBox2.Checked:=ini.ReadBool('Settings','ChatIcon',form9.checkbox2.Checked);
form9.CheckBox4.Checked:=ini.ReadBool('Settings','Logs',form9.checkbox4.Checked);
{for i := 0 to 30 do
begin
forms[i]:=tform.Create(Application);
forms[i].Position:=poScreenCenter;
forms[i].Width:=465;
forms[i].Height:=560;
forms[i].ClientHeight:=522;
forms[i].Clientwidth:=449;
forms[i].Caption:='������ � ';


imgs[i]:=timage.create(Application);
imgs[i].parent:=forms[i];
imgs[i].align:=alclient;
imgs[i].picture.loadfromfile(ExtractFilePath(Application.Exename)+'\resource\img1.jpg');
imgs[i].Stretch:=True;

mems[i]:=trichedit.Create(Application);
mems[i].Parent:=forms[i];
mems[i].Width:=433;
mems[i].Height:=352;
mems[i].Left:=8;
mems[i].Top:=41;
mems[i].ReadOnly:=True;
mems[i].Anchors:=[akTop,AkRight,akBottom,akleft];
mems[i].Font.Size:=10;
mems[i].ScrollBars:=ssvertical;

mems2[i]:=tmemo.Create(Application);
mems2[i].Parent:=forms[i];
mems2[i].Width:=433;
mems2[i].Height:=72;
mems2[i].Left:=8;
mems2[i].Top:=416;
mems2[i].ReadOnly:=false;
mems2[i].Anchors:=[AkRight,akBottom,akleft];
mems2[i].Font.Size:=10;
mems2[i].WantReturns:=False;
mems2[i].ScrollBars:=ssvertical;

buts[i]:=tbitbtn.Create(Application);
buts[i].Parent:=forms[i];
buts[i].Left:=8;
buts[i].Top:=494;
buts[i].Glyph.LoadFromFile(ExtractFilePath(Application.Exename)+'\resource\buttoncl.bmp');
buts[i].Caption:='�������';
buts[i].Width:=89;
buts[i].Height:=25;

end;





forms[0].Show;     }
if ini.ReadBool('General','ReadMe',false)=false then
begin
form11.show;
ini.WriteBool('General','ReadMe',True);
exit;
end;
alphablend:=false;
end;

procedure TForm1.NewMsg(s: string);
var
k,i,a:integer;
p,n,l,j,q:string;
begin



if copy(s,1,3)='#CH' then
begin
Delete(s,1,3);
n:=copy(s,1,1);
Delete(s,1,1);
for I := 0 to form2.ListView1.Items.Count-1 do
  begin
    l:=form2.ListView1.Items[i].Caption;
    if l=s then
    begin
      ids.Lines.Strings[i]:=n;
      form2.ListView1.Items[i].ImageIndex:=StrToInt(n);
    end;
  end;
end;


if copy(s,1,3)='#MA' then
begin
Delete(s,1,3);
j:=Copy(s,1,Pos(';',s)-1);
Delete(s,1,Pos(';',s));
q:=Copy(s,1,Pos(';',s)-1);
Delete(s,1,Pos(';',s));;
if form3.Edit2.Text=q then
begin
form3.memo1.SelLength:=5000000000;
form3.memo1.SelStart := Length(form3.memo1.Text);
    form3.memo1.Perform(EM_SCROLLCARET, 0, 0);
form3.memo1.Lines.Add(AddColorText3(q+' ['+TimeToStr(Time)+', '+DateToStr(Date)+']',clBlue));
form3.memo1.Lines.Add(s);

end
else
begin
form3.memo1.SelLength:=5000000000;
form3.memo1.SelStart := Length(form3.memo1.Text);
    form3.memo1.Perform(EM_SCROLLCARET, 0, 0);
form3.memo1.Lines.Add(AddColorText3(q+' ['+TimeToStr(Time)+', '+DateToStr(Date)+']',clred));
form3.memo1.Lines.Add(s);
end;

if (form9.CheckBox2.Checked=false) and (form1.Edit1.Text<> q) then
begin
form2.ListView1.Items[0].ImageIndex:=7;
PlaySound(pchar(extractfilepath(application.ExeName)+'sndMsg.wav'), 0, SND_ASYNC);
end;
end;


if copy(s,1,2)='#M' then
begin
Delete(s,1,2);
j:=Copy(s,1,Pos(';',s)-1);
Delete(s,1,Pos(';',s));
q:=Copy(s,1,Pos(';',s)-1);
Delete(s,1,Pos(';',s));
if j=edit1.Text then
begin
  if (form4.Edit1.Text='') or (form4.Edit1.Text=q) then
  begin
    form4.Edit1.Text:=q;

form4.memo1.SelLength:=5000000000;
form4.memo1.SelStart := Length(form4.memo1.Text);
form4.memo1.Perform(EM_SCROLLCARET, 0, 0);
form4.memo1.Lines.Add(AddColorText4(q+' ['+TimeToStr(Time)+', '+DateToStr(Date)+']',clred));
form4.memo1.Lines.Add(s);

    form4.Caption:='������ � '+q;
    form4.Edit2.Text:=form1.Edit1.Text;
if (form9.CheckBox1.Checked=true) then
begin
PlaySound(pchar(extractfilepath(application.ExeName)+'sndMsg.wav'), 0, SND_ASYNC);
end;
    if form4.Active=true then
    begin
      Exit;
    end;
    for I := 0 to form2.ListView1.Items.Count-1 do
  begin
    l:=form2.ListView1.Items[i].Caption;
    if q=l then
    begin
      form2.ListView1.Items[i].ImageIndex:=7;
    end;
  end;
  Exit;
  end;

   if (form5.Edit1.Text='') or (form5.Edit1.Text=q) then
  begin
    form5.Edit1.Text:=q;

form5.memo1.SelLength:=5000000000;
form5.memo1.SelStart := Length(form5.memo1.Text);
form5.memo1.Perform(EM_SCROLLCARET, 0, 0);
form5.memo1.Lines.Add(AddColorText4(q+' ['+TimeToStr(Time)+', '+DateToStr(Date)+']',clred));
form5.memo1.Lines.Add(s);

    form5.Caption:='������ � '+q;
    form5.Edit2.Text:=form1.Edit1.Text;
    if (form9.CheckBox1.Checked=true) then
begin
PlaySound(pchar(extractfilepath(application.ExeName)+'sndMsg.wav'), 0, SND_ASYNC);
end;
    if form5.Active=true then
    begin
      Exit;
    end;
    for I := 0 to form2.ListView1.Items.Count-1 do
  begin
    l:=form2.ListView1.Items[i].Caption;
    if q=l then
    begin
      form2.ListView1.Items[i].ImageIndex:=7;
    end;
  end;
  Exit;
  end;



   if (form6.Edit1.Text='') or (form6.Edit1.Text=q) then
  begin
    form6.Edit1.Text:=q;
    form6.Memo1.Lines.Add(q+' ['+TimeToStr(Time)+', '+DateToStr(Date)+']');
    form6.Memo1.Lines.Add(s);
    form6.Caption:='������ � '+q;
    form6.Edit2.Text:=form1.Edit1.Text;
    if (form9.CheckBox1.Checked=true) then
begin
PlaySound(pchar(extractfilepath(application.ExeName)+'sndMsg.wav'), 0, SND_ASYNC);
end;
    if form6.Active=true then
    begin
      Exit;
    end;
    for I := 0 to form2.ListView1.Items.Count-1 do
  begin
    l:=form2.ListView1.Items[i].Caption;
    if q=l then
    begin
      form2.ListView1.Items[i].ImageIndex:=7;
    end;
  end;
  Exit;
  end;



   if (form7.Edit1.Text='') or (form7.Edit1.Text=q) then
  begin
    form7.Edit1.Text:=q;
    form7.Memo1.Lines.Add(q+' ['+TimeToStr(Time)+', '+DateToStr(Date)+']');
    form7.Memo1.Lines.Add(s);
    form7.Caption:='������ � '+q;
    form7.Edit2.Text:=form1.Edit1.Text;
    if (form9.CheckBox1.Checked=true) then
begin
PlaySound(pchar(extractfilepath(application.ExeName)+'sndMsg.wav'), 0, SND_ASYNC);
end;
    if form7.Active=true then
    begin
      Exit;
    end;
    for I := 0 to form2.ListView1.Items.Count-1 do
  begin
    l:=form2.ListView1.Items[i].Caption;
    if q=l then
    begin
      form2.ListView1.Items[i].ImageIndex:=7;
    end;
  end;
  Exit;
  end;

end;


end;





if copy(s,1,3)='#OK' then
begin
Delete(s,1,3);
num:=StrToInt(s);
form2.Show;
form2.TrayIcon1.Visible:=true;
Hide;
ini.WriteString('General','Nick',edit1.Text);
button1.Enabled:=True;
button2.Enabled:=True;
edit1.Enabled:=True;
edit2.Enabled:=True;
     end;




if copy(s,1,2)='#U' then
begin
  Delete(s,1,2);
  form2.ListView1.Clear;
  form2.ListView1.Items.Add.Caption:='����� ���';
  form2.ListView1.Items[0].ImageIndex:=6;
  ids.Clear;
  ids.Lines.Add('6');
  while Pos(';',s) > 0 do begin
  p:=copy(s,1,1);
k:=StrToInt(p);
ids.Lines.Add(IntTOStr(k));
delete(s,1,1);
form2.ListView1.Items.Add.Caption:=Copy(s,1,Pos(';',s)-1);
case k of
0: form2.ListView1.Items[form2.ListView1.Items.Count-1].ImageIndex:=0;
1: form2.ListView1.Items[form2.ListView1.Items.Count-1].ImageIndex:=1;
2: form2.ListView1.Items[form2.ListView1.Items.Count-1].ImageIndex:=2;
3: form2.ListView1.Items[form2.ListView1.Items.Count-1].ImageIndex:=3;
4: form2.ListView1.Items[form2.ListView1.Items.Count-1].ImageIndex:=4;
5: form2.ListView1.Items[form2.ListView1.Items.Count-1].ImageIndex:=5;
6: form2.ListView1.Items[form2.ListView1.Items.Count-1].ImageIndex:=6;
end;
Delete(s,1,Pos(';',s));
  end;
end;
if copy(s,1,2)='#O' then
begin
Client.Active:=false;
ShowMessage('�����������, �� ������� ������������������! ������� ������ "�����".');
button1.Enabled:=True;
button2.Enabled:=True;
edit1.Enabled:=True;
edit2.Enabled:=True;
end;
if (copy(s,1,2)='#F') then
begin
client.Active:=false;
ShowMessage('�������� ����� ��� ������!');
button1.Enabled:=True;
button2.Enabled:=True;
edit1.Enabled:=True;
edit2.Enabled:=True;
end;
if (copy(s,1,2)='#Z') then
begin
client.Active:=false;
ShowMessage('���� ��� �����!');
button1.Enabled:=True;
button2.Enabled:=True;
edit1.Enabled:=True;
edit2.Enabled:=True;
end;
if copy(s,1,2)='#H' then
begin
Delete(s,1,2);
if form2.BitBtn1.Caption='������' then
begin
client.Socket.SendText('#H'+'6'+form1.Edit1.Text+'|');
end;
if form2.BitBtn1.Caption='�����' then
begin
client.Socket.SendText('#H'+'2'+form1.Edit1.Text+'|');
end;
if form2.BitBtn1.Caption='����' then
begin
client.Socket.SendText('#H'+'1'+form1.Edit1.Text+'|');
end;
if form2.BitBtn1.Caption='����������' then
begin
client.Socket.SendText('#H'+'3'+form1.Edit1.Text+'|');
end;
if form2.BitBtn1.Caption='������' then
begin
client.Socket.SendText('#H'+'0'+form1.Edit1.Text+'|');
end;
if form2.BitBtn1.Caption='�����' then
begin
client.Socket.SendText('#H'+'4'+form1.Edit1.Text+'|');
end;
end;
end;

end.
