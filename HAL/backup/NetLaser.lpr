program NetLaser;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, LaserListen, LResources, lnetvisual, TAChartLazarusPkg
  { you can add units after this };

{$IFDEF WINDOWS}{$R NetLaser.rc}{$ENDIF}

begin
  {$I NetLaser.lrs}
  Application.Initialize;
  Application.CreateForm(TFLaserListen, FLaserListen);
  Application.Run;
end.
