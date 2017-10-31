unit CameraUDP;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, structs, lNetComponents,forms, state, rlan, hal, math;

var
MsgMachineState : TStringArray;
ImageCol: TIntArray;
ImageR: TIntArray;
ImageG: TIntArray;
ImageB: TIntArray;


function  UpdatePartsFromCamera(col, Red, Green, Blue :integer): TPartType;
procedure UDPCameraReceivePart();
procedure PathSelectionMission1();
procedure PathSelectionMission2();
procedure PathSelectionMission3();

implementation

uses laserloc;

function  UpdatePartsFromCamera(col, Red, Green, Blue:integer): TPartType;
var maxRGB: integer;
begin

  maxRGB:= max(Red,max(Green,Blue));
  if maxRGB=Red then begin
      result := R;
  end else if maxRGB=Green then begin
      result := G;
  end else if maxRGB=Blue then begin
      result := B;
  end else
      result := N;


end;

procedure PathSelectionMission1();
begin
  path_1[0, 0] := 0; path_1[0, 1] := 5;
  path_1[1, 0] := 1; path_1[1, 1] := 6;
  path_1[2, 0] := 2; path_1[2, 1] := 7;
  path_1[3, 0] := 3; path_1[3, 1] := 8;
  path_1[4, 0] := 4; path_1[4, 1] := 9;
end;

procedure PathSelectionMission2();
begin
  writeln('Path2');
  if PartsScript[2].PartType = G then begin  {B | G | B | B | G}   //2.35
    path_2[0, 0] := 0; path_2[0, 1] := 9;
    path_2[1, 0] := 1; path_2[1, 1] := 16;
    path_2[2, 0] := 4; path_2[2, 1] := 14;
    writeln('O Relvas é um bandido!!');
    path_2[3, 0] := 2; path_2[3, 1] := 8;
    path_2[4, 0] := 3; path_2[4, 1] := 7;
    path_2[5, 0] := 16; path_2[5, 1] := 6;
    path_2[6, 0] := 14; path_2[6, 1] := 5;
  end else if PartsScript[3].PartType = G then begin {B | B | G | B | G}   //2.22
    path_2[0, 0] := 0; path_2[0, 1] := 9;
    path_2[1, 0] := 2; path_2[1, 1] := 16;
    path_2[2, 0] := 4; path_2[2, 1] := 14;
    path_2[3, 0] := 1; path_2[3, 1] := 8;
    path_2[4, 0] := 3; path_2[4, 1] := 7;
    path_2[5, 0] := 16; path_2[5, 1] := 6;
    path_2[6, 0] := 14; path_2[6, 1] := 5;
  end else if PartsScript[4].PartType = G then begin {B | B | B | G | G}   //2.11
    path_2[0, 0] := 0; path_2[0, 1] := 9;
    path_2[1, 0] := 3; path_2[1, 1] := 16;
    path_2[2, 0] := 4; path_2[2, 1] := 14;
    path_2[3, 0] := 1; path_2[3, 1] := 8;
    path_2[4, 0] := 2; path_2[4, 1] := 7;
    path_2[5, 0] := 16; path_2[5, 1] := 6;
    path_2[6, 0] := 14; path_2[6, 1] := 5;
  end else begin
    rebuild := 1;
  end;

end;

