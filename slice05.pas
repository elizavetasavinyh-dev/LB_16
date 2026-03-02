program slice;

const
  N = 10; // размер массива

var
  a: array[1..N + 1] of integer;
  i, n, minIndex: integer;

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
  write('введите n:  ');
  readln(n);
  minIndex := 1;
  for i := 2 to N do
    if a[i] < a[minIndex] then
      minIndex := i;
  writeln('Индекс минимального элемента: ', minIndex);
  writeln('Минимальный элемент: ', a[minIndex]);
  for i := N + 1 downto minIndex + 1 do
    a[i] := a[i - 1];
  a[minIndex] := n;
  write('результат:  [');
  for i := 1 to N + 1 do
  begin
    write(a[i]);
    if i < N + 1 then write(',');
  end;
  writeln(']  ');
end.