program slice01_compact;

var
  a: array[1..100] of integer;
  n, i: integer;

begin
  randomize;
  
  write('сколько элементов: ');
  readln(n);
  
  { Заполнение и вывод исходного массива }
  write('массив: ');
  for i := 1 to n do
  begin
    a[i] := random(90) + 10;  { числа от 10 до 99 }
    write(a[i], ' ');
  end;
  writeln;
  
  { Вывод в обратном порядке }
  write('результат: ');
  for i := n downto 1 do
    write(a[i], ' ');
  writeln;
  
  readln;
end.