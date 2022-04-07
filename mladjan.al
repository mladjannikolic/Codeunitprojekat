codeunit 50100 Mladjan
{
    TableNo = Customer;
    trigger OnRun()
    begin
        Rec.FindFirst();
        Message('Hello %1', Rec.Count());
    end;

    procedure Mladjan()
    var

    begin
        Message('Greetings from Trinidad & Tobago');
    end;

    procedure setKristina(k: Integer)
    var
    begin
        Kristina := k;
    end;

    procedure getKristina(): Integer;
    begin
        exit(Kristina);
    end;

    var
        Kristina: Integer;
}