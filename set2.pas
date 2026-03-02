program CheckString;

type
  t_chs = set of Char;

const
  lett: t_chs = ['a'..'z', 'A'..'Z', '_'];
  num: t_chs = ['0'..'9'];

var
  str: string;
  i: byte;
  flag: boolean;

begin
  // Запрашиваем строку у пользователя
  writeln('Введите строку для проверки:');
  readln(str);

  flag := true; // изначально считаем строку корректной

  // Проверка первого символа
  if not (str[1] in lett) then
    flag := false
  else
  begin
    // Проверка остальных символов (со второго до конца)
    for i := 2 to length(str) do
    begin
      // Символ должен быть либо буквой/подчеркиванием, либо цифрой
      if not ((str[i] in lett) or (str[i] in num)) then
      begin
        flag := false;
        break; // прерываем цикл при первом недопустимом символе
      end;
    end;
  end;

  // Вывод результата
  writeln('Результат проверки: ', flag);
end.