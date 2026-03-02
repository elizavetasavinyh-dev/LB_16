program list01;

type
  PNode = ^TNode;
  TNode = record
    data: integer;
    next: PNode;
  end;
var
  arr: array[1..10] of integer;
  i: integer;
  L1, L2, current, newNode: PNode;
begin
  randomize;
  
  writeln('массив:  [', ']');
  write('[');
  for i := 1 to 10 do
  begin
    arr[i] := random(26) - 5;
    write(arr[i]);
    if i < 10 then write(',');
  end;
  writeln('] ');
  
  L1 := nil;
  L2 := nil;
  
  for i := 1 to 10 do
  begin
    if arr[i] > 0 then
    begin
      new(newNode);
      newNode^.data := arr[i];
      newNode^.next := nil;
      
      if L1 = nil then
        L1 := newNode
      else
      begin
        current := L1;
        while current^.next <> nil do
          current := current^.next;
        current^.next := newNode;
      end;
    end
    else if arr[i] < 0 then
    begin
      new(newNode);
      newNode^.data := arr[i];
      newNode^.next := nil;
      
      if L2 = nil then
        L2 := newNode
      else
      begin
        current := L2;
        while current^.next <> nil do
          current := current^.next;
        current^.next := newNode;
      end;
    end;

  end;
  
  write('L1: ');
  current := L1;
  while current <> nil do
  begin
    write(current^.data);
    if current^.next <> nil then write(' ');
    current := current^.next;
  end;
  writeln;
  
  write('L2: ');
  current := L2;
  while current <> nil do
  begin
    write(current^.data);
    if current^.next <> nil then write(' ');
    current := current^.next;
  end;
  writeln;

  while L1 <> nil do
  begin
    current := L1;
    L1 := L1^.next;
    dispose(current);
  end;
  
  while L2 <> nil do
  begin
    current := L2;
    L2 := L2^.next;
    dispose(current);
  end;
end.