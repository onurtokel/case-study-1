program HL7toJSONConverter;

uses
  Vcl.Forms,
  Frm_Main in 'Frm_Main.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
