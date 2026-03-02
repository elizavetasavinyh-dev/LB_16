program slice03;

var
  A: array[1..100] of integer;
  N, i: integer;
  min_val: integer;

begin
  { Ввод количества элементов }
  write('>> ');
  readln(N);
  
  { Заполнение массива случайными числами }
  randomize;
  for i := 1 to N do
    A[i] := random(90) + 10;
  
  { Вывод исходного массива }
  for i := 1 to N do
    write(A[i], ' ');
  writeln;
  
  { Вывод среза четных элементов }
  write('срез: [');
  write(A[2]);
  for i := 4 to N step 2 do
    write(',', A[i]);
  writeln('] ');
  
  { Нахождение минимума }
  min_val := A[2];
  for i := 4 to N step 2 do
    if A[i] < min_val then
      min_val := A[i];
  
  { Вывод результата }
  writeln('мин: ', min_val);
  
  readln;
end.