program record1_array;

const
  N = 3;
type
  anketa = record
    fio: string[50];
    birth: string[10];
    kurs: 1..5;
  end;

var
  students: array[1..N] of anketa;
  i: integer;

begin
  writeln('Ввод данных о ', N, ' студентах:');
  writeln('===============================');
  
  for i := 1 to N do
  begin
    writeln;
    writeln('Студент №', i, ':');
    write('  Ф.И.О.: ');
    readln(students[i].fio);
    write('  Дата рождения (ДД.ММ.ГГГГ): ');
    readln(students[i].birth);
    repeat
      write('  Курс (1-5): ');
      readln(students[i].kurs);
    until (students[i].kurs >= 1) and (students[i].kurs <= 5);
  end;
  
  writeln;
  writeln('Список студентов:');
  writeln('=================');
  for i := 1 to N do
  begin
    writeln(i, '. ', students[i].fio);
    writeln('   Дата рождения: ', students[i].birth);
    writeln('   Курс: ', students[i].kurs);
    writeln;
  end;
  
  writeln('Для продолжения нажмите Enter...');
  readln;
end.