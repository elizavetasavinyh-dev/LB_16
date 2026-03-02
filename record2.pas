program record2_advanced;

const
  N = 5; // количество студентов

type
  anketa = record
    fio: string[50];
    birth: string[10];
    kurs: 1..5;
  end;

var
  students: array[1..N] of anketa;
  i, maxLen: integer;

// Функция для создания строки из символов
function StringOfChar(ch: char; count: integer): string;
var
  s: string;
  j: integer;
begin
  s := '';
  for j := 1 to count do
    s := s + ch;
  StringOfChar := s;
end;

begin
  // Заполняем массив данными о студентах
  students[1].fio := 'Иванов Иван Иванович';
  students[1].birth := '15.03.2003';
  students[1].kurs := 3;
  
  students[2].fio := 'Петрова Анна Сергеевна';
  students[2].birth := '22.07.2004';
  students[2].kurs := 2;
  
  students[3].fio := 'Сидоров Петр Алексеевич';
  students[3].birth := '10.11.2002';
  students[3].kurs := 4;
  
  students[4].fio := 'Козлова Елена Дмитриевна';
  students[4].birth := '05.05.2003';
  students[4].kurs := 3;
  
  students[5].fio := 'Смирнов Александр Игоревич';
  students[5].birth := '30.01.2005';
  students[5].kurs := 1;
  
  // Находим максимальную длину Ф.И.О.
  maxLen := 0;
  for i := 1 to N do
    if length(students[i].fio) > maxLen then
      maxLen := length(students[i].fio);
  
  // Если максимальная длина меньше 30, устанавливаем 30
  if maxLen < 30 then maxLen := 30;
  
  // Выводим данные в виде красивой таблицы
  writeln('┌' + StringOfChar('─', maxLen + 20) + '┐');
  writeln('│' + StringOfChar(' ', (maxLen + 18) div 2) + 'СПИСОК СТУДЕНТОВ' + 
          StringOfChar(' ', (maxLen + 18) div 2) + '│');
  writeln('├' + StringOfChar('─', maxLen + 20) + '┤');
  
  // Заголовок таблицы
  write('│ № │ Ф.И.О.');
  
  // Выравнивание заголовка Ф.И.О.
  if maxLen > 7 then
    write(StringOfChar(' ', maxLen - 7));
  
  writeln(' │ Дата рожд. │ Курс │');
  writeln('├' + StringOfChar('─', maxLen + 20) + '┤');
  
  // Выводим данные каждого студента
  for i := 1 to N do
  begin
    write('│ ', i:1, ' │ ');
    write(students[i].fio);
    
    // Выравнивание Ф.И.О.
    if length(students[i].fio) < maxLen then
      write(StringOfChar(' ', maxLen - length(students[i].fio)));
    
    write(' │ ');
    write(students[i].birth);
    write('   │ ');
    write(students[i].kurs:1);
    writeln('    │');
  end;
  
  writeln('└' + StringOfChar('─', maxLen + 20) + '┘');
  
  readln;
end.