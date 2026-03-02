program slice02_correct;

var
  a: array[1..100] of integer;
  n, i: integer;

begin
  randomize;
  
  { Ввод размера массива }
  write('>>');
  readln(n);
  
  { Проверка на четность }
  if n mod 2 <> 0 then
  begin
    writeln('Ошибка: N должно быть четным');
    halt;
  end;
  
  { Заполнение и вывод исходного массива }
  for i := 1 to n do
  begin
    a[i] := random(90) + 10;
    write(a[i], ' ');
  end;
  writeln;
  
  { Вывод элементов с четными номерами (без условного оператора) }
  { Используем цикл с шагом 2, начиная с индекса 2 }
  i := 2;
  while i <= n do
  begin
    write(a[i], ' ');
    i := i + 2;  { шаг 2 - переходим к следующему четному индексу }
  end;
  writeln;
  
  readln;
end.