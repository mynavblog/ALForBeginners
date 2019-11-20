tableextension 50100 "MNB Customer" extends Customer
{

    fields
    {
        field(50100; "MNB Bonuses"; Integer)
        {
            Caption = 'Bonuses';
            FieldClass = FlowField;
            CalcFormula = count ("MNB Bonus Header" where("Customer No." = field("No.")));
            Editable = false;
        }
    }

    var
        BonusExistsErr: Label 'You can not delete Customer %1 because there is at least one Bonus assigned.';

    trigger OnBeforeDelete()
    var
        MNBBonusHeader: Record "MNB Bonus Header";
    begin
        MNBBonusHeader.SetRange("Customer No.", "No.");
        if not MNBBonusHeader.IsEmpty() then
            Error(BonusExistsErr, "No.");
    end;
}