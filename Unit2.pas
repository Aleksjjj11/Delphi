unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdThreadComponent;

type
  TForm2 = class(TForm)
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
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    IdThreadComponent1: TIdThreadComponent;
    procedure Button4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure IdThreadComponent1Run(Sender: TIdThreadComponent);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }

  public
    { Public declarations }
    procedure SetLeftFlag(newIndex: integer);
    procedure SetRightFlag(newIndex: integer);
    procedure SetColorByIndex(index: integer);
    procedure SetYellowColorByIndex(index: integer);
    procedure UpdateArrayPanels(arr2: array of integer);
    procedure ResetPanelColors();
  end;

var
  Form2: TForm2;
  arr: array of integer;
  Low, High, stepCounter: integer;
  isLeftDone, canSort: Boolean;

implementation

procedure QuickSort(var A: array of integer; Lo, Hi: integer);
var l, r, p, tmp: integer;
Begin
 l := Lo;
 r := Hi;
 p := A[(l + r) div 2];
Form2.UpdateArrayPanels(A);
 repeat
    Sleep(300);
    Form2.ResetPanelColors();
    Form2.UpdateArrayPanels(A);
    Form2.SetLeftFlag(l);
    Form2.SetRightFlag(r);
     while arr[l] < p do
     begin
      inc(l);
      inc(stepCounter);
      Form2.Label1.Caption := Form2.Label1.Caption + 'Шаг '
      + IntToStr(stepCounter) + ' двигаем левую границу на значение ' + IntToStr(l) + #13#10;
      Form2.ResetPanelColors();
      Form2.UpdateArrayPanels(A);
      Form2.SetLeftFlag(l);
      Form2.SetRightFlag(r);
      Sleep(700);
     end;

     while A[r] > p do
     begin
      dec(r);
      inc(stepCounter);
      Form2.Label1.Caption := Form2.Label1.Caption + 'Шаг '
      + IntToStr(stepCounter) + ' двигаем правую границу на значение ' + IntToStr(r) + #13#10;
      Form2.ResetPanelColors();
      Form2.UpdateArrayPanels(A);
      Form2.SetLeftFlag(l);
      Form2.SetRightFlag(r);
      Sleep(700);
     end;

     if l <= r
      then begin
            if A[l] > A[r]
             then begin
                Form2.SetColorByIndex(l);
                Form2.SetColorByIndex(r);
                inc(stepCounter);
                Form2.Label1.Caption := Form2.Label1.Caption + 'Шаг '
                + IntToStr(stepCounter) + ' меняем числа на индексах ' + IntToStr(l)
                + ' и ' + IntToStr(r) + ' местами'#13#10;
                Sleep(700);
                tmp := A[l];
                A[l] := A[r];
                A[r] := tmp;

                Form2.SetYellowColorByIndex(l);
                Form2.SetYellowColorByIndex(r);
                Form2.UpdateArrayPanels(A);
                Sleep(700);
                Form2.ResetPanelColors();
             end;
            inc(l);
            Form2.SetLeftFlag(l);
            inc(stepCounter);
            Form2.Label1.Caption := Form2.Label1.Caption + 'Шаг '
            + IntToStr(stepCounter) + ' двигаем левую границу на значение ' + IntToStr(l) + #13#10;
            Sleep(700);


            dec(r);
            Form2.SetRightFlag(r);
            inc(stepCounter);
            Form2.Label1.Caption := Form2.Label1.Caption + 'Шаг '
            + IntToStr(stepCounter) + ' двигаем правую границу на значение ' + IntToStr(r) + #13#10;
            Sleep(700);
     end;
 until l >= r;
 Sleep(700);
 if Lo < r then QuickSort(A, Lo, r);
 if l < Hi then QuickSort(A, l, Hi);

 Form2.IdThreadComponent1.Stop;
end;



{$R *.dfm}


procedure TForm2.SetLeftFlag(newIndex: integer);
begin
  Form2.Panel6.Visible := false;
  Form2.Panel8.Visible := false;
  Form2.Panel10.Visible := false;
  Form2.Panel12.Visible := false;
  Form2.Panel14.Visible := false;

case newIndex of
  0: Form2.Panel6.Visible := true;
  1: Form2.Panel8.Visible := true;
  2: Form2.Panel10.Visible := true;
  3: Form2.Panel12.Visible := true;
  4: Form2.Panel14.Visible := true;
end;
     Form2.Refresh;
end;

procedure TForm2.SetRightFlag(newIndex: integer);
begin
  Form2.Panel7.Visible := false;
  Form2.Panel9.Visible := false;
  Form2.Panel11.Visible := false;
  Form2.Panel13.Visible := false;
  Form2.Panel15.Visible := false;

case newIndex of
  0: Form2.Panel7.Visible := true;
  1: Form2.Panel9.Visible := true;
  2: Form2.Panel11.Visible := true;
  3: Form2.Panel13.Visible := true;
  4: Form2.Panel15.Visible := true;
end;
Form2.Refresh;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  canSort := True;
end;

procedure TForm2.ScrollBar1Change(Sender: TObject);
begin
  Label1.Top := ScrollBar1.Position;
end;

procedure TForm2.SetColorByIndex(index: integer);
begin
case index of
  0: Form2.Panel1.Color := clRed;
  1: Form2.Panel2.Color := clRed;
  2: Form2.Panel3.Color := clRed;
  3: Form2.Panel4.Color := clRed;
  4: Form2.Panel5.Color := clRed;
end;
     Form2.Refresh;
end;

procedure TForm2.SetYellowColorByIndex(index: integer);
begin
case index of
  0: Form2.Panel1.Color := clYellow;
  1: Form2.Panel2.Color := clYellow;
  2: Form2.Panel3.Color := clYellow;
  3: Form2.Panel4.Color := clYellow;
  4: Form2.Panel5.Color := clYellow;
end;
     Form2.Refresh;
end;

procedure TForm2.UpdateArrayPanels(arr2: array of integer);
begin
  Form2.Panel1.Caption := IntToStr(arr2[0]);
  Form2.Panel2.Caption := IntToStr(arr2[1]);
  Form2.Panel3.Caption := IntToStr(arr2[2]);
  Form2.Panel4.Caption := IntToStr(arr2[3]);
  Form2.Panel5.Caption := IntToStr(arr2[4]);
  Form2.Refresh;
end;

procedure TForm2.ResetPanelColors();
begin
  Form2.Panel1.Color := clWhite;
  Form2.Panel2.Color := clWhite;
  Form2.Panel3.Color := clWhite;
  Form2.Panel4.Color := clWhite;
  Form2.Panel5.Color := clWhite;
  Form2.Refresh;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  IdThreadComponent1.Start;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
IdThreadComponent1.Stop;
end;

procedure TForm2.IdThreadComponent1Run(Sender: TIdThreadComponent);
begin
  arr := [5,3,4,2,1];
  Low := 0;
  High := 4;
  stepCounter := 0;
  Label1.Caption := '';
  QuickSort(arr, Low, High);
end;

end.
