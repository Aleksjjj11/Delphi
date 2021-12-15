unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  Form2: TForm2;
  arr: array of integer;
  Low, High, l, p, r: integer;

implementation

procedure QuickSort(var A: array of integer; Lo, Hi: integer);
var l, r, p, tmp: integer;
Begin
 l := Lo;
 r := Hi;
 p := A[(l + r) div 2];
 repeat
   while A[l] < p do
   begin
    inc(l);
            Form2.Panel1.Caption := '';
   end;

   while A[r] > p do
   begin
    dec(r);
   end;

   if l <= r
    then begin
          if A[l] > A[r]
           then begin

                 tmp := A[l]; A[l] := A[r]; A[r] := tmp;
                  end;
          inc(l);
          dec(r);
         end;
 until l >= r;
 if Lo < r then QuickSort(A, Lo, r);
 if l < Hi then QuickSort(A, l, Hi);
end;



{$R *.dfm}


procedure SetLeftFlag(oldIndex, newIndex: integer);
begin
case oldIndex of
  0: Form2.Panel6.Visible := false;
  1: Form2.Panel8.Visible := false;
  2: Form2.Panel10.Visible := false;
  3: Form2.Panel12.Visible := false;
  4: Form2.Panel14.Visible := false;
end;

case newIndex of
  0: Form2.Panel6.Visible := true;
  1: Form2.Panel8.Visible := true;
  2: Form2.Panel10.Visible := true;
  3: Form2.Panel12.Visible := true;
  4: Form2.Panel14.Visible := true;
end;

end;

procedure SetRightFlag(oldIndex, newIndex: integer);
begin
case oldIndex of
  0: Form2.Panel7.Visible := false;
  1: Form2.Panel9.Visible := false;
  2: Form2.Panel11.Visible := false;
  3: Form2.Panel13.Visible := false;
  4: Form2.Panel15.Visible := false;
end;

case newIndex of
  0: Form2.Panel7.Visible := true;
  1: Form2.Panel9.Visible := true;
  2: Form2.Panel11.Visible := true;
  3: Form2.Panel13.Visible := true;
  4: Form2.Panel15.Visible := true;
end;
end;

procedure SetColorByIndex(index: integer);
begin
//case index of
//  0: Form2.Panel1.Color := clRed;
//  1: Form2.Panel2.Color := clRed;
//  2: Form2.Panel3.Color := clRed;
//  3: Form2.Panel4.Color := clRed;
//  4: Form2.Panel5.Color := clRed;
//end;
Form2.Panel1.Color := clRed;
  Form2.Panel2.Color := clRed;
  Form2.Panel3.Color := clRed;
  Form2.Panel4.Color := clRed;
  Form2.Panel5.Color := clRed;
end;

procedure TForm2.Button2Click(Sender: TObject);
var tmp: integer;
begin
SetColorByIndex(1);
              SetColorByIndex(3);
              exit();
  if (arr[l] < p) then
  begin
       inc(l);
       SetLeftFlag(l-1, l);
       exit();
  end;

   if (arr[r] > p) then
   begin
    dec(r);
    SetRightFlag(r+1, r);
    exit();
   end;

   if (l <= r)
    then begin
          if arr[l] > arr[r]
           then begin
              SetColorByIndex(l);
              SetColorByIndex(r);
              tmp := arr[l];
              arr[l] := arr[r];
              arr[r] := tmp;
           end;

          SetLeftFlag(l-1, l);
          inc(l);
          SetRightFlag(r+1, r);
          dec(r);
         end;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  arr := [5,3,4,2,1];
  Low := 0;
  High := 4;
  l:= Low;
  r:= High;
  p := arr[(l + r) div 2];

  Panel1.Caption := IntToStr(arr[0]);
  Panel2.Caption := IntToStr(arr[1]);
  Panel3.Caption := IntToStr(arr[2]);
  Panel4.Caption := IntToStr(arr[3]);
  Panel5.Caption := IntToStr(arr[4]);


end;

end.