procedure PathSelectionMission3();
begin
  writeln('PAT3');
  if (PartsScript[2].PartType = B) and (PartsScript[5].PartType = R) then begin  {B | B | G | G | R}      //2.42
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 2; path_3[1, 1] := 14;
    path_3[2, 0] := 4; path_3[2, 1] := 11;
    path_3[3, 0] := 3; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 1; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;

  end else if (PartsScript[2].PartType = B) and (PartsScript[4].PartType = R) then begin  {B | B | G | R | G}
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 2; path_3[1, 1] := 14;
    path_3[2, 0] := 3; path_3[2, 1] := 11;
    path_3[3, 0] := 4; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 1; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;

  end else if (PartsScript[2].PartType = B) and (PartsScript[3].PartType = R) then begin  {B | B | R | G | G}
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 3; path_3[1, 1] := 14;
    path_3[2, 0] := 2; path_3[2, 1] := 11;
    path_3[3, 0] := 4; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 1; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;

  end else if (PartsScript[5].PartType = B) and (PartsScript[4].PartType = R) then begin  {B | G | G | R | B}   //   20539
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 1; path_3[1, 1] := 14;
    path_3[2, 0] := 3; path_3[2, 1] := 11;
    path_3[3, 0] := 2; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 4; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;

  end else if (PartsScript[4].PartType = B) and (PartsScript[5].PartType = R) then begin  {B | G | G | B | R}
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 1; path_3[1, 1] := 14;
    path_3[2, 0] := 4; path_3[2, 1] := 11;
    path_3[3, 0] := 2; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 3; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;

  end else if (PartsScript[4].PartType = B) and (PartsScript[3].PartType = R) then begin  {B | G | R | B | G}
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 1; path_3[1, 1] := 14;
    path_3[2, 0] := 2; path_3[2, 1] := 11;
    path_3[3, 0] := 4; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 3; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;


  end else if (PartsScript[5].PartType = B) and (PartsScript[3].PartType = R) then begin  {B | G | R | G | B}
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 1; path_3[1, 1] := 14;
    path_3[2, 0] := 2; path_3[2, 1] := 11;
    path_3[3, 0] := 3; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 4; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;

  end else if (PartsScript[3].PartType = B) and (PartsScript[4].PartType = R) then begin  {B | G | B | R | G}
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 1; path_3[1, 1] := 14;
    path_3[2, 0] := 3; path_3[2, 1] := 11;
    path_3[3, 0] := 4; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 2; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;

  end else if (PartsScript[3].PartType = B) and (PartsScript[5].PartType = R) then begin  {B | G | B | G | R}
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 1; path_3[1, 1] := 14;
    path_3[2, 0] := 4; path_3[2, 1] := 11;
    path_3[3, 0] := 3; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 2; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;



  end else if (PartsScript[3].PartType = B) and (PartsScript[2].PartType = R) then begin  {B | R | B | G | G}
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 3; path_3[1, 1] := 14;
    path_3[2, 0] := 1; path_3[2, 1] := 11;
    path_3[3, 0] := 4; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 2; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;

  end else if (PartsScript[4].PartType = B) and (PartsScript[2].PartType = R) then begin  {B | R | G | B | G}
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 2; path_3[1, 1] := 14;
    path_3[2, 0] := 1; path_3[2, 1] := 11;
    path_3[3, 0] := 4; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 3; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;

  end else if (PartsScript[5].PartType = B) and (PartsScript[2].PartType = R) then begin  {B | R | G | G | B}
    path_3[0, 0] := 0; path_3[0, 1] := 9;
    path_3[1, 0] := 3; path_3[1, 1] := 14;
    path_3[2, 0] := 1; path_3[2, 1] := 11;
    path_3[3, 0] := 2; path_3[3, 1] := 16;
    path_3[4, 0] := 14; path_3[4, 1] := 8;
    path_3[5, 0] := 11; path_3[5, 1] := 14;
    path_3[6, 0] := 4; path_3[6, 1] := 5;
    path_3[7, 0] := 16; path_3[7, 1] := 6;
    path_3[8, 0] := 14; path_3[8, 1] := 7;
  end else begin
      rebuild := 1;
    end
  end;

