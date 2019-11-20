page 50104 "MNB Bonus Entries"
{
    PageType = List;
    SourceTable = "MNB Bonus Entry";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    Caption = 'Bonus Entries';

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies entry number for the ledger.';
                }
                field("Bonus No."; "Bonus No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus number.';
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies sales invoice number.';
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies item number.';
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies sales invoice posting date.';
                }
                field("Bonus Amount"; "Bonus Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies calculated bonus amount.';
                }
            }
        }
    }
}