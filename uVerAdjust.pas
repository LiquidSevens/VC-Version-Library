unit uVerAdjust;

interface

function AdjustOffsetUS11(Offset: LongWord): LongWord;
function AdjustOffsetAUS10(Offset: LongWord): LongWord;
function AdjustOffsetGER10(Offset: LongWord): LongWord;
function AdjustOffsetGER11(Offset: LongWord): LongWord;

implementation

function AdjustOffsetUS11(Offset: LongWord): LongWord;
begin
  if Offset < $489D0C then
    Result := Offset
  else if Offset < $489D10 then
    Result := Offset + $4
  else if Offset < $489D82 then
    Result := Offset + $D
  else if Offset < $489E0D then
    Result := Offset + $E
  else if Offset < $498FF3 then
    Result := Offset + $10
  else if Offset < $4A4353 then
    Result := Offset + $21
  else if Offset < $600FB0 then
    Result := Offset + $20
  else if Offset < $601FF9 then
  begin
    if Offset < $601E83 then
      Result := Offset + $30
    else if Offset < $601EAB then
      Result := Offset + $2E
    else if Offset < $601EAD then
      Result := Offset + $2C
    else if Offset < $601EDC then
      Result := Offset + $30
    else if Offset < $601EDE then
      Result := Offset + $2E
    else if Offset < $601F0E then
      Result := Offset + $30
    else if Offset < $601F10 then
      Result := Offset + $2E
    else if Offset < $601F48 then
      Result := Offset + $30
    else if Offset < $601F50 then
      Result := Offset + $2E
    else if Offset < $601F5F then
      Result := Offset + $28
    else if Offset < $601F8C then
      Result := Offset + $26
    else
      Result := Offset + $24
  end
  else if Offset < $626F79 then
    Result := Offset - $20
  else if Offset < $62758D then
  begin
    if Offset < $626F7F then
      Result := Offset - $1B
    else if Offset < $6271C9 then
      Result := Offset - $20
    else if Offset < $6271D8 then
      Result := Offset - $19
    else if Offset < $6271ED then
      Result := Offset - $20
    else if Offset < $6271F7 then
      Result := Offset - $14
    else if Offset < $627203 then
      Result := Offset - 2
    else if Offset < $62720A then
      Result := Offset + $20
    else if Offset < $627214 then
      Result := Offset - 1
    else if Offset < $62721B then
      Result := Offset + 8
    else if Offset < $6272DB then
      Result := Offset + $F
    else if Offset < $6273D1 then
      Result := Offset + $10
    else if Offset < $627448 then
      Result := Offset + $23
    else if Offset < $627470 then
      Result := Offset + $28
    else if Offset < $6274B6 then
      Result := Offset + $26
    else if Offset < $6274CC then
      Result := Offset + $2A
    else if Offset < $627570 then
      Result := Offset + $20
    else
      Result := Offset + $46
  end
  else if Offset < $67E000 then
    Result := Offset + $50
  else if Offset < $6D6688 then
    Result := Offset
  else if Offset < $6D6B28 then
    Result := Offset - $2C
  else if Offset = $6DB8E8 then
    Result := $786D44
  else if Offset < $6DB8F0 then
    Result := Offset - $28
  else if Offset < $6DB924 then
    Result := Offset - $30
  else if Offset < $6E0000 then
    Result := Offset - $10
  else if Offset < $786BA8 then
    Result := Offset
  else if Offset < $786D40 then
    Result := Offset + 4
  else if Offset < $A10B56 then
    Result := Offset + 8
  else if Offset < $A12000 then
    Result := Offset + 9
  else
    Result := Offset;
end;

function AdjustOffsetAUS10(Offset: LongWord): LongWord;
begin
  if Offset < $600B8A then
    Result := AdjustOffsetUS11(Offset)
  else if Offset < $600FB0 then
  begin
    if Offset < $600B91 then
      Result := Offset + $25
    else if Offset < $600B96 then
      Result := Offset + $19
    else if Offset < $600BFD then
      Result := Offset + $20
    else if Offset < $600C40 then
      Result := Offset - $36
    else if Offset < $600C4A then
      Result := Offset - $73
    else if Offset < $600C4F then
      Result := Offset - $88
    else if Offset < $600C6E then
      Result := Offset - $78
    else
      Result := Offset - $80
  end
  else if Offset < $67E000 then
    Result := AdjustOffsetUS11(Offset) - $A0
  else if Offset < $68DD6C then
    Result := Offset
  else if Offset < $68E008 then
    Result := Offset + 4
  else if Offset < $6D6688 then
    Result := Offset + 8
  else if Offset < $6D6934 then
    Result := Offset - $24
  else if Offset < $6D6B28 then
    Result := Offset - $4C
  else if Offset = $6DB8E8 then
    Result := $786D44
  else if Offset < $6DB8F0 then
    Result := Offset - $48
  else if Offset < $6DB924 then
    Result := Offset - $50
  else if Offset < $6E0000 then
    Result := Offset - $30
  else if Offset < $786BA8 then
    Result := Offset
  else if Offset < $786D40 then
    Result := Offset + 4
  else if Offset < $A10B56 then
    Result := Offset + 8
  else if Offset < $A10B9C then
    Result := Offset + 9
  else if Offset < $A12000 then
    Result := Offset + 8
  else
    Result := Offset;
end;

function AdjustOffsetGER10(Offset: LongWord): LongWord;
begin
  if Offset < $4A3941 then
    Result := AdjustOffsetUS11(Offset)
  else if Offset < $4A3948 then
    Result := Offset + $E
  else if Offset < $4A4357 then
    Result := Offset + $15
  else if Offset < $5367AE then
    Result := Offset + $10
  else if Offset < $536E5B then
  begin
    if Offset < $5367B7 then
      Result := Result + $1D
    else if Offset < $5367C4 then
      Result := Result + $19
    else if Offset < $5367D8 then
      Result := Result - 4
    else if Offset < $5367E3 then
      Result := Offset - 8
    else if Offset < $536855 then
      Result := Offset - $C
    else if Offset < $5368E0 then
      Result := Offset - 5
    else if Offset < $536966 then
      Result := Offset - $C
    else if Offset < $536A20 then
      Result := Offset - 6
    else if Offset < $536AA0 then
      Result := Offset - 4
    else if Offset < $536D37 then
      Result := Offset - $D
    else if Offset < $536D90 then
      Result := Offset - 7
    else if Offset < $536DC7 then
      Result := Offset - $C
    else if Offset < $536E32 then
      Result := Offset - 7
    else
      Result := Offset - 2;
  end
  else
    Result := Offset;
end;

function AdjustOffsetGER11(Offset: LongWord): LongWord;
begin
  if Offset < $600FB0 then
    Result := AdjustOffsetGER10(Offset)
  else if Offset < $67E000 then
    Result := AdjustOffsetUS11(Offset) - $10
  else
    Result := AdjustOffsetUS11(Offset);
end;

end.
