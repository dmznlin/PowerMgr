program MIT;

uses
  FastMM4,
  Vcl.Forms,
  UFormMain in 'UFormMain.pas' {fFormMain},
  UDataModule in 'UDataModule.pas' {FDM: TDataModule},
  UStyleModule in '..\Common\UStyleModule.pas' {FSM: TDataModule},
  UFormGetServer in 'UFormGetServer.pas' {fFormGetServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFDM, FDM);
  Application.CreateForm(TFSM, FSM);
  Application.CreateForm(TfFormMain, fFormMain);
  Application.Run;
end.
