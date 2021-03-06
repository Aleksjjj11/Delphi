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
    ListBox1: TListBox;
    ListBox2: TListBox;
    ModeCheckBox: TCheckBox;
    ExecuteButton: TButton;
    procedure Button1Click(Sender: TObject);
    procedure RightButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ResetButtonClick(Sender: TObject);
    procedure LeftButtonClick(Sender: TObject);
    procedure PlusWagonButtonClick(Sender: TObject);
    procedure MinusWagonButtonClick(Sender: TObject);
    procedure LoopButtonClick(Sender: TObject);
    procedure ModeCheckBoxClick(Sender: TObject);
    procedure ExecuteButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
  private
    { Private declarations }
    needLogCommands : boolean;
    isExecuting : boolean;
    hasError : boolean;
  public
    { Public declarations }
    pBlocks1 : Array[1..5] of integer;
    pBlocks2 : Array[1..5] of integer;
    pBlocksDeadLock : Array[1..2] of integer;
    QP1, QP2, QCar : integer;
  end;
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if needLogCommands then
  begin
    ListBox1.Items.Add('C');
    if Sender <> nil then
      ListBox2.Items.AddPair(IntToStr(ListBox2.Count+1), 'C');
  end;

  ModeCheckBox.Enabled := false;

  if (ModeCheckBox.Checked = false) and (isExecuting = false) then
    exit;

  Image1.Visible := not Image1.Visible;
  Image3.Visible := not Image3.Visible;
end;

procedure TForm1.ExecuteButtonClick(Sender: TObject);
var I : integer;
begin
  needLogCommands := false;
  isExecuting := true;

  for I := 0 to ListBox1.Count - 1 do
  begin
    if ListBox1.Items[I] = '+' then PlusWagonButtonClick(nil)
    else if ListBox1.Items[I] = '-' then MinusWagonButtonClick(nil)
    else if ListBox1.Items[I] = '?' then LeftButtonClick(nil)
    else if ListBox1.Items[I] = '?' then RightButtonClick(nil)
    else if ListBox1.Items[I] = 'C' then Button1Click(nil);

    if hasError then
    begin
      ShowMessage('????????? ?????? ??? ?????????? ???????? ??? ??????? ' + IntToStr(I+1) + ', ????????? ???????????');
      Break;
    end;

    Sleep(200);
  end;

  needLogCommands := true;
  isExecuting := false;

  PlusWagonButton.Enabled := false;
  MinusWagonButton.Enabled := false;
  LeftButton.Enabled := false;
  Button1.Enabled := false;
  RightButton.Enabled := false;
  LoopButton.Enabled := false;
  ExecuteButton.Enabled := false;

  if hasError = false then
    ShowMessage('????????? ?????????, ?? ?????? ????????? ?????????, ???? ???????? ????? ????? ?????? "?????"');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 5 do
    pBlocks1[I] := I;

  QP1 := 5;
  QP2 := 0;
  QCar := 0;

  needLogCommands := true;
  isExecuting := false;
end;

procedure TForm1.LeftButtonClick(Sender: TObject);
var
  I: Integer;
