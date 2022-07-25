page 65403 "MNB Bonus Entries"
{
    PageType = List;
    SourceTable = "MNB Bonus Entry";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    Caption = 'Bonus Entries';
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies sales invoice posting date.';
                }
                field("Bonus No."; Rec."Bonus No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus number.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies sales invoice number.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies item number.';
                }
                field("Bonus Amount"; Rec."Bonus Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies calculated bonus amount.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies entry number for the ledger.';
                }
            }
        }
    }
}