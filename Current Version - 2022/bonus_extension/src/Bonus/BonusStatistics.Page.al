page 65404 "MNB Bonus Statistics"
{
    PageType = CardPart;
    UsageCategory = None;
    SourceTable = "MNB Bonus Header";
    Caption = 'Statistics';
    Editable = false;

    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies bonus number.';
            }
            field("Bonus Amount"; Rec."Bonus Amount")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies total amout for bonus';
            }
        }
    }
}