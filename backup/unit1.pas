unit Unit1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  LR_Class, LR_DBSet, ZConnection, ZDataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    Udalit: TButton;
    Otmena: TButton;
    Filter: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    EditFilter: TEdit;
    ZConnection1: TZConnection;
    ZTable1: TZTable;
    procedure Button1Click(Sender: TObject);
    procedure UdalitClick(Sender: TObject);
    procedure OtmenaClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure EditFilterChange(Sender: TObject);
    procedure FilterClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.OtmenaClick(Sender: TObject);
begin
  DataSource1.DataSet.Filtered := False;
  DataSource1.DataSet.Filter := '';
end;

procedure TForm1.UdalitClick(Sender: TObject);
begin
  if not DataSource1.DataSet.IsEmpty then
  begin
    if MessageDlg('Подтвердите удаление', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        DataSource1.DataSet.Delete;
      except
        on E: Exception do
          ShowMessage('Ошибка при удалении записи: ' + E.Message);
      end;
    end;
  end
  else
  begin
    ShowMessage('Нет записей для удаления');
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  frReport1.LoadFromFile(ExtractFilePath(ParamStr(0))+'Безымянный.lrf');
  frReport1.ShowReport;
end;

procedure TForm1.EditFilterChange(Sender: TObject);
begin

end;

procedure TForm1.FilterClick(Sender: TObject);
begin
  if Trim(EditFilter.Text) <> '' then
  begin
    DataSource1.DataSet.Filter := EditFilter.Text;
    DataSource1.DataSet.Filtered := True;
  end
  else
    ShowMessage('Введите условие для фильтрации!');
end;

end.

