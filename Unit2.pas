unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ImgList, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Buttons, inifiles;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    N2: TMenuItem;
    ListView1: TListView;
    ImageList1: TImageList;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    TrayIcon1: TTrayIcon;
    PopupMenu2: TPopupMenu;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    ImageList2: TImageList;
    N1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  ini:tinifile;
implementation

{$R *.dfm}

uses Unit1, Unit3, Unit4, Unit5, Unit6, Unit7, Unit9, Unit10;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
ini:=tinifile.Create(ExtractFilePath(application.ExeName)+'settings.ini');
ini.WriteInteger('General','Left',form2.Left);
ini.WriteInteger('General','Top',form2.Top);
ini.Free;
end;

procedure TForm2.ListView1DblClick(Sender: TObject);
var
s:string;
begin
if listview1.ItemIndex=-1 then
begin
  exit;
end;
if listview1.ItemIndex=0 then
begin
  form3.Show;
  listview1.Items[0].ImageIndex:=6;
  Exit;
end;


s:=listview1.Items[listview1.ItemIndex].Caption;
if listview1.Items[listview1.ItemIndex].ImageIndex=7 then
begin
 listview1.Items[listview1.ItemIndex].ImageIndex:=StrToInt(form1.ids.Lines.Strings[listview1.ItemIndex]);
 if form4.Edit1.Text=s then
 begin
 form4.Show;
 Exit;
 end;
  if form5.Edit1.Text=s then
 begin
 form5.Show;
 Exit;
 end;


 end;

 if (form4.Edit1.Text='') or (form4.Edit1.Text=s) then
 begin
   form4.Edit1.Text:=s;
   form4.Edit2.Text:=form1.Edit1.Text;
   form4.Caption:='������ � '+s;
   form4.Show;
   Exit;
 end;

  if (form5.Edit1.Text='') or (form4.Edit1.Text=s)then
 begin
   form5.Edit1.Text:=s;
   form5.Edit2.Text:=form1.Edit1.Text;
   form5.Caption:='������ � '+s;
   form5.Show;
   Exit;
 end;

   if (form6.Edit1.Text='') or (form4.Edit1.Text=s)then
 begin
   form6.Edit1.Text:=s;
   form6.Edit2.Text:=form1.Edit1.Text;
   form6.Caption:='������ � '+s;
   form6.Show;
   Exit;
 end;

    if (form7.Edit1.Text='')or (form4.Edit1.Text=s) then
 begin
   form7.Edit1.Text:=s;
   form7.Edit2.Text:=form1.Edit1.Text;
   form7.Caption:='������ � '+s;
   form7.Show;
   Exit;
 end;

end;

procedure TForm2.N10Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm2.N11Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm2.N1Click(Sender: TObject);
begin
form10.show;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
form9.show;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
n3.Default:=true;
bitbtn1.Caption:=n3.Caption;
form1.Client.Socket.SendText('#CH'+'6'+form1.Edit1.Text+'|')
end;

procedure TForm2.N4Click(Sender: TObject);
begin
n4.Default:=true;
bitbtn1.Caption:=n4.Caption;
form1.Client.Socket.SendText('#CH'+'2'+form1.Edit1.Text+'|')
end;

procedure TForm2.N5Click(Sender: TObject);
begin
n5.Default:=true;
bitbtn1.Caption:=n5.Caption;
form1.Client.Socket.SendText('#CH'+'1'+form1.Edit1.Text+'|')
end;

procedure TForm2.N6Click(Sender: TObject);
begin
n6.Default:=true;
bitbtn1.Caption:=n6.Caption;
form1.Client.Socket.SendText('#CH'+'3'+form1.Edit1.Text+'|')
end;

procedure TForm2.N7Click(Sender: TObject);
begin
n7.Default:=true;
bitbtn1.Caption:=n7.Caption;
form1.Client.Socket.SendText('#CH'+'0'+form1.Edit1.Text+'|')
end;

procedure TForm2.N8Click(Sender: TObject);
begin
n8.Default:=true;
bitbtn1.Caption:=n8.Caption;
form1.Client.Socket.SendText('#CH'+'4'+form1.Edit1.Text+'|')
end;

procedure TForm2.N9Click(Sender: TObject);
begin
form2.Show;
end;

procedure TForm2.TrayIcon1Click(Sender: TObject);
begin
hide;
form2.Show;
end;

procedure TForm2.TrayIcon1DblClick(Sender: TObject);
begin
hide;
form2.Show;
end;

end.
