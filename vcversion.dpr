library vcversion;

uses
  Windows,
  uVerAdjust in 'uVerAdjust.pas';

{$R *.res}

{ Types }

type
  TGTAVersion = (verUnknown, verGTAVC_US_10, verGTAVC_US_11, verGTAVC_AUS_10,
    verGTAVC_GER_10, verGTAVC_GER_11);

{ Functions }

function AdjustOffset(Offset: LongWord;
  TargetVersion: TGTAVersion): LongWord; stdcall;
begin
  case TargetVersion of
    verGTAVC_US_10: Result := Offset;
    verGTAVC_US_11: Result := AdjustOffsetUS11(Offset);
    verGTAVC_AUS_10: Result := AdjustOffsetAUS10(Offset);
    verGTAVC_GER_10: Result := AdjustOffsetGER10(Offset);
    verGTAVC_GER_11: Result := AdjustOffsetGER11(Offset);
  else
    Result := Offset;
  end;
end;

function DetectVersion(Process: THandle): TGTAVersion; stdcall;
var
  p: PLongWord;
	protect1, protect2: LongWord;
  Buffer, BytesRead: LongWord;
begin
  Result := verUnknown;
  p := PLongWord($6339D0);
	if VirtualProtectEx(Process, p, $10, PAGE_READWRITE, protect1) then
  begin
    ReadProcessMemory(Process, p, @Buffer, SizeOf(Buffer), BytesRead);
    if BytesRead = SizeOf(Buffer) then
    begin
      if Buffer = $FFE8874C then
        Result := verGTAVC_US_10
      else if Buffer = $0000CC24 then
        Result := verGTAVC_US_11
      else if Buffer = $FFE8885C then
        Result := verGTAVC_AUS_10
      else if Buffer = $FFE8875C then
        Result := verGTAVC_GER_10
      else if Buffer = $0000DC24 then
        Result := verGTAVC_GER_11;
    end;
    VirtualProtectEx(Process, p, $10, protect1, protect2);
  end;
end;

{ DLL Specific }

exports
  AdjustOffset, DetectVersion;

begin
end.
