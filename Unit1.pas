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
  openDialog : TOpenDialog;    // Переменная OpenDialog
begin
  // Создание объекта OpenDialog - назначение на нашу переменную OpenDialog
  openDialog := TOpenDialog.Create(self);

  // Установка начального каталога, чтобы сделать его текущим
  openDialog.InitialDir := GetCurrentDir;

  // Только разрешенные существующие файлы могут быть выбраны
  openDialog.Options := [ofFileMustExist];

  // Разрешено выбрать только .dpr и .pas файлы
  openDialog.Filter :=
    'TXT files|*.txt';

  // Выбор файлов Паскаля как стартовый тип фильтра
  openDialog.FilterIndex := 1;

  // Показ диалог открытия файла
  if openDialog.Execute
  then Memo1.Lines.LoadFromFile(openDialog.FileName);

  // Освобождение диалога
  openDialog.Free;
end;

end.
