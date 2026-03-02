program list02_simple;

const
  N = 10;

var
  arr: array[1..N] of integer;
  i, maxIdx: integer;

function IndexMax: integer;
var
  j, maxVal: integer;
begin
  maxVal := arr[1];
  IndexMax := 1;
  
  for j := 2 to N do
    if arr[j] > maxVal then
    begin
      maxVal := arr[j];
      IndexMax := j;
    end;
end;

procedure RemoveAt(k: integer);
var
  j: integer;
begin
  for j := k to N - 1 do
    arr[j] := arr[j + 1];
end;

begin
  randomize;
  
  // Заполняем массив
  write('список: ');
  for i := 1 to N do
  begin
    arr[i] := random(100);
    write(arr[i], ' ');
  end;
  writeln;

  maxIdx := IndexMax;
  writeln('Максимальный элемент: ', arr[maxIdx]);
 
  RemoveAt(maxIdx);

  write('результат: [');
  for i := 1 to N - 1 do
  begin
    write(arr[i]);
    if i < N - 1 then write(',');
  end;
  writeln(']');
end.