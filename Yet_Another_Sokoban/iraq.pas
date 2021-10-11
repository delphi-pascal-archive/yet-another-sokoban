unit iraq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    found: TStaticText;
    must: TStaticText;
    Label1: TLabel;
    nowlev: TLabel;
    Label2: TLabel;
    dg: TDrawGrid;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure dgDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
  procedure LEVEL(xlev:integer);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

var man:Record
x,y,
mustbox,
boxfound:integer;
state:integer;
ready,editing:boolean;
end;
var bmp0,bmp1,bmp2,bmp3,bmp4,bmp5,bmp6:TBitmap;
{$R *.dfm}
var lev:array[0..19,0..14] of INTEGER;

procedure TForm1.dgDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
case lev[acol,arow] of
0:dg.Canvas.Draw(acol*30{+acol},arow*30{+arow},bmp0);
1:dg.Canvas.Draw(acol*30{+acol},arow*30{+arow},bmp1);
2:dg.Canvas.Draw(acol*30{+acol},arow*30{+arow},bmp2);
3:dg.Canvas.Draw(acol*30{+acol},arow*30{+arow},bmp3);
4:dg.Canvas.Draw(acol*30{+acol},arow*30{+arow},bmp4);
5:dg.Canvas.Draw(acol*30{+acol},arow*30{+arow},bmp5);
6:dg.Canvas.Draw(acol*30{+acol},arow*30{+arow},bmp6);
end;
end;

procedure TForm1.LEVEL(xlev:integer);
var  T:TextFile;s:string;  i,line:integer;
begin
man.ready:=false;
line:=0;
if not FileExists(inttostr(xlev)+'.lev')
then begin
ShowMessage('ÈÃÐÀ ÏÐÎÉÄÅÍÀ!');
Exit;
end;
assignfile(t,inttostr(xlev)+'.lev');
reset(t);
repeat
readln(t,s);
for i:=1 to length(s)
do lev[I-1,LINE]:=strtoint(s[i]);
inc(line);
until eof(t);
closefile(t);
man.x:=0;
man.y:=0;
man.mustbox:=0;
man.boxfound:=0;
for i:=0 to 19 do
for line:=0 to 14
do case lev[i,line] of
2:
begin
man.x:=i;
man.y:=line;
end;
3: inc(man.mustbox);
end;
must.Caption:=inttostr(man.mustbox);
found.Caption:='0';
nowlev.Caption:=inttostr(xlev);
dg.Repaint;
showmessage('ÓÐÎÂÅÍÜ '+inttostr(xlev));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
dg.Width:=30*20;
dg.Height:=30*15;
bmp0:=TBitmap.Create;
bmp1:=TBitmap.Create;
bmp2:=TBitmap.Create;
bmp3:=TBitmap.Create;
bmp4:=TBitmap.Create;
bmp5:=TBitmap.Create;
bmp6:=TBitmap.Create;
bmp0.LoadFromFile('0.bmp');
bmp1.LoadFromFile('1.bmp');
bmp2.LoadFromFile('2.bmp');
bmp3.LoadFromFile('3.bmp');
bmp4.LoadFromFile('4.bmp');
bmp5.LoadFromFile('5.bmp');
bmp6.LoadFromFile('6.bmp');
man.state:=1;
man.ready:=false;
man.editing:=false;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
bmp0.Free;
bmp1.Free;
bmp2.Free;
bmp3.Free;
bmp4.Free;
bmp5.Free;
bmp6.Free;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
procedure moveleft;
begin
if man.x=1 then
begin
if lev[0,man.y]=0 then
man.x:=0 end else
if man.x>1 then case lev[man.x-1,man.y]
of
0:dec(man.x);
1:;
3:begin
if lev[man.x-2,man.y]=0 then begin
lev[man.x-2,man.y]:=3;DGDrawCell(self,man.x-2,man.y,rect(0,0,0,0),[]);dec(man.x);
end else if lev[man.x-2,man.y]=4 then
begin
inc(man.boxfound);
found.Caption:=inttostr(man.boxfound);
lev[man.x-2,man.y]:=0;DGDrawCell(self,man.x-2,man.y,rect(0,0,0,0),[]);dec(man.x);
end;
end;
end;


end;

