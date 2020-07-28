unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, ImgList, Menus;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    StatusBar1: TStatusBar;
    Button1: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Memo1: TMemo;
    Memo2: TMemo;
    CheckBox1: TCheckBox;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  formattedDateTime : string;
begin
DateTimeToString(formattedDateTime, 'yymmdd_hh-mm-ss', Now);
DateTimeToString(formattedDateTime, 'yy/mm/dd hh-mm-ss', Now);
  //RichEdit2.SelAttributes.Size:=16;
  //RichEdit2.SelAttributes.Color:=clGreen;
  //RichEdit2.SelAttributes.Style:=[fsBold];
  Memo1.Text := Memo1.Text + Memo2.Text;
  Memo1.Lines.Add(#13#10);
  Memo1.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + formattedDateTime + '.txt');
  if CheckBox1.Checked then
    Memo2.Clear;
end;

procedure AddToMainText(RTF_From: TRichEdit; RTF_To: TRichEdit);
var
  MemoryStream, MemoryStreamOld: TMemoryStream;
begin
  MemoryStream := TMemoryStream.Create;
  MemoryStreamOld := TMemoryStream.Create;
  try
    RTF_From.Lines.SaveToStream(MemoryStream);
    RTF_To.Lines.LoadFromStream(MemoryStreamOld);
    MemoryStream.Seek(0, soFromBeginning);
    RTF_To.Lines.LoadFromStream(MemoryStream);
  finally
    MemoryStream.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
  Memo2.Clear;
end;

procedure TForm1.N2Click(Sender: TObject);
var
  openDialog : TOpenDialog;    // ���������� OpenDialog
begin
  // �������� ������� OpenDialog - ���������� �� ���� ���������� OpenDialog
  openDialog := TOpenDialog.Create(self);

  // ��������� ���������� ��������, ����� ������� ��� �������
  openDialog.InitialDir := GetCurrentDir;

  // ������ ����������� ������������ ����� ����� ���� �������
  openDialog.Options := [ofFileMustExist];

  // ��������� ������� ������ .dpr � .pas �����
  openDialog.Filter :=
    'TXT files|*.txt';

  // ����� ������ ������� ��� ��������� ��� �������
  openDialog.FilterIndex := 1;

  // ����� ������ �������� �����
  if openDialog.Execute
  then Memo1.Lines.LoadFromFile(openDialog.FileName);

  // ������������ �������
  openDialog.Free;
end;

end.
