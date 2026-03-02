program ListMinMax;
type
    PNode = ^Node;
    Node = record
        data: integer;
        next: PNode;
    end;
var
    Head, p: PNode;
    i, minVal, maxVal: integer;
procedure AddFirst(var Head: PNode; NewNode: PNode);
begin
    NewNode^.next := Head;
    Head := NewNode;
end;
function CreateNode(value: integer): PNode;
var NewNode: PNode;
begin
    New(NewNode);
    NewNode^.data := value;
    NewNode^.next := nil;
    Result := NewNode;
end;
begin
    Head := nil;
    randomize;
    writeln('Сгенерированный список:');
    for i := 1 to 10 do begin
        AddFirst(Head, CreateNode(random(50) - 25));
    end;
    p := Head;
    while p <> nil do begin
        write(p^.data, ' ');
        p := p^.next;
    end;
    writeln;
    writeln;
    if Head <> nil then begin
        minVal := Head^.data;
        maxVal := Head^.data;
        p := Head^.next;
        while p <> nil do begin
            if p^.data < minVal then
                minVal := p^.data;
            if p^.data > maxVal then
                maxVal := p^.data;
            p := p^.next;
        end;
        writeln('Минимальный элемент: ', minVal);
        writeln('Максимальный элемент: ', maxVal);
    end
    else
        writeln('Список пуст.');
end.