procedure moveright;
begin
if man.x=18 then
begin
if lev[19,man.y]=0 then
man.x:=19 end else
if man.x<18 then case lev[man.x+1,man.y]
of
0:inc(man.x);
1:;
3:begin
if lev[man.x+2,man.y]=0 then begin
lev[man.x+2,man.y]:=3;DGDrawCell(self,man.x+2,man.y,rect(0,0,0,0),[]);inc(man.x);
end else if lev[man.x+2,man.y]=4 then
begin
inc(man.boxfound);
found.Caption:=inttostr(man.boxfound);
lev[man.x+2,man.y]:=0;DGDrawCell(self,man.x+2,man.y,rect(0,0,0,0),[]);inc(man.x);
end;
end;
end;

end;
procedure moveup;
begin
if man.y=1 then
begin
if lev[man.x,0]=0 then
man.y:=0 end else
if man.y>1 then case lev[man.x,man.y-1]
of
0:dec(man.y);
1:;
3:begin
if lev[man.x,man.y-2]=0 then begin
lev[man.x,man.y-2]:=3;DGDrawCell(self,man.x,man.y-2,rect(0,0,0,0),[]);dec(man.y);
end
else if lev[man.x,man.y-2]=4 then
begin
inc(man.boxfound);
found.Caption:=inttostr(man.boxfound);
lev[man.x,man.y-2]:=0;DGDrawCell(self,man.x,man.y-2,rect(0,0,0,0),[]);dec(man.y);
end;
end;
end;

end;
procedure movedown;
begin
if man.y=13 then
begin
if lev[man.x,14]=0 then
man.y:=14 end else
if man.y<13 then case lev[man.x,man.y+1]
of
0:inc(man.y);
1:;
3:begin
if lev[man.x,man.y+2]=0 then begin
lev[man.x,man.y+2]:=3;DGDrawCell(self,man.x,man.y+2,rect(0,0,0,0),[]);inc(man.y);
end
else if lev[man.x,man.y+2]=4 then
begin
inc(man.boxfound);
found.Caption:=inttostr(man.boxfound);
lev[man.x,man.y+2]:=0;DGDrawCell(self,man.x,man.y+2,rect(0,0,0,0),[]);inc(man.y);
end;
end;
end;
end;
begin
if not man.ready then exit;
lev[man.x,man.y]:=0;
DGDrawCell(self,man.x,man.y,rect(0,0,0,0),[]);
case key
of

vk_left:moveleft;
vk_right:moveright;
vk_up:moveup;
vk_down:movedown;
end;
lev[man.x,man.y]:=2;
DGDrawCell(self,man.x,man.y,rect(0,0,0,0),[]);
if man.boxfound=man.mustbox then
begin
showmessage('Óðîâåíü ïðîéäåí!');
inc(man.state);
level(man.state);
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
level(man.state);
man.ready:=true;
man.editing:=false;
if dg.CanFocus then dg.SetFocus;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
form1.Close;
end;

var what:integer=0;

procedure TForm1.dgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var col,row:integer;
  begin
if not man.editing then exit;
  dg.MouseToCell(x,y,col,row);
lev[col,row]:=what;
DGDrawCell(self,col,row,rect(0,0,0,0),[]);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
what:=0;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
what:=1;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
what:=2;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
what:=3;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
what:=4;
end;



procedure TForm1.Button3Click(Sender: TObject);
var  T:TextFile;s:string;  i,line:integer;
begin
man.state:=strtointdef(inputbox('Óðîâíåü','¹','1'),1);
man.ready:=false;
man.editing:=true;
line:=0;
if not FileExists(inttostr(man.state)+'.lev')
then begin
ShowMessage('Íîâûé óðîâåíü');
for i:=0 to 19 do
for line:=0 to 14
do lev[i,line]:=0;
end else begin
assignfile(t,inttostr(man.state)+'.lev');
reset(t);
repeat
readln(t,s);
for i:=1 to length(s)
do lev[I-1,LINE]:=strtoint(s[i]);
inc(line);
until eof(t);
closefile(t);
man.x:=0;
man.y:=0;
man.mustbox:=0;
man.boxfound:=0;
for i:=0 to 19 do
for line:=0 to 14
do case lev[i,line] of
2:
begin
man.x:=i;
man.y:=line;
end;
3: inc(man.mustbox);
end;
end;
must.Caption:=inttostr(man.mustbox);
found.Caption:='0';
nowlev.Caption:=inttostr(man.state);
dg.Repaint;
end;

procedure TForm1.Button9Click(Sender: TObject);
var s:string;l,i:integer;t:textfile;
begin
assignfile(t,inttostr(man.state)+'.lev');
rewrite(t);
for l:=0 to 14 do
begin
s:='';
for i:=0 to 19 do s:=s+inttostr(lev[i,l]);
writeln(t,s);
end;
closefile(t);
end;

end.
