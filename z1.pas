program zzz;
var
    inputFile, outputFile: Text;
    numbers: array[1..1000] of integer;
    count, i: integer;
begin
    assign(inputFile, 'input_numbers.txt');
    reset(inputFile);
    count := 0;
    while not eof(inputFile) do
    begin
        count := count + 1;
        read(inputFile, numbers[count]);
    end;
    close(inputFile); 
    assign(outputFile, 'output_numbers.txt');
    rewrite(outputFile);
    for i := count downto 1 do
    begin
        write(outputFile, numbers[i]);
        if i > 1 then
            write(outputFile, ' ');
    end;
    
    close(outputFile);
    
    writeln('Готово! Прочитано ', count, ' чисел.');
    writeln('Числа записаны в обратном порядке в файл output_numbers.txt');
end.