program ToyStore;

type
    Toy = record
        name: string[50];      // Название игрушки
        price: real;           // Цена
        ageFrom, ageTo: integer; // Рекомендуемый возраст
    end;

var
    toys: array[1..3] of Toy;      // Массив записей для ввода
    toysFromFile: array[1..3] of Toy; // Массив для чтения из файла
    f: file of Toy;                 // Типизированный файл для записей Toy
    i: integer;

begin
    // ------------------------------------------------------------
    // 1. Ввод данных с клавиатуры
    // ------------------------------------------------------------
    writeln('Введите информацию о трех игрушках:');
    for i := 1 to 3 do
    begin
        writeln('Игрушка ', i, ':');
        write('  Название: ');
        readln(toys[i].name);
        write('  Цена (руб.): ');
        readln(toys[i].price);
        write('  Рекомендуемый возраст (от и до через пробел): ');
        readln(toys[i].ageFrom, toys[i].ageTo);
    end;
    
    assign(f, 'toys.dat');
    rewrite(f);
    for i := 1 to 3 do
        write(f, toys[i]);
    close(f);

    writeln;
    writeln('Данные успешно записаны в файл toys.dat');
    writeln;

    assign(f, 'toys.txt');
    reset(f);
    for i := 1 to 3 do
        read(f, toysFromFile[i]);
    close(f);

    writeln('Содержимое файла toys.dat:');
    for i := 1 to 3 do
    begin
        writeln('Игрушка ', i, ':');
        writeln('  Название: ', toysFromFile[i].name);
        writeln('  Цена: ', toysFromFile[i].price:0:2, ' руб.');
        writeln('  Возраст: от ', toysFromFile[i].ageFrom, ' до ', toysFromFile[i].ageTo, ' лет');
    end;
end.