begin

  if needLogCommands then
  begin
    ListBox1.Items.Add('?');
    if Sender <> nil then
      ListBox2.Items.AddPair(IntToStr(ListBox2.Count+1), '?');
  end;

  ModeCheckBox.Enabled := false;

  if (ModeCheckBox.Checked = false) and (isExecuting = false) then
    exit;

  if (car2.Visible) or (car3.Visible) then
  begin
    hasError := true;
    exit;
  end;

  RightButton.Enabled := true;
  MinusWagonButton.Enabled := true;
  LeftButton.Enabled := false;
  Button1.Enabled := false;

  if Image1.Visible then
  begin
    if (QP1 > 0) and (QCar < 2) then
      PlusWagonButton.Enabled := true;

    Car2.Visible := true;

    for I := 1 to QCar do
    begin
      case QP1 + I of
        1:begin
          Block1.Color := clNavy;
          Block1.Visible := true;
          Block1.Caption := IntToStr(pBlocksDeadLock[I]);
        end;

        2:begin
          Block2.Color := clNavy;
          Block2.Visible := true;
          Block2.Caption := IntToStr(pBlocksDeadLock[I]);
        end;
        3:begin
          Block3.Color := clNavy;
          Block3.Visible := true;
          Block3.Caption := IntToStr(pBlocksDeadLock[I]);
        end;
        4:begin
          Block4.Color := clNavy;
          Block4.Visible := true;
          Block4.Caption := IntToStr(pBlocksDeadLock[I]);
        end;
        5:begin
          Block5.Color := clNavy;
          Block5.Visible := true;
          Block5.Caption := IntToStr(pBlocksDeadLock[I]);
        end;
      end;

      pBlocks1[QP1 + I] := pBlocksDeadLock[I];
      pBlocksDeadLock[I] := 0;
    end;
  end
  else
  begin
    if (QP2 > 0) and (QCar < 2) then
      PlusWagonButton.Enabled := true;

    Car3.Visible := true;

    for I := 1 to QCar do
    begin
      case QP2 + I of
        1:begin
          Block6.Color := clNavy;
          Block6.Visible := true;
          Block6.Caption := IntToStr(pBlocksDeadLock[I]);
        end;

        2:begin
          Block7.Color := clNavy;
          Block7.Visible := true;
          Block7.Caption := IntToStr(pBlocksDeadLock[I]);
        end;
        3:begin
          Block8.Color := clNavy;
          Block8.Visible := true;
          Block8.Caption := IntToStr(pBlocksDeadLock[I]);
        end;
        4:begin
          Block9.Color := clNavy;
          Block9.Visible := true;
          Block9.Caption := IntToStr(pBlocksDeadLock[I]);
        end;
        5:begin
          Block10.Color := clNavy;
          Block10.Visible := true;
          Block10.Caption := IntToStr(pBlocksDeadLock[I]);
        end;
      end;

      pBlocks2[QP2 + I] := pBlocksDeadLock[I];
      pBlocksDeadLock[I] := 0;
    end;
  end;

  car1.Visible := false;

  for I := QCar downto 1 do
    begin
      if I = QCar then
      begin
        Block12.Caption := IntToStr(pBlocksDeadLock[I]);
        Block12.Visible := false;
      end
      else
      begin
        Block11.Caption := IntToStr(pBlocksDeadLock[I]);
        Block11.Visible := false;
      end;
    end;

  for I := 1 to 5 do
    if pBlocks2[I] <> I then
      break;




  if I = 6 then
    ShowMessage('??????!!!');

end;

procedure TForm1.LoopButtonClick(Sender: TObject);
var I : integer;
begin
  for I := StrToInt(minLoop.Text) to StrToInt(maxLoop.Text) do
  begin
    if ListBox1.Items[I] = '+' then PlusWagonButtonClick(nil);
    if ListBox1.Items[I] = '-' then MinusWagonButtonClick(nil);
    if ListBox1.Items[I] = '?' then LeftButtonClick(nil);
    if ListBox1.Items[I] = '?' then RightButtonClick(nil);
    if ListBox1.Items[I] = 'C' then Button1Click(nil);
  end;

  ListBox2.Items.AddPair(IntToStr(ListBox2.Count+1), '?' + ' ' + minLoop.Text + ' ' + maxLoop.Text);
end;

procedure TForm1.MinusWagonButtonClick(Sender: TObject);
begin
  if needLogCommands then
  begin
    ListBox1.Items.Add('-');
    if Sender <> nil then
      ListBox2.Items.AddPair(IntToStr(ListBox2.Count+1), '-');
  end;

  ModeCheckBox.Enabled := false;

  if (ModeCheckBox.Checked = false) and (isExecuting = false) then
    exit;

  if Car2.Visible then
  begin
    if QCar > 0 then
      begin
        QCar := QCar - 1;
        QP1 := QP1 + 1;

        case QP1 of
          1: Block1.Color := clPurple;
          2: Block2.Color := clPurple;
          3: Block3.Color := clPurple;
          4: Block4.Color := clPurple;
          5: Block5.Color := clPurple;
        end;
      end
      else
      begin
        ShowMessage('??????? ?????????? ?????????');
        hasError := true;
        exit;
      end;

  end
  else
  begin
    if QCar > 0 then
      begin
        QCar := QCar - 1;
        QP2 := QP2 + 1;

        case QP2 of
          1: Block6.Color := clPurple;
          2: Block7.Color := clPurple;
          3: Block8.Color := clPurple;
          4: Block9.Color := clPurple;
          5: Block10.Color := clPurple;
        end;
      end
      else
      begin
        ShowMessage('??????? ?????????? ?????????');
        hasError := true;
        exit;
      end;
  end;
end;

procedure TForm1.ModeCheckBoxClick(Sender: TObject);
begin
  ExecuteButton.Enabled := not ModeCheckBox.Checked;

  if ModeCheckBox.Checked = false then
  begin
    PlusWagonButton.Enabled := true;
    MinusWagonButton.Enabled := true;
    ResetButton.Enabled := true;
    LeftButton.Enabled := true;
    RightButton.Enabled := true;
    LoopButton.Enabled := true;
  end;
