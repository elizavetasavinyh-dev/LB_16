program ListEvenElements;
type
    PNode = ^Node;
    Node = record
        data: integer;
        next: PNode;
    end;
var
    Head, p: PNode;
    i: integer;
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
    for i := 1 to 10 do
        AddFirst(Head, CreateNode(random(100)));
    writeln('Список из 10 элементов:');
    p := Head;
    while p <> nil do begin
        write(p^.data, ' ');
        p := p^.next;
    end;
    writeln;
    writeln;
    writeln('Четные элементы списка:');
    p := Head;
    while p <> nil do begin
        if p^.data mod 2 = 0 then
            write(p^.data, ' ');
        p := p^.next;
    end;
    writeln;
end.