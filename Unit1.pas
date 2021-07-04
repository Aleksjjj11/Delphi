unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Image3: TImage;
    Button1: TButton;
    LeftButton: TButton;
    RightButton: TButton;
    PlusWagonButton: TButton;
    MinusWagonButton: TButton;
    LoopButton: TButton;
    Block1: TPanel;
    Block2: TPanel;
    Block3: TPanel;
    Block4: TPanel;
    Block5: TPanel;
    Block6: TPanel;
    Block7: TPanel;
    Block8: TPanel;
    Block9: TPanel;
    Block10: TPanel;
    Block11: TPanel;
    Block12: TPanel;
    Car1: TPanel;
    Car2: TPanel;
    Car3: TPanel;
    SaveButton: TButton;
    ResetButton: TButton;
    MinLoop: TEdit;
    MaxLoop: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure RightButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ResetButtonClick(Sender: TObject);
  private
    { Private declarations }
    //procedure CheckEnableLoop();
  public
    { Public declarations }
    pBlocks1 : Array[1..5] of integer;
    pBlocks2 : Array[1..5] of integer;
    pBlocksDeadLock : Array[1..2] of integer;
    BlocksInWay : Array[1..2] of integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Image1.Visible := not Image1.Visible;
  Image3.Visible := not Image3.Visible;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 5 do
    pBlocks1[I] := I;
end;

procedure TForm1.ResetButtonClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 5 do
  begin
    pBlocks1[I] := I;
    pBlocks2[I] := 0;
  end;

  for I := 1 to 2 do
  begin
    pBlocksDeadLock[I] := 0;
    BlocksInWay[I] := 0;
  end;

  Block6.Visible := false;
  Block6.Caption := '';
  Block7.Visible := false;
  Block7.Caption := '';
  Block8.Visible := false;
  Block8.Caption := '';
  Block9.Visible := false;
  Block9.Caption := '';
  Block10.Visible := false;
  Block10.Caption := '';
  Block11.Visible := false;
  Block11.Caption := '';
  Block12.Visible := false;
  Block12.Caption := '';

  Block1.Visible := true;
  Block1.Caption := '1';
  Block2.Visible := true;
  Block2.Caption := '2';
  Block3.Visible := true;
  Block3.Caption := '3';
  Block4.Visible := true;
  Block4.Caption := '4';
  Block5.Visible := true;
  Block5.Caption := '5';

  Car1.Visible := true;
  Car2.Visible := false;
  Car3.Visible := false;

  Image1.Visible := true;
  Image3.Visible := false;

  PlusWagonButton.Enabled := false;
  MinusWagonButton.Enabled := false;
  RightButton.Enabled := false;
end;

procedure TForm1.RightButtonClick(Sender: TObject);
begin
  RightButton.Enabled := false;
  MinusWagonButton.Enabled := false;

end;

end.
