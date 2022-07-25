tableextension 65400 "MNB Customer" extends Customer
{

    fields
    {
        field(65400; "MNB Bonuses"; Integer)
        {
            Caption = 'Bonuses';
            FieldClass = FlowField;
            CalcFormula = count("MNB Bonus Header" where("Customer No." = field("No.")));
            Editable = false;
        }
    }
    trigger OnBeforeDelete()
    begin
        TestIfBonusExists();
    end;

    var
        AtLeastOneBonusForCustomerExistsErr: Label 'At least one bonus for customer %1 exists.', Comment = '%1 - customer name';

    local procedure TestIfBonusExists()
    var
        BonusHeader: Record "MNB Bonus Header";
    begin
        BonusHeader.SetRange("Customer No.", Rec."No.");
        if not BonusHeader.IsEmpty then
            Error(AtLeastOneBonusForCustomerExistsErr, Rec.Name);
    end;
}