codeunit 50100 "MNB Bonus Calculation"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
    local procedure RunOnAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line")
    begin
        CalculateBonus(SalesInvLine);
    end;

    local procedure CalculateBonus(var SalesInvLine: Record "Sales Invoice Line")
    var
        MNBBonusHeader: Record "MNB Bonus Header";
    begin
        if SalesInvLine.Type <> SalesInvLine.Type::Item then
            exit;

        MNBBonusHeader.SetRange("Customer No.", SalesInvLine."Bill-to Customer No.");
        MNBBonusHeader.SetRange(Status, MNBBonusHeader.Status::Released);
        MNBBonusHeader.SetFilter("Starting Date", '..%1', SalesInvLine."Posting Date");
        MNBBonusHeader.SetFilter("Ending Date", '%1..', SalesInvLine."Posting Date");
        if MNBBonusHeader.IsEmpty() then
            exit;

        if MNBBonusHeader.FindSet() then
            repeat
                FindBonusForAllItems(MNBBonusHeader, SalesInvLine);
                FindBonusForOneItem(MNBBonusHeader, SalesInvLine);
            until MNBBonusHeader.Next() = 0;
    end;

    local procedure FindBonusForAllItems(var MNBBonusHeader: Record "MNB Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
    var
        MNBBonusLine: Record "MNB Bonus Line";
    begin
        MNBBonusLine.SetRange("Document No.", MNBBonusHeader."No.");
        MNBBonusLine.SetRange(Type, MNBBonusLine.Type::"All Items");
        if MNBBonusLine.FindFirst() then
            InsertBonusEntry(MNBBonusLine, SalesInvLine);
    end;

    local procedure FindBonusForOneItem(var MNBBonusHeader: Record "MNB Bonus Header"; var SalesInvLine: Record "Sales Invoice Line");
    var
        MNBBonusLine: Record "MNB Bonus Line";
    begin
        MNBBonusLine.SetRange("Document No.", MNBBonusHeader."No.");
        MNBBonusLine.SetRange(Type, MNBBonusLine.Type::Item);
        MNBBonusLine.SetRange("Item No.", SalesInvLine."No.");
        if MNBBonusLine.FindFirst() then
            InsertBonusEntry(MNBBonusLine, SalesInvLine);
    end;

    local procedure InsertBonusEntry(var MNBBonusLine: Record "MNB Bonus Line"; var SalesInvLine: Record "Sales Invoice Line")
    var
        MNBBonusEntry: Record "MNB Bonus Entry";
        EntryNo: Integer;
    begin
        if MNBBonusEntry.FindLast() then
            EntryNo := MNBBonusEntry."Entry No." + 1
        else
            EntryNo := 1;

        MNBBonusEntry.Init();
        MNBBonusEntry."Entry No." := EntryNo;
        MNBBonusEntry."Bonus No." := MNBBonusLine."Document No.";
        MNBBonusEntry."Document No." := SalesInvLine."Document No.";
        MNBBonusEntry."Item No." := SalesInvLine."No.";
        MNBBonusEntry."Posting Date" := SalesInvLine."Posting Date";
        MNBBonusEntry."Bonus Amount" := SalesInvLine."Line Amount" * MNBBonusLine."Bonus Perc." / 100;
        MNBBonusEntry.Insert();
    end;
}