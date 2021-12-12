page 50100 "MNB Bonus Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "MNB Bonus Setup";
    Caption = 'Bonus Setup';
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Bonus Nos."; 'Bonus Nos.')
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies number series what will be used for bonus numbers.';
                    Caption = 'Bonus Nos.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin

    end;
}