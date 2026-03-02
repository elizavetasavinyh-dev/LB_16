program record3;

const
  N = 5;

type
  toy = record
    name: string[30];
    price: real;
    age: string[15];
  end;

var
  toys: array[1..N] of toy;
  i: integer;

// Функция для создания строки из повторяющихся символов
function RepeatChar(ch: char; count: integer): string;
var
  s: string;
  j: integer;
begin
  s := '';
  for j := 1 to count do
    s := s + ch;
  RepeatChar := s;
end;

begin
  // Заполняем данные
  with toys[1] do
  begin
    name := 'Мяч';
    price := 450.00;
    age := '3+';
  end;
  
  with toys[2] do
  begin
    name := 'Кукла';
    price := 1299.50;
    age := '3-7 лет';
  end;
  
  with toys[3] do
  begin
    name := 'Пазл';
    price := 650.00;
    age := '5-10 лет';
  end;
  
  with toys[4] do
  begin
    name := 'Железная дорога';
    price := 4599.00;
    age := '4-8 лет';
  end;
  
  with toys[5] do
  begin
    name := 'Набор пластилина';
    price := 350.00;
    age := '2-5 лет';
  end;
  
  // Вывод в красивой таблице
  writeln('┌' + RepeatChar('─', 58) + '┐');
  writeln('│' + RepeatChar(' ', 23) + 'ИГРУШКИ В ПРОДАЖЕ' + RepeatChar(' ', 22) + '│');
  writeln('├' + RepeatChar('─', 58) + '┤');
  writeln('│ № │ Название игрушки            │ Цена (руб.) │ Возраст     │');
  writeln('├' + RepeatChar('─', 58) + '┤');
  
  for i := 1 to N do
    with toys[i] do
    begin
      write('│ ', i:1, ' │ ');
      write(name);
      
      if length(name) < 28 then
        write(RepeatChar(' ', 28 - length(name)));
      
      write(' │ ');
      write(price:8:2);
      write('   │ ');
      write(age);
      
      if length(age) < 11 then
        writeln(RepeatChar(' ', 12 - length(age)), '│')
      else
        writeln(' │');
    end;
  
  writeln('└' + RepeatChar('─', 58) + '┘');
  
  // Дополнительная информация с использованием with
  writeln;
  writeln('Самые дорогие игрушки:');
  writeln('----------------------');
  
  for i := 1 to N do
    with toys[i] do
      if price > 2000 then
        writeln('  - ', name, ' (', price:0:2, ' руб.)');
  
  readln;
end.