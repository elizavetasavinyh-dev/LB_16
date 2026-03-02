program ToyYears;

type
    Toy = record
        name: string[50];
        price: real;
        ageFrom, ageTo: integer;
    end;

var
    toys: array[1..3] of Toy;
    f: file of Toy;
    i: integer;

// Функция для определения правильного окончания слова "год"
function YearEnding(years: integer): string;
var
    lastDigit, lastTwoDigits: integer;
begin
    lastDigit := years mod 10;
    lastTwoDigits := years mod 100;

    // Исключение: 11, 12, 13, 14
    if (lastTwoDigits >= 11) and (lastTwoDigits <= 14) then
        YearEnding := 'лет'
    else
        case lastDigit of
            1:    YearEnding := 'год';
            2,3,4: YearEnding := 'года';
            else  YearEnding := 'лет';
        end;
end;

begin
    // Чтение данных из файла
    assign(f, 'toys1.txt');
    reset(f);
    for i := 1 to 3 do
        read(f, toys[i]);
    close(f);

    // Вывод информации с правильными окончаниями
    writeln('Информация об игрушках:');
    for i := 1 to 3 do
    begin
        writeln('Игрушка: ', toys[i].name);
        writeln('  Цена: ', toys[i].price:0:2, ' руб.');
        writeln('  Рекомендуемый возраст: от ', toys[i].ageFrom, ' ', YearEnding(toys[i].ageFrom),
                                      ' до ', toys[i].ageTo, ' ', YearEnding(toys[i].ageTo));
    end;
end.