program z1;
type
    PNode = ^Node;
    Node = record
        word: string[40];
        count: integer;
        next: PNode;
    end;
var
    Head: PNode;
    F: Text;
    NewWord: string;
    TotalWords: integer;
function CreateNode(NewWord: string): PNode;
var NewNode: PNode;
begin
    New(NewNode);
    NewNode^.word := NewWord;
    NewNode^.count := 1;
    NewNode^.next := nil;
    Result := NewNode;
end;
procedure AddFirst(var Head: PNode; NewNode: PNode);
begin
    NewNode^.next := Head;
    Head := NewNode;
end;
procedure AddAfter(p, NewNode: PNode);
begin
    NewNode^.next := p^.next;
    p^.next := NewNode;
end;
function FindPlace(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
    pp := Head;
    while (pp <> nil) and (NewWord > pp^.word) do
        pp := pp^.next;
    Result := pp;
end;
procedure AddBefore(var Head: PNode; p, NewNode: PNode);
var pp: PNode;
begin
    if p = Head then
        AddFirst(Head, NewNode)
    else begin
        pp := Head;
        while (pp <> nil) and (pp^.next <> p) do
            pp := pp^.next;
        if pp <> nil then
            AddAfter(pp, NewNode);
    end;
end;
function Find(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
    pp := Head;
    while (pp <> nil) and (NewWord <> pp^.word) do
        pp := pp^.next;
    Result := pp;
end;
function TakeWord(var F: Text): string;
var c: char;
begin
    Result := '';
    while not eof(F) and (c <= ' ') do
        read(F, c);
    while not eof(F) and (c > ' ') do begin
        Result := Result + c;
        read(F, c);
    end;
end;
procedure PrintList(Head: PNode);
var pp: PNode;
begin
    pp := Head;
    writeln('Алфавитно-частотный словарь:');
    writeln('-----------------------------');
    while pp <> nil do begin
        writeln(pp^.word:30, ' - ', pp^.count);
        pp := pp^.next;
    end;
    writeln('-----------------------------');
end;
begin
    Head := nil;
    assign(F, 'input1.txt');
    reset(F);

    while not eof(F) do begin
        NewWord := TakeWord(F);
        if NewWord <> '' then begin
            NewWord := LowerCase(NewWord);
            var FoundNode := Find(Head, NewWord);
            if FoundNode <> nil then
                FoundNode^.count := FoundNode^.count + 1
            else begin
                var NewNode := CreateNode(NewWord);
                var PlaceNode := FindPlace(Head, NewWord);

                AddBefore(Head, PlaceNode, NewNode);
            end;
        end;
    end;

    close(F);

    PrintList(Head);

    TotalWords := 0;
    var pp := Head;
    while pp <> nil do begin
        TotalWords := TotalWords + 1;
        pp := pp^.next;
    end;
    writeln('Количество различных слов в словаре: ', TotalWords);
end.