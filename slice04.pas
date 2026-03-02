program slice;
const
  N = 10;
var
  a: array[1..N] of integer;
  i, maxIndex: integer;
begin
  randomize;
  for i := 1 to N do
    a[i] := random(100) + 1;
  write('массив:  [');
  for i := 1 to N do
  begin
    write(a[i]);
    if i < N then write(',');
  end;
  writeln('] ');
  maxIndex := 1;
  for i := 2 to N do
    if a[i] > a[maxIndex] then
      maxIndex := i;
  writeln('Индекс максимального элемента: ', maxIndex);
  writeln('Максимальный элемент: ', a[maxIndex]);
  for i := maxIndex to N - 1 do
    a[i] := a[i + 1];
    write('результат: [');
  for i := 1 to N - 1 do
  begin
    write(a[i]);
    if i < N - 1 then write(',');
  end;
  writeln(']  ');
end.