procedure UDPCameraReceivePart();
    var i: integer;
        last_drop2,maxRGB, CountGreen, CountRed, CountBlue: integer;
        CrossColorCheck_1, CrossColorCheck_2 : TPartType;
    begin

         case FHal.RGMission.ItemIndex of
               //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
               //          MISSION SELECTION       //
               //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//


               //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
               //               MISSION 1          //
               //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
               0: for i:=0 to 4 do begin
                   PartsScript2[i+1].PartType:= B;
                   PartsScript2[i+1].ID:= i+1;
                   PartsScript2[i+1].Node:= BoxPlaces[i];
                  end;

               //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
               //               MISSION 2          //
               //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
               1: begin
                       PartsScript2[1].PartType:= B;
                       PartsScript2[1].ID:= 1;
                       PartsScript2[1].Node:= BoxPlaces[1];

                       if FHal.RGBoxColorRead.ItemIndex<=1 then begin
                         for i:=1 to 3 do begin
                             maxRGB:= max(ImageR[i],max(ImageG[i],ImageB[i]));
                             if  maxRGB>=StrToInt(FHal.EPeakTresh.Text) then begin
                                 PartsScript2[i+1].PartType:= UpdatePartsFromCamera(ImageCol[i], ImageR[i],ImageG[i],ImageB[i]);
                                 PartsScript2[i+1].ID:= i+1;
                                 PartsScript2[i+1].Node:= BoxPlaces[i];
                             end
                         end
                       end else begin
                         PartsScript2[2].PartType:= G;
                         PartsScript2[2].ID:= 2;
                         PartsScript2[2].Node:= BoxPlaces[1];
                         PartsScript2[3].PartType:= B;
                         PartsScript2[3].ID:= 3;
                         PartsScript2[3].Node:= BoxPlaces[2];
                         PartsScript2[4].PartType:= B;
                         PartsScript2[4].ID:= 4;
                         PartsScript2[4].Node:= BoxPlaces[3];
                       end;

                       PartsScript2[5].PartType:= G;
                       PartsScript2[5].ID:= 5;
                       PartsScript2[5].Node:= BoxPlaces[5];

                  end;
               //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
               //               MISSION 3          //
               //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
               2: begin
                       PartsScript2[1].PartType:= B;
                       PartsScript2[1].ID:= 1;
                       PartsScript2[1].Node:= BoxPlaces[1];

                       if FHal.RGBoxColorRead.ItemIndex<=1 then begin
                          CountGreen := 0;
                          CountRed := 0;
                          CountBlue := 1;

                           for i:=1 to 3 do begin
                               maxRGB:= max(ImageR[i],max(ImageG[i],ImageB[i]));
                               if  maxRGB>=StrToInt(FHal.EPeakTresh.Text) then begin

                                   PartsScript2[i+1].PartType:= UpdatePartsFromCamera(ImageCol[i], ImageR[i],ImageG[i],ImageB[i]);
                                   PartsScript2[i+1].ID:= i+1;
                                   PartsScript2[i+1].Node:= BoxPlaces[i];

                                   case PartsScript2[i+1].PartType of
                                         B : CountBlue:= CountBlue + 1;
                                         R : CountRed:= CountRed + 1;
                                         G : CountGreen:= CountGreen + 1;
                                   end
                               end
                           end;

                           if (CountBlue = 2) AND (CountGreen = 2) then begin
                               PartsScript2[5].PartType:= R;
                               PartsScript2[5].ID:= 5;
                               PartsScript2[5].Node:= BoxPlaces[4];

                           end else if (CountBlue = 2) AND (CountGreen = 1) AND (CountRed = 1) then begin
                               PartsScript2[5].PartType:= G;
                               PartsScript2[5].ID:= 5;
                               PartsScript2[5].Node:= BoxPlaces[4];

                           end else if (CountBlue = 1) AND (CountGreen = 2) AND (CountRed = 1) then begin
                               PartsScript2[5].PartType:= B;
                               PartsScript2[5].ID:= 5;
                               PartsScript2[5].Node:= BoxPlaces[4];

                      end else begin
                         PartsScript2[2].PartType:= G;
                         PartsScript2[2].ID:= 2;
                         PartsScript2[2].Node:= BoxPlaces[1];
                         PartsScript2[3].PartType:= R;
                         PartsScript2[3].ID:= 3;
                         PartsScript2[3].Node:= BoxPlaces[2];
                         PartsScript2[4].PartType:= G;
                         PartsScript2[4].ID:= 4;
                         PartsScript2[4].Node:= BoxPlaces[3];
                         PartsScript2[5].PartType:= B;
                         PartsScript2[5].ID:= 5;
                         PartsScript2[5].Node:= BoxPlaces[4];
                       end;
                  end;
               end;
          end;

      {PartsScript2[1].PartType:= UpdatePartsFromCamera(ImageCol[0], ImageR[0],ImageG[0],ImageB[0]);
      PartsScript2[1].ID:= 1;
      PartsScript2[1].Node:= BoxPlaces[0];
      PartsScript2[2].PartType:= UpdatePartsFromCamera(ImageCol[1], ImageR[1],ImageG[1],ImageB[1]);
      PartsScript2[2].ID:= 2;
      PartsScript2[2].Node:= BoxPlaces[1];
      PartsScript2[3].PartType:= UpdatePartsFromCamera(ImageCol[2], ImageR[2],ImageG[2],ImageB[2]);
      PartsScript2[3].ID:= 3;
      PartsScript2[3].Node:= BoxPlaces[2];
      PartsScript2[4].PartType:= UpdatePartsFromCamera(ImageCol[3], ImageR[3],ImageG[3],ImageB[3]);
      PartsScript2[4].ID:= 4;
      PartsScript2[4].Node:= BoxPlaces[3];
      PartsScript2[5].PartType:= UpdatePartsFromCamera(ImageCol[4], ImageR[4],ImageG[4],ImageB[4]);
      PartsScript2[5].ID:= 5;
      PartsScript2[5].Node:= BoxPlaces[4]}


     FHal.ChangePartColor(PartsScript2);

   end;
end.