end;

procedure TForm1.PlusWagonButtonClick(Sender: TObject);
begin
  if needLogCommands then
  begin
    ListBox1.Items.Add('+');
    if Sender <> nil then
      ListBox2.Items.AddPair(IntToStr(ListBox2.Count+1), '+');
  end;

  ModeCheckBox.Enabled := false;

  if (ModeCheckBox.Checked = false) and (isExecuting = false) then
    exit;

  if Car2.Visible then
  begin
    if (QP1 > 0) and (QCar < 2) then
      begin
        case QP1 of
          1: Block1.Color := clNavy;
          2: Block2.Color := clNavy;
          3: Block3.Color := clNavy;
          4: Block4.Color := clNavy;
          5: Block5.Color := clNavy;
        end;

        QCar := QCar + 1;
        QP1 := QP1 - 1;
      end
      else
      begin
        ShowMessage('??????? ?????????? ?????????');
        hasError := true;
        exit;
      end;
  end
  else
  begin
    if (QP2 > 0) and (QCar < 2) then
      begin
        case QP2 of
          1: Block6.Color := clNavy;
          2: Block7.Color := clNavy;
          3: Block8.Color := clNavy;
          4: Block9.Color := clNavy;
          5: Block10.Color := clNavy;
        end;

        QCar := QCar + 1;
        QP2 := QP2 - 1;
      end
      else
      begin
        ShowMessage('??????? ?????????? ?????????');
        hasError := true;
        exit;
      end;
  end;
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
  end;

  QP1 := 5;
  QP2 := 0;
  QCar := 0;

  Block1.Color := clPurple;
  Block2.Color := clPurple;
  Block3.Color := clPurple;
  Block4.Color := clPurple;
  Block5.Color := clPurple;
  Block6.Color := clPurple;
  Block7.Color := clPurple;
  Block8.Color := clPurple;
  Block9.Color := clPurple;
  Block10.Color := clPurple;

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
  LeftButton.Enabled := true;
  Button1.Enabled := true;

  ListBox1.Items.Clear();
  ListBox2.Items.Clear();

  ModeCheckBox.Enabled := true;
  ModeCheckBox.Checked := true;

  ExecuteButton.Enabled := false;

  hasError := false;
end;

procedure TForm1.RightButtonClick(Sender: TObject);
var
  I: Integer;
begin
  if needLogCommands then
  begin
    ListBox1.Items.Add('?');
    if Sender <> nil then
      ListBox2.Items.AddPair(IntToStr(ListBox2.Count+1), '?');
  end;

  ModeCheckBox.Enabled := false;

  if (ModeCheckBox.Checked = false) and (isExecuting = false) then
    exit;

  if car1.Visible then
  begin
    hasError := true;
    exit;
  end;

  RightButton.Enabled := false;
  MinusWagonButton.Enabled := false;
  PlusWagonButton.Enabled := false;
  LeftButton.Enabled := true;
  Button1.Enabled := true;

  if Image1.Visible then
  begin
    Car2.Visible := false;

    for I := 1 to QCar do
    begin
      case QP1 + I of
        1: Block1.Visible := false;
        2: Block2.Visible := false;
        3: Block3.Visible := false;
        4: Block4.Visible := false;
        5: Block5.Visible := false;
      end;

      pBlocksDeadLock[I] := pBlocks1[QP1 + I];
      pBlocks1[QP1 + I] := 0;
    end;
  end
  else
  begin
    Car3.Visible := false;

    for I := 1 to QCar do
    begin
      case QP2 + I of
        1: Block6.Visible := false;
        2: Block7.Visible := false;
        3: Block8.Visible := false;
        4: Block9.Visible := false;
        5: Block10.Visible := false;
      end;

      pBlocksDeadLock[I] := pBlocks2[QP2 + I];
      pBlocks2[QP2 + I] := 0;
    end;
  end;

  car1.Visible := true;

  for I := QCar downto 1 do
    begin
      if I = QCar then
      begin
        Block12.Caption := IntToStr(pBlocksDeadLock[I]);
        Block12.Visible := true;
      end
      else
      begin
        Block11.Caption := IntToStr(pBlocksDeadLock[I]);
        Block11.Visible := true;
      end;
    end;
end;

procedure TForm1.SaveButtonClick(Sender: TObject);
begin
  ListBox2.Items.SaveToFile('Save.txt');
  ShowMessage('?????????');
end;

end.
